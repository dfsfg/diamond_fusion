package assets.layout.abstract
{
	/**
	 * <h1>Абстрактный класс расположения элементов на экране</h1>
	 * <p>Базовый класс для всех классов, определяющих расположение визуальных элементов
	 * на экране.</p>
	 * <p>Содержит переменные, используемые для вычисления расположения элементов на конкретном экране
	 * на основе характеристик расположения этих же элементов на исходном экране.</p>
	 * */
	public class AbstractLayoutScalable
	{
		// константы, определяющие заданные разрешения экранов
		protected const MEDIUM_WIDTH:Number = 550;
		protected const MEDIUM_HEIGHT:Number = 750;
		
		protected const WIDTH_540:Number = 540;
		protected const HEIGHT_900:Number = 900;
		protected const HEIGHT_864:Number = 864;
		protected const HEIGHT_810:Number = 810;
		protected const HEIGHT_720:Number = 720;
		
		protected const HIGH_WIDTH:Number = 1080;
		protected const HIGH_HEIGHT:Number = 1920;
		
		/**
		 * <h1>Ширина области расположения элементов.</h1>
		 * <p>Определяется как ширина экрана в пикселах, для которого задается исходное конкретное расположение.</p>
		 * <p>Так, если расположение элементов задается для экрана 540х960, ширина области равна 540:
		 * <ul><li><i>_layout_width = 540</i></li></ul></p>
		 * <p>Используется в методах классов-наследников для вычисления X-координат элементов за пределами экрана.</p>
		 * */
		protected var _layout_width:Number;
		
		/**
		 * <h1>Высота области расположения элементов.</h1>
		 * <p>Определяется как высота экрана в пикселах, для которого задается исходное конкретное расположение.</p>
		 * <p>Так, если расположение элементов задается для экрана 540х960, высота области равна 960:
		 * <ul><li><i>_layout_height = 960</i></li></ul></p>
		 * */
		protected var _layout_height:Number;
		
		/**
		 * X-координата верхнего левого угла области расположения на конкретном экране.
		 * */
		protected var _x0:Number;
		
		/**
		 * Y-координата верхнего левого угла области расположения на конкретном экране.
		 * */
		protected var _y0:Number;
		
		/**
		 * масштаб
		 * */
		protected var _scale:Number;
		
		public function AbstractLayoutScalable()
		{
			init();
		}
		
		protected function init():void{
			trace("*--------------------------ERROR!----------------------------*");
			trace("Class AbstractLayoutScalable can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*------------------------------------------------------------*");
		}
		
		/**
		 * <h1>Определение параметров масштабирования</h1>
		 * <p>метод задает параметры масштабирования исходного расположения элементов
		 * для вычисления параметров расположения элементов на конкретном экране.</p>
		 * */
		public function defineScaleParameters(px0:Number = 0, py0:Number = 0, ps:Number = 1):void{
			
			_x0 = px0;
			_y0 = py0;
			_scale = ps;
		}
		
		/** вычисляет новую X-координату элемента за пределами экрана */
		protected function scale_long_displacement_x(px:Number):Number{
			return (px < _layout_width / 2) ? (px * _scale - 2 * _x0) : (px * _scale + 2 * _x0);
		}
		
		/** вычисляет новую Y-координату элемента за пределами экрана */
		protected function scale_long_displacement_y(py:Number):Number{
			return (py < _layout_height / 2) ? (py * _scale - 2 * _y0) : (py * _scale + 2 * _y0);
		}
		
		/** вычисляет новую X-координату элемента на экране */
		protected function scale_short_displacement_x(px:Number):Number{
			return (_x0 + _scale * px);
		}
		
		/** вычисляет новую Y-координату элемента на экране */
		protected function scale_short_displacement_y(py:Number):Number{
			return (_y0 + _scale * py);
		}
	}
}