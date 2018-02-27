package classes.game.elements
{
	//import assets.Library;
	
	import cc.wgd.physics.math.Vector2D;
	import cc.wgd.physics.objects.Particle;
	
	import classes.game.constants.Constants;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.filters.BlurFilter;
	import starling.filters.GlowFilter;
	import starling.textures.Texture;
	
	/**
	 * <h1>Элемент-бриллиант</h1>
	 * <p>Особенности:
	 * <ul><li>удалена кнопка, оставлено только изображение</li></ul>
	 * </p>
	 * */
	public class Element extends Particle implements IElement
	{
		public static const SWITCH_GRADUALLY:Boolean = true;
		public static const SWITCH_DIRECTLY:Boolean = false;
		
		private const NUM_OF_SWITCH_STEPS:int = 20;
		
		private const ANIMATE_STATE_PREPARE:int = 0;
		private const ANIMATE_STATE_RUN:int = 1;
		private const ANIMATE_STATE_FINALIZE:int = 2;
		
		private const FRAMES_TO_SKIP:int = 1;
		
		private var _id:VertexId;
		private var _texture:Texture;
		private var _image:Image;
		private var _type:int;
		private var _status:int;
		private var _side:Number;
		
		/** определяет характер движения элемента при обмене позициями - 
		 * будет ли он двигаться на новую позицию вдоль указанной траектории
		 * или же окажется в нужном месте сразу */
		private var _type_of_swaping:Boolean;
		
		// переменная создана для отличия обыкновенного элемента от бонусного,
		// который создается при уничтожении группы, состоящей из более чем 3 элементов.
		private var _isSpecial:Boolean;
		private var _bonusSpec:BonusSpec;
		
		// переменная задает время задержки взрыва для элементов, уничтожаемых
		// взрывными волнами, расходящимися от взорвавшихся бонусных элементов
		private var _delay:int;
		
		// переключение элементов
		private var _numSwitchPath:int;
		private var _startSwitchPoint:Point;
		private var _switchStep:int;
		private var _switchEnd:Point;
		
		// анимация подсказки хода
		private var _animateState:int;
		/** направление "движения" анимации - direction of animation <br />
		 * показывает, увеличивается или уменьшается размер и прозрачность кнопки */
		private var _doa:Boolean;
		/** прозрачность кнопки - button transparency */
		private var _bt:Number;
		/** шаг изменения прозрачности - button transparency step */
		private var _bts:Number;
		/** шаг изменения размера кнопки - side step */
		private var _ss:Number;
		/** время подсказки хода - time of animation */
		private var _toa:int;
		/** показывает, завершена ли анимация подсказки */
		private var _isAdviceCompleted:Boolean;
		
		/** количество пропускаемых кадров при перерисовке элемента для демонстрации "взрыва" */
		private var _explosionStep:int;
		
		public function Element(ptype:int, ptexture:Texture, px:Number, py:Number, pid:VertexId)
		{
			super();
			init(ptype, ptexture, px, py, pid);
		}
		
		private function init(ptype:int, ptexture:Texture, px:Number, py:Number, pid:VertexId):void{
			_isSpecial = false;
			_texture = ptexture;
			_image = new Image(_texture);
			_image.x = - _image.width / 2;
			_image.y = - _image.height / 2;
			addChild(_image);
			
			_id = new VertexId(pid.num_of_row, pid.num_in_row);
			_type = ptype;
			//_side = 20;
			_side = Constants.ELEMENT_SIDE;
			
			_switchEnd = new Point();
			
			_startSwitchPoint = new Point();
			_switchStep = 0;
			
			_delay = 0;
			_explosionStep = 0;
			
			this.pos2D = new Vector2D(px, py);
			//this.velo2D = new Vector2D(0, Constants.FALLING_VELOCITY);
			this._status = ElementConstants.STATUS_MOVED;
			this.useHandCursor = true;
		}
		
		/** устанавливает новые свойства уничтоженного элемента, позволяя использовать элемент многократно,
		 * а не уничтожать и создавать заново всякий раз, когда уничтожена группа элементов */
		public function recreate(ptype:int, ptexture:Texture, px:Number, py:Number, pid:VertexId):void{
			removeChild(_image);
			_image.dispose();
			init(ptype, ptexture, px, py, pid);
		}
		
		/**
		 * <h1>Тип элемента</h1>
		 * <p>Используется для проверки условия "3 в ряд".</p>
		 * */
		public function get type():int{
			return _type;
		}
		
		/**
		 * <h1>Установка статуса элемента</h1>
		 * Используется при изменении статуса элемента, когда:
		 * <ul>
		 * <li>движущийся элемент оказывается на своем месте в решетке, его статус <i>ElementConstants.STATUS_MOVED</i> 
		 * изменяется на<i>ElementConstants.STATUS_WAITED;</i> </li>
		 * <li>пользователь указывает пару элементов для обмена, их статус <i>ElementConstants.STATUS_WAITED</i>
		 * изменяется на <i>ElementConstants.STATUS_MOVED;</li>
		 * <li>после проверки условия "3 в ряд" обнаруживаются элементы для удаления, чей статус <i>ElementConstants.STATUS_WAITED</i>
		 * изменяется на <i>ElementConstants.STATUS_MUST_DIE</i>; </li>
		 * <li>взорвавшиеся элементы удаляются из массива элементов, их статус <i>ElementConstants.STATUS_MUST_DIE</i>
		 * изменяется на статус <i>ElementConstants.STATUS_DEAD</i>;</li>
		 * <li>и др.</li>
		 * </ul>
		 * */
		public function set status(pstatus:int):void{
			this._status = pstatus;
			if(pstatus == ElementConstants.STATUS_ALIVE){
				this.velo2D = new Vector2D(0, 0);
			}
			//if(_status == ElementConstants.STATUS_MUST_DIE) markMustDie();
		}
		
		/**
		 * <h1>Получение статуса элемента</h1>
		 * Используется при проверке для возможности перехода игры из одного состояния в другое.
		 * */
		public function get status():int{
			return this._status;
		}
		
		public function get vertexId():VertexId{
			return this._id;
		}
		
		public function set vertexId(pid:VertexId):void{
			//this._id.row = pid.row;
			//this._id.column = pid.column;
			this._id.copyValues(pid);
		}
		
		/**
		 * <h1>Показатель бонусности элемента</h1>
		 * <p>Переменная показывает, является ли текущий элемент бонусным или нет. Для хранения характеристик бонусного элемента
		 * используется переменная <i>_bonusSpec:BonusSpec</i>.</p>
		 * <p>Использование этой переменной неразрывно связано с использованием экземпляров класса <b>TreeNode</b> для представления
		 * уничтожаемых групп в виде связанного списка с древовидной структурой.</p>
		 * */
		public function get special():Boolean{
			return _isSpecial;
		}
		
		public function specialize():void{
			_bonusSpec = new BonusSpec();
			_isSpecial = true;
		}
		
		public function get bonusSpec():BonusSpec{
			return _bonusSpec;
		}
		
		public function set bonusSpec(pBonusSpec:BonusSpec):void{
			_bonusSpec = pBonusSpec;
		}
		
		public function get delay():int{
			return _delay;
		}
		
		public function set delay(pdelay:int):void{
			_delay = pdelay;
		}
		
		/**
		 * возвращает копию данного элемента
		 * */
		public function clone():Element{
			var element:Element = new Element(this._type, _texture, this.pos2D.x, this.pos2D.y, this._id);
			if(this.special){
				element.specialize();
				element.bonusSpec.copy(this.bonusSpec);
				element.resetButtonImage();
			}
			return element;
		}
		/*
		public function get buttonTexture():Texture{
			return _texture;
		}
		*/
		public function resetButtonImage(texture:Texture = null):void{
			if(texture){
				_texture = texture;
				//resetTempButtonImage(_texture);
				
				// удаляем старую кнопку...
				removeChild(_image);
				_image.dispose();
				// ... и добавляем новую

				_image = new Image(_texture);
				
				//_button.upState = _texture;
				_image.x = -_image.width / 2;
				_image.y = -_image.height /2;
				addChild(_image);
				
			}
		}
		
		private function resetTempButtonImage(texture:Texture):void{
			
			// удаляем старую кнопку...
			removeChild(_image);
			_image.dispose();
			// ... и добавляем новую
			
			_image = new Image(texture);
			
			//_button.upState = texture;
			_image.x = -_image.width / 2;
			_image.y = -_image.height /2;
			addChild(_image);
		}
		
		public function resetDefaultButtonImage():void{
			_image.alpha = 1;
			
			_image.scaleX = 1;
			_image.scaleY = 1;
			_image.x = -_image.width / 2;
			_image.y = -_image.height /2;
			
			//addChild(_image);
		}
		
		public function defineStartSwitchForwardConditions(endPoint:Vector2D, ptypeOfSwaping:Boolean = true):void{
			_type_of_swaping = ptypeOfSwaping;
			//trace("_type_of_swaping = " + _type_of_swaping)
			if((endPoint.x - this.pos2D.x > Constants.DIST_INACCURACY) && (this.pos2D.y - endPoint.y > Constants.DIST_INACCURACY)){
				// path 0
				_numSwitchPath = 0;
			}else if((endPoint.x - this.pos2D.x > Constants.DIST_INACCURACY) && (endPoint.y - this.pos2D.y > Constants.DIST_INACCURACY)){
				// path 1
				_numSwitchPath = 1;
			}else if((Math.abs(endPoint.x - this.pos2D.x) < Constants.DIST_INACCURACY) && (endPoint.y - this.pos2D.y > Constants.DIST_INACCURACY)){
				// path 2
				_numSwitchPath = 2;
			}else if((this.pos2D.x - endPoint.x > Constants.DIST_INACCURACY) && (endPoint.y - this.pos2D.y > Constants.DIST_INACCURACY)){
				// path 3
				_numSwitchPath = 3;
			}else if((this.pos2D.x - endPoint.x > Constants.DIST_INACCURACY) && (this.pos2D.y - endPoint.y > Constants.DIST_INACCURACY)){
				// path 4
				_numSwitchPath = 4;
			}else if((Math.abs(endPoint.x - this.pos2D.x) < Constants.DIST_INACCURACY) && (this.pos2D.y - endPoint.y > Constants.DIST_INACCURACY)){
				// path 5
				_numSwitchPath = 5;
			}
			
			
			
			
			
			if(_type_of_swaping == Element.SWITCH_GRADUALLY){
				_startSwitchPoint.x = this.pos2D.x;
				_startSwitchPoint.y = this.pos2D.y;
			}else{
				_startSwitchPoint.x = endPoint.x;
				_startSwitchPoint.y = endPoint.y;
			}
			
			_switchEnd.x = endPoint.x;
			_switchEnd.y = endPoint.y;
			
			this._status = ElementConstants.STATUS_SWITCHED;
		}
		
		public function moveSwitchedForward(paths:Vector.<Vector.<Point>>):void{
			if(_type_of_swaping == Element.SWITCH_GRADUALLY){
				if(_switchStep < paths[_numSwitchPath].length){
					var tx:Number = _startSwitchPoint.x + paths[_numSwitchPath][_switchStep].x;
					var ty:Number = _startSwitchPoint.y + paths[_numSwitchPath][_switchStep].y;
					
					this.pos2D = new Vector2D(tx, ty);
					_switchStep++;
				}else{
					this.pos2D = new Vector2D(_switchEnd.x, _switchEnd.y);
					this.status = ElementConstants.STATUS_ALIVE;
					_switchStep = 0;
				}
			}else{
				this.pos2D = new Vector2D(_switchEnd.x, _switchEnd.y);
				this.status = ElementConstants.STATUS_ALIVE;
				_switchStep = 0;
			}
			
			
		}
		
		public function defineStartSwitchBackwardConditions(endPoint:Vector2D):void{
			if((endPoint.x - this.pos2D.x > Constants.DIST_INACCURACY) && (this.pos2D.y - endPoint.y > Constants.DIST_INACCURACY)){
				// path 0
				_numSwitchPath = 3;
			}else if((endPoint.x - this.pos2D.x > Constants.DIST_INACCURACY) && (endPoint.y - this.pos2D.y > Constants.DIST_INACCURACY)){
				// path 1
				_numSwitchPath = 4;
			}else if((Math.abs(endPoint.x - this.pos2D.x) < Constants.DIST_INACCURACY) && (endPoint.y - this.pos2D.y > Constants.DIST_INACCURACY)){
				// path 2
				_numSwitchPath = 5;
			}else if((this.pos2D.x - endPoint.x > Constants.DIST_INACCURACY) && (endPoint.y - this.pos2D.y > Constants.DIST_INACCURACY)){
				// path 3
				_numSwitchPath = 0;
			}else if((this.pos2D.x - endPoint.x > Constants.DIST_INACCURACY) && (this.pos2D.y - endPoint.y > Constants.DIST_INACCURACY)){
				// path 4
				_numSwitchPath = 1;
			}else if((Math.abs(endPoint.x - this.pos2D.x) < Constants.DIST_INACCURACY) && (this.pos2D.y - endPoint.y > Constants.DIST_INACCURACY)){
				// path 5
				_numSwitchPath = 2;
			}
			_switchEnd.x = endPoint.x;
			_switchEnd.y = endPoint.y;
			_startSwitchPoint.x = this.pos2D.x;
			_startSwitchPoint.y = this.pos2D.y;
			
			_switchStep = NUM_OF_SWITCH_STEPS;
			
			this._status = ElementConstants.STATUS_SWITCHED
		}
		
		public function moveSwitchedBackward(paths:Vector.<Vector.<Point>>):void{
			if(_switchStep >= 0){
				var tx:Number = _switchEnd.x + paths[_numSwitchPath][_switchStep].x;
				var ty:Number = _switchEnd.y + paths[_numSwitchPath][_switchStep].y;
				this.pos2D = new Vector2D(tx, ty);
				_switchStep--;
			}else{
				this.pos2D = new Vector2D(_switchEnd.x, _switchEnd.y);
				this.status = ElementConstants.STATUS_ALIVE;
				_switchStep = 0;
			}
			
		}
		
		/**
		 * метод добавляет тень к выделенному элементу при щелчке пользователя на нем,
		 * выделяя его на фоне остальных. Так же может использоваться для выделения движущихся элементов.
		 * */
		public function highlight():void{
			this.filter = new GlowFilter();
		}
		
		/**
		 * метод отменяет выделение элемента, когда пользователь щелкает на нем повторно,
		 * или когда движущийся элемент достиг своей новой позиции.
		 * */
		public function downlight():void{
			this.filter = null;
		}
		
		/**
		 * Метод устанавливает размер рисунка элемента в зависимости от значения переменной _side,
		 * что используется для анимации его создания или исчезновения
		 * */
		protected function setImageSize():void{
			
			_image.scaleX = _side / Constants.ELEMENT_SIDE;
			_image.scaleY = _side / Constants.ELEMENT_SIDE;
			_image.x = - _image.width / 2;
			_image.y = - _image.height / 2;
		}
		/**
		 * Анимация взрыва обыкновенного бриллианта
		 * */
		public function explode():void{
			// проверяем элемент
			
			if(_side > 0){
				if(_explosionStep == FRAMES_TO_SKIP){
					setImageSize();
					_explosionStep = 0;
				}else{
					_explosionStep++;
				}
				
				_side -= 1;
			}else{
				_side = 0;
				_explosionStep = 0;
				this._status = ElementConstants.STATUS_DEAD;
			}
		}
		
		/**
		 * метод отсчитывает время, оставшееся до взрыва активированного элемента
		 * */
		public function countDelay():Boolean{
			var res:Boolean = false;
			_delay--;
			if(_delay == 0){
				this._status = ElementConstants.STATUS_EXPLODING;
				res = true;
			}
			return res;
		}
		
		/**
		 * анимация подсказки возможного хода
		 * */
		public function animateAdvice(ptexture:Texture = null):void{
			//trace("animate state = " + _animateState);
			if(ptexture){
				resetTempButtonImage(ptexture);
			}
			switch(_animateState){
				case ANIMATE_STATE_PREPARE:
					prepareAdvice();
					break;
				case ANIMATE_STATE_RUN:
					runAdvice();
					break;
				case ANIMATE_STATE_FINALIZE:
					finalizeAdvice();
					break;
			}
			
		}
		
		private function prepareAdvice():void{
			_isAdviceCompleted = false;
			_doa = false;
			_bt = 100;
			_bts = 3;
			_side = Constants.ELEMENT_SIDE;
			_ss = 0.5;
			_toa = 0;
			_animateState = ANIMATE_STATE_RUN;
			//trace("animate state = " + _animateState);
			//trace("animation prepared....");
		}
		
		private function runAdvice():void{
			if(_toa++ > Constants.DELAY_TO_SHOW_ADVICE / 3){
				_animateState = ANIMATE_STATE_FINALIZE;
				//_isAdviceCompleted = true;
			}
			if(_doa == false){
				_bt -= _bts;
				_side -= _ss;
				if(_bt < 50){
					_bt = 50;
					_doa = true;
				}
			}else{
				_bt += _bts;
				_side += _ss;
				if(_bt > 100){
					_bt = 100;
					_doa = false;
				}
			}
			_image.alpha = _bt / 100;
			setImageSize();
			//trace("animation runs...");
		}
		
		private function finalizeAdvice():void{
			resetButtonImage(_texture);
			_side = Constants.ELEMENT_SIDE;
			_image.alpha = 1;
			setImageSize();
			_animateState = ANIMATE_STATE_PREPARE;
			_isAdviceCompleted = true;
			//trace("animation stops");
		}
		
		public function get isAdviceCompleted():Boolean{
			return _isAdviceCompleted;
		}

		/*
		public function mark():void{
			var data:BitmapData = new BitmapData(10, 10, false, 0xff0000);
			var texture:Texture = Texture.fromBitmapData(data);
			var image:Image = new Image(texture);
			image.x = -image.width / 2;
			image.y = -image.height / 2;
			addChild(image);
		}
		*/
		public function clearify():void{
			removeChild(_image);
			_image.dispose();
			super.dispose();
			// NB! Текстуру не уничтожать! Она передается по ссылке!!!
		}
		
		
	}
}