package assets.libraries.abstract
{
	import starling.textures.Texture;

	/**
	 * <h1>Библиотека ресурсов ScoreBoard</h1>
	 * <p>Класс объявляет, но не создает переменные, необходимые для создания <i>ScoreBoard</i>, и методы доступа к этим переменным.</p>
	 * <p>Создание этих переменных осуществляется в одном из классов-наследников специально для конкретного разрешения экрана. </p>
	 * */
	public class AbstractLibrary_SB extends AbstractLibraryScalable
	{
		/** текстура для создания фона табло */
		protected var _bgTexture:Texture;
		
		/** текстура для создания кнопки <i>Music On</i> */
		protected var _btnMusicOnTexture:Texture;
		
		/** текстура для создания кнопки <i>Music Off</i> */
		protected var _btnMusicOffTexture:Texture;
		
		/** текстура для создания кнопки <i>Sound Volume</i> */
		protected var _btnSoundVolumeTexture:Texture;
		
		/** текстуры для создания изображений элементов-бриллиантов и препятствий */
		protected var _elTextures:Vector.<Texture>;
		
		/** текстура для создания препятствия */
		protected var _obstacle_Texture:Texture;
		
		/** текстура для изображения золотого кубка */
		protected var _cupGoldTexture:Texture;
		
		/** текстура для создания изображения выполненного задания */
		protected var _taskCompletedTexture:Texture;
		
		/** текстура для создания изображения невыполненного задания */
		protected var _taskFailedTexture:Texture;
		
		/** текстура для создания изображения счета */
		protected var _scoreTexture:Texture;
		
		/** текстура для создания полосы прогресса */
		protected var _progressBarViewerTexture:Texture;
		
		/** текстура для создания покрытия полосы прогресса */
		protected var _progressBarCoverTexture:Texture;
		
		public function AbstractLibrary_SB(ps:Number)
		{
			super(ps);
			init();
		}
		
		protected function init():void{
			trace("*-----------------------ERROR!----------------------------------*");
			trace("Class AbstractLibraryScoreBoard can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*---------------------------------------------------------------*");
		}
		
		/** возвращает текстуру для создания фона табло */
		public function get bgTexture():Texture{
			return _bgTexture;
		}
		
		/** возвращает текстуру для создания кнопки <i>Music On</i> */
		public function get btnMusicOnTexture():Texture{
			return _btnMusicOnTexture;
		}
		
		/** возвращает текстуру для создания кнопки <i>Music Off</i> */
		public function get btnMusicOffTexture():Texture{
			return _btnMusicOffTexture;
		}
		
		/** возвращает текстуру для создания кнопки <i>Sound Volume</i> */
		public function get btnSoundVolumeTexture():Texture{
			return _btnSoundVolumeTexture;
		}
		
		/** возвращает текстуры для создания изображений элементов-бриллиантов и препятствий */
		public function get elTextures():Vector.<Texture>{
			return _elTextures;
		}
		
		/** возвращает текстуру для создания препятствия */
		public function get obstacle_Texture():Texture{
			return _obstacle_Texture;
		}
		
		/** возвращает текстуру для создания изображения выполненного задания */
		public function get taskCompletedTexture():Texture{
			return _taskCompletedTexture;
		}
		
		/** возвращает текстуру для создания изображения невыполненного задания */
		public function get taskFailedTexture():Texture{
			return _taskFailedTexture;
		}
		
		/** возвращает текстуру для создания изображения иконки счета */
		public function get scoreTexture():Texture{
			return _scoreTexture;
		}
		
		/** возвращает текстуру для создания полосы прогресса */
		public function get progressBarViewerTexture():Texture{
			return _progressBarViewerTexture;
		}
		
		/** возвращает текстуру для создания покрытия полосы прогресса */
		public function get progressBarCoverTexture():Texture{
			return _progressBarCoverTexture;
		}
	}
}