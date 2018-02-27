package assets.libraries.abstract
{
	import flash.display.Bitmap;
	
	import starling.textures.Texture;

	/**
	 * <h1>Библиотека ресурсов класса Game_DFSW_4_0_0</h1>
	 * <p>Класс объявляет, но не создает переменные, необходимые для создания экземпляра класса Game_DFSW_4_0_0, и методы доступа к этим переменным.</p>
	 * <p>Создание этих переменных осуществляется в одном из классов-наследников специально для конкретного разрешения экрана. </p>
	 * */
	public class AbstractLibrary_Game extends AbstractLibraryScalable
	{
		/** текстура для создания фона игры */
		protected var _game_bg:Texture;
		
		/** текстура для создания гексагона */
		protected var _hexagonTexture:Texture;
		
		/** массив объектов класса Bitmap для создания элементов */
		protected var _elBitmaps:Vector.<Bitmap>;
		
		/** массив объектов класса Bitmap для создания бонусных свойств элементов */
		protected var _bonusBitmaps:Vector.<Bitmap>;
		
		/** массив текстур для создания слоев препятствия */
		protected var _obstacleTextures:Vector.<Texture>;
		
		/** текстура для кнопки выхода в главное меню */
		protected var _btn_main_menu_texture:Texture;
		
		/** текстура для кнопки завершения уровня */
		protected var _btn_next_texture:Texture;
		
		/** текстура для нижней панели кнопок */
		protected var _down_panel_texture:Texture;
		
		/** текстура предупреждения выхода в главное меню */
		protected var _ddp_menu_bg_texture:Texture;
		
		/** текстура пояснения кнопки <i>"Next"</i> */
		protected var _ddp_next_texture:Texture;
		
		/** запрос на подтверждение перехода на новый уровень */
		protected var _ddp_next_confirm_texture:Texture;
		
		/** текстура для создания кнопки <i>"Yes"</i> на выпадающей панели */
		protected var _btn_ddp_yes_texture:Texture;
		
		/** текстура для создания кнопки <i>"No"</i> на выпадающей панели */
		protected var _btn_ddp_no_texture:Texture;
		
		/** фон выпадающей панели с сообщением */
		protected var _ddp_bg_texture:Texture;
		
		/** запрос на подтверждение выхода в главное меню, если все цели уровня достигнуты */
		protected var _ddp_menu_level_completed_texture:Texture;
		
		/** запрос на подтверждение выхода в главное меню, если ни уровень ещё не пройден */
		protected var _ddp_menu_level_failed_texture:Texture;
		
		/** запрос на подтверждение выхода в главное меню, если не все цели уровня достигнуты */
		protected var _ddp_menu_level_passed_texture:Texture;
		
		
		
		public function AbstractLibrary_Game(ps:Number)
		{
			super(ps);
			init();
		}
		
		protected function init():void{
			trace("*------------------------ERROR!---------------------------*");
			trace("Class AbstractLibraryGame can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*---------------------------------------------------------*");
		}
		
		/** возвращает текстуру фона игры */
		public function get gameBg():Texture{
			return _game_bg;
		}
		
		/** возвращает текстуру для создания гексагона */
		public function get hexagonTexture():Texture{
			return _hexagonTexture;
		}
		
		/** возвращает массив объектов класса Bitmap для создания элементов */
		public function get elBitmaps():Vector.<Bitmap>{
			return _elBitmaps;
		}
		
		/** возвращает массив объектов класса Bitmap для создания бонусных свойств элементов */
		public function get bonusBitmaps():Vector.<Bitmap>{
			return _bonusBitmaps;
		}
		
		/** возвращает массив текстур для создания слоев препятствия */
		public function get obstacleTextures():Vector.<Texture>{
			return _obstacleTextures;
		}
		
		/** возвращает текстуру для кнопки выхода в главное меню */
		
		public function get btnMainMenuTexture():Texture{
			return _btn_main_menu_texture;
		}
		
		
		/** возвращает текстуру для кнопки завершения уровня */
		public function get btnNextTexture():Texture{
			return _btn_next_texture;
		}
		
		/** возвращает текстуру для нижней панели кнопок */
		public function get down_panel_texture():Texture{
			return _down_panel_texture;
		}
		
		/** возвращает текстуру для создания предупреждения перед выходом в главное меню */
		
		public function get ddp_menu_bg_texture():Texture{
			return _ddp_menu_bg_texture;
		}
		
		/** возвращает текстуру для создания пояснения роли кнопки <i>Next</i> */
		public function get ddp_next_texture():Texture{
			return _ddp_next_texture;
		}
		
		/** возвращает текстуру для создания запроса на подтверждение перехода на следующий уровень */
		public function get ddp_next_confirm_texture():Texture{
			return _ddp_next_confirm_texture;
		}
		
		/** возвращает текстуру для создания кнопки <i>"Yes"</i> на выпадающей панели */
		public function get btn_ddp_yes_texture():Texture{
			return _btn_ddp_yes_texture;
		}
		
		/** возвращает текстуру для создания кнопки <i>"No"</i> на выпадающей панели */
		public function get btn_ddp_no_texture():Texture{
			return _btn_ddp_no_texture;
		}
		/** возвращает текстуру для создания запроса на подтверждение выхода в главное меню, если все цели уровня достигнуты */
		public function get ddp_menu_level_completed_texture():Texture{
			return _ddp_menu_level_completed_texture;
		}
		
		/** возвращает текстуру для создания запроса на подтверждение выхода в главное меню, если ни уровень ещё не пройден */
		public function get ddp_menu_level_failed_texture():Texture{
			return _ddp_menu_level_failed_texture;
		}
		
		/** возвращает текстуру для создания запроса на подтверждение выхода в главное меню, если не все цели уровня достигнуты */
		public function get ddp_menu_level_passed_texture():Texture{
			return _ddp_menu_level_passed_texture;
		}
		
	}
}