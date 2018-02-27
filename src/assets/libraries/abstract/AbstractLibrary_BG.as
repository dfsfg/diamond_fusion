package assets.libraries.abstract
{
	import starling.textures.Texture;

	/**
	 * <h1>Библиотека ресурсов общего фона приложения</h1>
	 * <p>Класс объявляет, но не создает переменные, необходимые для создания общего фона приложения, и методы доступа к этим переменным.</p>
	 * <p>Это единственная библиотека ресурсов, которая имеет дело с размерами экрана, поскольку создает изображение, заполняющее весь экран,
	 * поверх которого располагаются все остальные визуальные элементы приложения, включая изображение фона игры.</p>
	 * <p>Создание этих переменных осуществляется в одном из классов-наследников специально для конкретного разрешения экрана. </p>
	 * */
	public class AbstractLibrary_BG extends AbstractLibraryScalable
	{		
		/** объект BitmapData для создания изображения фона */
		protected var _image_bg_data:Texture;
				
		public function AbstractLibrary_BG(ps:Number)
		{
			super(ps);
			init();
		}
		
		protected function init():void{
			trace("*-------------------------ERROR!--------------------------------*");
			trace("Class AbstractLibraryBackground can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*---------------------------------------------------------------*");
		}
		
		/** возвращает объект BitmapData для создания изображения фона */
		public function get image_bg_texture():Texture{
			return _image_bg_data;
		}
	}
}