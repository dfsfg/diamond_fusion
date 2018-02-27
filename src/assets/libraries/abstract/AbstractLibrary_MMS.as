package assets.libraries.abstract
{
	import starling.textures.Texture;

	/**
	 * <h1>Библиотека ресурсов MainMenuScreen</h1>
	 * <p>Класс объявляет, но не создает переменные, необходимые для создания MainMenuScreen, и методы доступа к этим переменным.</p>
	 * <p>Создание этих переменных осуществляется в одном из классов-наследников специально для конкретного разрешения экрана. </p>
	 * */
	public class AbstractLibrary_MMS extends AbstractLibraryScalable
	{
		/** текстура для кнопки <i>"Play"</i> */
		protected var _btnPlayTexture:Texture;
		
		/** текстура для кнопки <i>"Help"</i> */
		protected var _btnHelpTexture:Texture;
		
		/** текстура для кнопки <i>"Home"</i> */
		protected var _btnHomeTexture:Texture;
		
		/** текстура для бриллианта */
		protected var _diamondTexture:Texture;
		
		/** текстура для названия экрана */
		protected var _nameTexture:Texture;
		
		/** текстура для выпадающей панели кнопок уровней */
		protected var _dropDownPanelTexture:Texture;
		
		/** текстура для кнопки <i>"Back"</i> */
		protected var _btnBackTexture:Texture;
		
		/** текстура для кнопок уровней */
		protected var _btnLevelTexture:Texture;
		
		/** текстура для создания выпадающей панели установки режима игры */
		protected var _modePanelTexture:Texture;
		
		/** текстура для создания кнопки установки режима с ограничениями */
		protected var _btnStrictModeTexture:Texture;
		
		/** текстура для создания кнопки установки режима без ограничений */
		protected var _btnZenModeTexture:Texture;
		
		/** текстура для создания кнокпи вызова выпадающей панели установки режима игры */
		protected var _btnModeTexture:Texture;
		
		/** текстура для создания контура сияния вокруг выбранной кнопки режима */
		protected var _btnHighlightTexture:Texture;
		
		/** текстура для создания значка выполнения суперцели на кнопке уровня */
		protected var _cupGoldBtnTexture:Texture;
		
		/** текстура для создания значка выполнения главной цели на кнопке уровня */
		protected var _cupSilverBtnTexture:Texture;
		
		/** текстура для создания значка выполнения дополнительной цели на кнопке уровня */
		protected var _cupBronzeBtnTexture:Texture;
		
		/** текстура для создания значка невыполнения любой цели на кнопке уровня */
		protected var _cupFailedBtnTexture:Texture;
		
		/** текстуры для создания эффекта сверкания кнопки */
		protected var _btnEffectTextures:Vector.<Texture>;
		
		public function AbstractLibrary_MMS(ps:Number)
		{
			super(ps);
			init();
		}
		
		protected function init():void{
			trace("*-----------------------------ERROR!--------------------------------*");
			trace("Class AbstractLibraryMainMenuScreen can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*-------------------------------------------------------------------*");
		}
		
		/** возвращает текстуру для создания кнопки <i>"Play"</i> */
		public function get btnPlayTexture():Texture{
			return _btnPlayTexture;
		}
		
		/** возвращает текстуру для создания кнопки <i>"Help"</i> */
		public function get btnHelpTexture():Texture{
			return _btnHelpTexture;
		}
		
		/** возвращает текстуру для создания кнопки <i>"Home"</i> */
		public function get btnHomeTexture():Texture{
			return _btnHomeTexture;
		}
		
		/** возвращает текстуру для создания бриллианта */
		public function get diamondTexture():Texture{
			return _diamondTexture;
		}
		
		/** возвращает текстуру для создания названия экрана */
		public function get nameTexture():Texture{
			return _nameTexture;
		}
		
		/** возвращает текстуру для создания выпадающей панели */
		public function get dropDownPanelTexture():Texture{
			return _dropDownPanelTexture;
		}
		
		/** возвращает текстуру для создания кнопки <i>"Back"</i> */
		public function get btnBackTexture():Texture{
			return _btnBackTexture;
		}
		
		/** возвращает текстуру для создания кнопки уровня */
		public function get btnLevelTexture():Texture{
			return _btnLevelTexture;
		}
		
		/** возвращает текстуру для создания выпадающей панели установки режима игры */
		public function get modePanelTexture():Texture{
			return _modePanelTexture;
		}
		
		/** возвращает текстуру для создания кнопки установки режима игры с ограничениями */
		public function get btnStrictModeTexture():Texture{
			return _btnStrictModeTexture;
		}
		
		/** возвращает текстуру для создания кнопки установки режима игры без ограничений */
		public function get btnZenModeTexture():Texture{
			return _btnZenModeTexture;
		}
		
		/** возвращает текстуру для создания кнопки вызова выпадающей панели установки режима игры */
		public function get btnModeTexture():Texture{
			return _btnModeTexture;
		}
		
		/** возвращает текстуру для создания контура сияния вокруг выбранной кнопки режима */
		public function get btnHihglightTexture():Texture{
			return _btnHighlightTexture;
		}
		
		/** возвращает текстуру для создания значка выполнения суперцели на кнопке уровня */
		public function get cupGoldBtnTexture():Texture{
			return _cupGoldBtnTexture;
		}
		
		/** возвращает текстуру для создания значка выполнения главной цели на кнопке уровня */
		public function get cupSilverBtnTexture():Texture{
			return _cupSilverBtnTexture;
		}
		
		/** возвращает текстуру для создания значка выполнения дополнительной цели на кнопке уровня */
		public function get cupBronzeBtnTexture():Texture{
			return _cupBronzeBtnTexture;
		}
		
		/** возвращает текстуру для создания значка невыполнения любой цели на кнопке уровня */
		public function get cupFailedBtnTexture():Texture{
			return _cupFailedBtnTexture;
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
			_btnPlayTexture.dispose();
			_btnPlayTexture = null;
			
			_btnHelpTexture.dispose();
			_btnHelpTexture = null;
			
			_btnHomeTexture.dispose();
			_btnHomeTexture = null;
			
			_diamondTexture.dispose();
			_diamondTexture = null;
			
			_nameTexture.dispose();
			_nameTexture = null;
			
			_dropDownPanelTexture.dispose();
			_dropDownPanelTexture = null;
			
			_btnBackTexture.dispose();
			_btnBackTexture = null;
			
			_btnLevelTexture.dispose();
			_btnLevelTexture = null;
			
			_modePanelTexture.dispose();
			_modePanelTexture = null;
			
			_btnStrictModeTexture.dispose();
			_btnStrictModeTexture = null;
			
			_btnZenModeTexture.dispose();
			_btnZenModeTexture = null;
			
			_btnModeTexture.dispose();
			_btnModeTexture = null;
			
			_cupGoldBtnTexture.dispose();
			_cupGoldBtnTexture = null;
			
			_cupSilverBtnTexture.dispose();
			_cupSilverBtnTexture = null;
			
			_cupBronzeBtnTexture.dispose();
			_cupBronzeBtnTexture = null;
			
			_cupFailedBtnTexture.dispose();
			_cupFailedBtnTexture = null;
			
			for(var i:int = _btnEffectTextures.length - 1; i >= 0; i--){
				_btnEffectTextures[i].dispose();
				_btnEffectTextures.splice(i, 1);
			}
			_btnEffectTextures = null;
		}
		
	}
}