package assets.libraries.abstract
{
	import starling.textures.Texture;

	/**
	 * <h1>Библиотека ресурсов TitleScreen</h1>
	 * <p>Класс объявляет, но не создает переменные, необходимые для создания TitleScreen, и методы доступа к этим переменным.</p>
	 * <p>Создание этих переменных осуществляется в одном из классов-наследников специально для конкретного разрешения экрана. </p>
	 * */
	public class AbstractLibrary_TS extends AbstractLibraryScalable
	{
		/** текстура для создания кнопки <i>"Start"</i> */
		protected var _btnStartTexture:Texture;
		
		/** текстура для создания бриллианта */
		protected var _diamondTexture:Texture;
		
		/** текстура для создания названия игры */
		protected var _nameTexture:Texture;
		
		/** текстуры для создания эффекта сверкания кнопки */
		protected var _btnEffectTextures:Vector.<Texture>;
		
		public function AbstractLibrary_TS(ps:Number)
		{
			super(ps);
			init();
		}
		
		protected function init():void{
			trace("*---------------------------ERROR!-------------------------------*");
			trace("Class AbstractLibraryTitleScreen can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*----------------------------------------------------------------*");
		}
		
		/** возвращает текстуру для создания кнопки <i>"Start"</i> */
		public function get btnStartTexture():Texture{
			return _btnStartTexture;
		}
		
		/** возвращает текстуру для создания бриллианта */
		public function get diamondTexture():Texture{
			return _diamondTexture;
		}
		
		/** возвращает текстуру для создания названия игры */
		public function get nameTexture():Texture{
			return _nameTexture;
		}
		
		/** возвращает текстуры для создания эффекта сверкания кнопки */
		public function get btnEffectTextures():Vector.<Texture>{
			return _btnEffectTextures;
		}
		
		//////////////////////////////////////////////////////////////////////////////////
		///
		//	ПЕРЕГРУЗКА МЕТОДА БАЗОВОГО КЛАССА ДЛЯ ОЧИСТКИ ПАМЯТИ
		///
		//////////////////////////////////////////////////////////////////////////////////
		override public function clearify():void{
			_btnStartTexture.dispose();
			_btnStartTexture = null;
			
			_diamondTexture.dispose();
			_diamondTexture = null;
			
			_nameTexture.dispose();
			_nameTexture = null;
			
			for(var i:int = _btnEffectTextures.length - 1; i >= 0; i--){
				_btnEffectTextures[i].dispose();
				_btnEffectTextures.splice(i, 1);
			}
			_btnEffectTextures = null;
		}
	}
}