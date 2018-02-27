package classes.resolution
{	
	import classes.game.constants.Constants;
	/**
	 * <h1>Определитель разрешения экрана</h1>
	 * <p>Класс задает разрешения экранов, для которых созданы графические ресурсы и их расположение
	 * на сцене, а так же рассчитывает параметры масштабирования, если параметры экрана пользовательского устройства
	 * отличаются от заданных.</p>
	 * */
	public class ResolutionManager
	{
		// соотношения сторон экранов
		private const RATE_1_777:Number = 1.7778;
		private const RATE_1_666:Number = 1.6667;
		private const RATE_1_6:Number = 1.6;
		private const RATE_1_5:Number = 1.5;
		
		private const DEFINED_WIDTH_SIZE:Number = 1080;
		private const DEFINED_HEIGHT_SIZE:Number = 1920;
		
		private const GRAPHICS_HIGH:String = "graphics_high";
		private const GRAPHICS_MEDIUM:String = "graphics_medium";
		
		//private var _graphics_type:String;
		
		private var _width:Number;
		private var _height:Number;
		private var _deltaX:Number;
		private var _deltaY:Number;
		private var _scaleFactor:Number;
		private var _suitableRate:Number;
		
		private var _layoutManager:ILayoutManager;
		private var _libraryManager:ILibraryManager;
		
		public function ResolutionManager(pw:Number, ph:Number)
		{
			init(pw, ph);
		}
		
		public function get layoutManager():ILayoutManager{
			return _layoutManager;
		}
		
		public function get libraryManager():ILibraryManager{
			return _libraryManager;
		}
		
		private function init(pw:Number, ph:Number):void{
			_width = pw;
			_height = ph;
			
			var currentRate:Number = ph / pw;
			// находим наиболее подходящее соотношение размеров экранов
			//_suitableRate = rate(currentRate);
			_suitableRate = DEFINED_HEIGHT_SIZE / DEFINED_WIDTH_SIZE;
			// вычисляем параметры масштабирования и смещения
			scaleParameters(currentRate, _suitableRate);
			// создаем ресурсы и определяем их расположение
			
			_libraryManager = new LibraryManager_540x960(1);
			_layoutManager = new LayoutManager_540x960(0, 0, 1);
			/*
			_libraryManager = new LibraryManager_540x960(_scaleFactor);
			_layoutManager = new LayoutManager_540x960(_deltaX, _deltaY, _scaleFactor);
			*/
			
			//trace("_scaleFactor = " + _scaleFactor + ", _deltaX = " + _deltaX + ", _deltaY = " + _deltaY);
		}
		
		
		/** вычисление масштабирования размеров ресурсов и их расположения и смещения */
		private function scaleParameters(currentRate:Number, idealRate:Number):void{
			if(currentRate <= idealRate){
				_scaleFactor = _height / this.DEFINED_HEIGHT_SIZE;
				_deltaX = (_width - _scaleFactor * this.DEFINED_WIDTH_SIZE) / 2;
				_deltaY = 0;
			}else{
				_scaleFactor = _width / this.DEFINED_WIDTH_SIZE;
				_deltaX = 0;
				_deltaY = (_height - _scaleFactor * this.DEFINED_HEIGHT_SIZE) / 2;
			}
			// размеры экрана заданы 1080x1920, а ресурсы созданы для экрана в два раза меньше
			_scaleFactor *= Constants.SCALE_RATE;
		}
	}
}