package classes.board
{
	import assets.layout.abstract.AbstractLayout_PB;
	
	import flash.geom.Rectangle;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.SubTexture;
	import starling.textures.Texture;
	
	public class ProgressBarLine extends Sprite
	{
		private var _width:Number;
		private var _height:Number;
		
		/** полоса прогресса */
		private var _bar:Image;
		
		/** текстура для изображения, находящегося над полосой прогресса */
		private var _coverTexture:Texture;
		
		/** изображение, находящееся над полосой прогресса */
		private var _cover:Image;
		
		/** максимальное отображаемое значение */
		private var _maxValue:Number;
		
		/** текущее отображаемое значение */
		private var _current:Number;
		
		public function ProgressBarLine(pbt:Texture, pct:Texture)
		{
			super();
			init(pbt, pct);
		}
		
		public function init(pbt:Texture, pct:Texture):void{
			_bar = new Image(pbt);
			
			_coverTexture = pct;
			_cover = new Image(pct);
			
			_width = _cover.width;
			_height = _cover.height;
			
			_bar.y = (_height - _bar.height) / 2;
			addChild(_bar);
			addChild(_cover);
		}
		
		public function set coverTexture(pt:Texture):void{
			_coverTexture = pt;
		}
		
		/**
		 * <h1>Установка максимального значения</h1>
		 * <p>метод устанавливает максимальное значение, соответствующее
		 * полной длине отображаемой полосы прогресса.</p>
		 * */
		public function set maxValue(pm:Number):void{
			_maxValue = pm;
		}
		
		/**
		 * <h1>Обновление отображаемой информации</h1>
		 * <p>метод обновляет текущее значение отслеживаемой величины
		 * и текущее состояние полосы прогресса</p>
		 * */
		public function update(pc:Number):void{
			_current = pc;
			
			var startPos:Number = (_current / _maxValue) * _width;
			
			// создаем текстуру
			var region:Rectangle = new Rectangle(startPos, 0, _width - startPos, _height);
			//var tempTexture:Texture = Texture.fromTexture(_coverTexture, region);
			var subTexture:SubTexture = new SubTexture(_coverTexture, region);
			// создаем новое изображение покрытия
			var tempCover:Image = new Image(subTexture);
			// размещаем новое покрытие над полосой прогресса и постоянным покрытием
			trace("current progress = " + _current);
			tempCover.x = startPos;
			
			addChild(tempCover);
			
			// удаляем постоянное покрытие
			if(_cover){
				if(_cover.parent){
					removeChild(_cover);
				}
			}
			
			// запоминаем новое покрытие как постоянное
			_cover = tempCover;
			
		}
	}
}