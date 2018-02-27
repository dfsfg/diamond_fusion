package assets.libraries.abstract
{
	import starling.textures.Texture;
	
	/**
	 * <h1>Библиотека ресурсов InstructionsScreen</h1>
	 * <p>Класс объявляет, но не создает переменные, необходимые для создания InstructionsScreen, и методы доступа к этим переменным.</p>
	 * <p>Создание этих переменных осуществляется в одном из классов-наследников специально для конкретного разрешения экрана. </p>
	 * */
	public class AbstractLibrary_IS extends AbstractLibraryScalable
	{
		/** текстура для названия экрана */
		protected var _nameTexture:Texture;
		
		/** текстура для выпадающей панели */
		protected var _dropDownPanelTexture:Texture;
		
		/** текстура для кнопки <i>"Main Menu"</i> */
		protected var _btnMainMenuTexture:Texture;
		
		/** текстуры для создания эффекта сверкания кнопки */
		protected var _btnEffectTextures:Vector.<Texture>;
		
		public function AbstractLibrary_IS(ps:Number)
		{
			super(ps);
			init();
		}
		
		protected function init():void{
			trace("*-----------------------------ERROR!------------------------------------*");
			trace("Class AbstractLibraryInstructionsScreen can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*-----------------------------------------------------------------------*");
		}
		
		/** возвращает текстуру для создания названия экрана */
		public function get nameTexture():Texture{
			return _nameTexture;
		}
		
		/** возвращает текстуру для создания выпадающей панели */
		public function get dropDownPanelTexture():Texture{
			return _dropDownPanelTexture;
		}
		
		/** возвращает текстуру для создания кнопки <i>"Main Menu"</i> */
		public function get btnMainMenuTexture():Texture{
			return _btnMainMenuTexture;
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
			_nameTexture.dispose();
			_nameTexture = null;
			
			_dropDownPanelTexture.dispose();
			_dropDownPanelTexture = null;
			
			_btnMainMenuTexture.dispose();
			_btnMainMenuTexture = null;
			
			for(var i:int = _btnEffectTextures.length - 1; i >= 0; i--){
				_btnEffectTextures[i].dispose();
				_btnEffectTextures.splice(i, 1);
			}
			_btnEffectTextures = null;
		}
	}
}