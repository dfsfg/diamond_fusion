package classes.game.obstacles
{
	import cc.wgd.physics.math.Vector2D;
	import cc.wgd.physics.objects.Particle;
	
	import classes.game.constants.Constants;
	import classes.game.elements.ElementConstants;
	import classes.managers.IScreenObjectScaler;
	import classes.managers.IScreenObjectSolvent;
	import classes.managers.SteadyScaler;
	import classes.managers.SteadySolvent;
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	/**
	 * <h1>Препятствие, которое нужно уничтожить</h1>
	 * <p>Объекты этого класса размещаются в узлах гексагональной решетки под элементами-бриллиантами. Каждый объект этого класса
	 * имеет определенное количество "здоровья", которое определяет, сколько бриллиантов нужно уничтожить над этим препятствием,
	 * чтобы уничтожить само препятствие.</p>
	 * */
	public class Obstacle extends Particle
	{
		/** тип препятствия */
		private var _type:int;
		
		/** состояние */
		private var _status:int;
		
		/** массив текстур для создания изображений */
		private var _textures:Vector.<Texture>;
		
		/** изображения, отображающие внешний вид препятствия, и сменяющие друг друга по мере его "разрушения" */
		private var _images:Vector.<Image>;
		
		/**
		 * <h1>"Здоровье" препятствия</h1>
		 * <p>Отражает количество "ударов", которое может выдержать препятствие до полного уничтожения.
		 * Приравнивается количеству изображений, отображающих все возможные состояния препятствия.</p>
		 * <p>"Ударом" считается уничтожение элемента, размещенного над препятствием. После каждого такого "удара"
		 * уровень "здоровья" препятствия уменьшается на 1, а изображение препятствия изменяется для отображения
		 * нового состояния.</p>
		 * <p>Препятствие считается уничтоженным, когда его уровень здоровья становится равным нулю.</p>
		 * <p>В случае для данной игры препятствие может иметь два состояния:
		 * <ul>
		 * <li><i>неповрежденное</i> - препятствие, не испытавшее ни одного удара (<i>_health = 2);</li>
		 * <li><i>поврежденное</i> - препятствие, испытавшее один удар (<i>_health = 1).</li></ul>
		 * После второго удара препятствие уничтожается (<i>_health = 0).</p>
		 * */
		private var _health:int;
						
		/** управляет растворением изображения текущего состояния */
		private var _solvent:IScreenObjectSolvent;
		
		/** управляет масштабированием изображения текущего состояния */
		private var _scaler:IScreenObjectScaler;
		
		
		public function Obstacle(ptextures:Vector.<Texture>, px:Number, py:Number)
		{
			super();
			init(ptextures, px, py);
		}
		
		private function init(ptextures:Vector.<Texture>, px:Number, py:Number):void{
			_textures = ptextures;
			this.pos2D = new Vector2D(px, py);
			this._status = ElementConstants.STATUS_ALIVE;
			this._type = ElementConstants.TYPE_SLEEPING;
			
		}
				
		/** подготавливает препятствие к взрыву */
		public function activate():void{
			this._status = ElementConstants.STATUS_EXPLODING;
			// подготавливаем менеджеры, управляющие верхним изображением
			var i:int = _images.length - 1;
			if(i >= 0){
				_solvent = new SteadySolvent(_images[i]);
				_scaler = new SteadyScaler(_images[i]);
				
				_solvent.defineSolution(100, 0, -5);
				_scaler.defineScaling(1, 0.1, 0.05);
			}
			
			
		}
		
		/** деактивирует взрывающиеся элементы и возвращает сообщение о том, нужно ли добавить этот элемент к счету уровня */
		public function deactivate():Boolean{
			var addToScore:Boolean = false;
			if(_images){
				var i:int = _images.length - 1;
				if(_solvent){
					this.removeChild(_images[i]);
					_images.splice(i, 1);
					_health = _images.length;
					
					_solvent = null;
					_scaler = null;
					
					this._status = ElementConstants.STATUS_ALIVE;
					
					if(_health > 0) this._status = ElementConstants.STATUS_ALIVE;
					else {
						this._status = ElementConstants.STATUS_DEAD;
						addToScore = true;
					}
				}
			}
			
			return addToScore;
		}
		
		/** "взрывает" препятствие после "удара" */
		public function explode():void{
			var done:Boolean = true;
			if(_images){
				// выбираем изображение, находящееся на самом верху списка отображения,
				// которое отображает текущее состояние препятствия
				var i:int = _images.length - 1;
				
				// исполняем менеджеры, уравляющие этим изображением - они установлены ранее
				// и не нуждаются в номере изображения
				if(!_solvent){
					activate();
				}
				if(_solvent){
					_solvent.solve();
					if(_solvent.isSolving) done = false;
					
					_scaler.scale();
					if(_scaler.isScaling()) done = false;
					
					if(done){
						this.removeChild(_images[i]);
						_images.splice(i, 1);
						_health = _images.length;
						
						_solvent = null;
						_scaler = null;
						
						this._status = ElementConstants.STATUS_ALIVE;
						
						if(_health > 0) this._status = ElementConstants.STATUS_ALIVE;
						else this._status = ElementConstants.STATUS_DEAD;
						trace("this is from obstacle - exploding is finished...");
					}
				}
			}
			
			
		}
		
		/** устанавливает состояние */
		public function set status(pstatus:int):void{
			_status = pstatus;
		}
		
		/** возвращает состояние препятствия */
		public function get status():int{
			return _status;
		}
			
		
		/** устанавливает тип препятствия, а так же создает необходимые рисунки на основе заданных текстур */
		public function set type(ptype:int):void{
			// устанавливаем тип препятствия
			_type = ptype;
			// создаем необходимые изображения, каждый раз создавая новый массив изображений
			// и не забываем уничтожить его в конце уровня - на следующем уровне он может не понадобиться
			_images = new Vector.<Image>;
			var tempImage:Image;
			
			switch(_type){
				case ElementConstants.TYPE_GLASS:
					// препятствие "Стекло" состоит только из одного изображения,
					// которое создается из текстуры, хранящейся в массиве под номером 1
					 tempImage = new Image(_textures[1]);
					 tempImage.x = -tempImage.width / 2;
					 tempImage.y = -tempImage.height / 2;
					_images.push(tempImage);
					addChild(tempImage);
					break;
				case ElementConstants.TYPE_STONE:
					// препятствие "Камень" состоит из двух изображений:
					// изображения камня, создаваемого из тектруры, хранящейся в массиве под номером 0...
					tempImage = new Image(_textures[0]);
					tempImage.x = -tempImage.width / 2;
					tempImage.y = -tempImage.height / 2;
					_images.push(tempImage);
					addChild(tempImage);
					// ..и находящегося поверх него изображения стекла,
					// создаваемого из текстуры, хранящейся под номером 1
					tempImage = new Image(_textures[1]);
					tempImage.x = -tempImage.width / 2;
					tempImage.y = -tempImage.height / 2;
					_images.push(tempImage);
					addChild(tempImage);
					break;
			}
			_health = _images.length;
		}
		
		/** возвращает тип препятствия */
		public function get type():int{
			return _type;
		}
		
		/** деактивирует невзорвавшееся препятствие, переводя его в неактивное состояние,
		 * и восстанавливает статус взорвавшегося */
		public function reset():void{
			// деактивируем препятствие
			_type = ElementConstants.TYPE_SLEEPING;
			// удаляем изображения из списка отображения
			if(_images){
				for(var i:int = _images.length - 1; i >=0; i--){
					removeChild(_images[i]);
					_images.splice(i, 1);
				}
				_images = null;
			}
			_status = ElementConstants.STATUS_ALIVE;
			//_delay = 0;
		}
			
		
	}
}