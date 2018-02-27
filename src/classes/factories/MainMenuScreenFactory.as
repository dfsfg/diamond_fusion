package classes.factories
{
	import assets.layout.abstract.AbstractLayout_MMS;
	import assets.libraries.abstract.AbstractLibrary_MMS;
	import assets.libraries.l_550x750.Library;
	
	import cc.wgd.framework_on_starling.FrameWorkStates;
	
	import classes.game.constants.Mode;
	import classes.levels.LevelConditions;
	import classes.screens.AnimatedScreen;
	import classes.screens.MainMenuScreenAnimated;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * <h1>Создатель экрана <i>MainMenuScreen</i></h1>
	 * <p>Класс имплементирует общий для всех создателей экранов интерфейс <i>IScreenFactory</i>,
	 * реализуя его единственный метод
	 * <ul><li><b><i>createScreen():AnimatedScreen;</i></b></li></ul>
	 * который создает и возвращает экземпляр класса
	 * <i>TitleScreenAnimated</i>, являющийся подклассом класса <i>AnimatedScreen</i>.</p>
	 * */
	public class MainMenuScreenFactory implements IScreenFactory
	{
		private var _layout:AbstractLayout_MMS;
		private var _library:AbstractLibrary_MMS;
		
		public function MainMenuScreenFactory(playout:AbstractLayout_MMS, plibrary:AbstractLibrary_MMS)
		{
			_layout = playout;
			_library = plibrary;
		}
		
		public function createScreen():AnimatedScreen
		{
			var screen:MainMenuScreenAnimated = new MainMenuScreenAnimated();
			// создаем объекты, управляющие движением и прозрачностью визуальных элементов экрана
			screen.createObjectMovers();
			screen.createObjectSolvents();
			
			screen.layout = _layout;
			
			// подготавливаем создание кнопок
			screen.prepareButtonCreation();
			
			// создаем кнопки на экране
			
			// создаем кнопку Play
			screen.createAnimatedButton(ScreenObjectId.BTN_SHOW_BUTTON_PANEL, MainMenuScreenAnimated.DROP_DOWN_SHOW, 
				_layout.btn_show_panel_pos_on_x, _layout.btn_show_panel_pos_on_y, 
				_layout.btn_show_panel_pos_out_x, _layout.btn_show_panel_pos_out_y, _library.btnPlayTexture);
			// добавляем кнопку в список отображения экрана
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_SHOW_BUTTON_PANEL, screen);
			// создаем объект, управляющий ее движением
			screen.setupAnimatedButtonMover(ScreenObjectId.BTN_SHOW_BUTTON_PANEL);
			// задаем условия движения
			screen.defineAnimatedMovement(ScreenObjectId.BTN_SHOW_BUTTON_PANEL,
				new Point(_layout.btn_show_panel_pos_out_x, _layout.btn_show_panel_pos_out_y),
				new Point(_layout.btn_show_panel_pos_on_x, _layout.btn_show_panel_pos_on_y), _layout.btn_show_panel_velo);
	
			// создаем кнопку Mode
			screen.createAnimatedButton(ScreenObjectId.BTN_MODE, MainMenuScreenAnimated.MODE_PANEL_SHOW,
				_layout.btn_mode_pos_on_x, _layout.btn_mode_pos_on_y,
				_layout.btn_mode_pos_out_x, _layout.btn_mode_pos_out_y, _library.btnModeTexture);
			// добавляем кнопку в список отображения экрана
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_MODE, screen);
			// создаем объект, управляющий ее движением
			screen.setupAnimatedButtonMover(ScreenObjectId.BTN_MODE);
			// задаем условия движения
			screen.defineAnimatedMovement(ScreenObjectId.BTN_MODE,
				new Point(_layout.btn_mode_pos_out_x, _layout.btn_mode_pos_out_y),
				new Point(_layout.btn_mode_pos_on_x, _layout.btn_mode_pos_on_y), _layout.btn_mode_velo);
			
			// создаем кнопку Help
			screen.createAnimatedButton(ScreenObjectId.BTN_HELP, FrameWorkStates.SS_SET_INSTRUCTIONS, 
				_layout.btn_help_pos_on_x, _layout.btn_help_pos_on_y, 
				_layout.btn_help_pos_out_x, _layout.btn_help_pos_out_y, _library.btnHelpTexture);
			// добавляем кнопку в список отображения экрана
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_HELP, screen);
			// создаем объект, управляющий ее движением
			screen.setupAnimatedButtonMover(ScreenObjectId.BTN_HELP);
			// задаем условия движения
			screen.defineAnimatedMovement(ScreenObjectId.BTN_HELP, 
				new Point(_layout.btn_help_pos_out_x, _layout.btn_help_pos_out_y), 
				new Point(_layout.btn_help_pos_on_x, _layout.btn_help_pos_on_y), _layout.btn_help_velo);
			
			// создаем кнопку Home
			screen.createAnimatedButton(ScreenObjectId.BTN_HOME, FrameWorkStates.SS_SET_TITLE, 
				_layout.btn_home_pos_on_x, _layout.btn_home_pos_on_y, 
				_layout.btn_home_pos_out_x, _layout.btn_home_pos_out_y, _library.btnHomeTexture);
			// добавляем кнопку в список отображения экрана
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_HOME, screen);
			// создаем объект, управляющий ее движением
			screen.setupAnimatedButtonMover(ScreenObjectId.BTN_HOME);
			// задаем условия движения
			screen.defineAnimatedMovement(ScreenObjectId.BTN_HOME, new 
				Point(_layout.btn_home_pos_out_x, _layout.btn_home_pos_out_y), 
				new Point(_layout.btn_home_pos_on_x, _layout.btn_home_pos_on_y), _layout.btn_home_velo);
			
			// подготавливаем создание рисунков
			screen.prepareImageCreation();
			
			// создаем бриллиант, опускающийся сверху
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAMOND_SMALL, 
				_layout.img_diamond_small_pos_on_x, _layout.img_diamond_small_pos_on_y, 
				_layout.img_diamond_small_pos_out_x, _layout.img_diamond_small_pos_out_y, _library.diamondTexture);
			screen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_DIAMOND_SMALL, screen);
			screen.setupAnimatedImageMover(ScreenObjectId.IMG_DIAMOND_SMALL);
			// задаем условия растворения
			screen.defineAnimatedMovement(ScreenObjectId.IMG_DIAMOND_SMALL, 
				new Point(_layout.img_diamond_small_pos_out_x, _layout.img_diamond_small_pos_out_y), 
				new Point(_layout.img_diamond_small_pos_on_x, _layout.img_diamond_small_pos_on_y), _layout.img_diamond_small_velo);

			// создаем название экрана, плавно появляющееся до полной непрозрачности
			screen.createAnimatedImage(ScreenObjectId.IMG_MAIN_MENU_NAME, 
				_layout.img_main_menu_pos_on_x, _layout.img_main_menu_pos_on_y, 
				_layout.img_main_menu_pos_on_x, _layout.img_main_menu_pos_on_y, _library.nameTexture, true);
			screen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_MAIN_MENU_NAME, screen);
			screen.setupAnimatedImageSolvent(ScreenObjectId.IMG_MAIN_MENU_NAME);
			screen.defineAnimatedSolvence(ScreenObjectId.IMG_MAIN_MENU_NAME, _layout.img_main_menu_name_transparency_start, 
				_layout.img_main_menu_name_transparency_end, _layout.img_main_menu_name_transparency_step);
			

			// создаем рисунок
			screen.createAnimatedImage(ScreenObjectId.IMG_DROPDOWN_PANEL, 0, 0, 0, 0, _library.dropDownPanelTexture);
			
			// подготавливаем создание спрайта
			screen.prepareSpriteCreation();
			
			// создаем рисунок панели установки режима игры
			screen.createAnimatedImage(ScreenObjectId.IMG_MODE_PANEL, 0, 0, 0, 0, _library.modePanelTexture);
			// создаем спрайт, содержащий рисунок панели выбора режима игры
			screen.createAnimatedSprite(ScreenObjectId.SPR_MODE_PANEL,
				_layout.spr_dropdown_panel_pos_on_x, _layout.spr_dropdown_panel_pos_on_y,
				_layout.spr_dropdown_panel_pos_out_x, _layout.spr_dropdown_panel_pos_out_y);
			// добавляем рисунок в список отображения спрайта
			var parentContainer:Sprite = screen.getSpriteById(ScreenObjectId.SPR_MODE_PANEL);
			screen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_MODE_PANEL, parentContainer);
			
			screen.setupAnimatedSpriteMover(ScreenObjectId.SPR_MODE_PANEL);
			screen.addAnimatedSpriteToDisplayList(ScreenObjectId.SPR_MODE_PANEL, screen);
			
			// добавляем кнопки выбора режима игры
			screen.createAnimatedButton(ScreenObjectId.BTN_MODE_STRICT, MainMenuScreenAnimated.MODE_STRICT_MODE,
				_layout.btn_strict_mode_pos_on_x, _layout.btn_strict_mode_pos_on_y,
				_layout.btn_strict_mode_pos_on_x, _layout.btn_strict_mode_pos_on_y, _library.btnStrictModeTexture);
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_MODE_STRICT, parentContainer);
			
			screen.createAnimatedButton(ScreenObjectId.BTN_MODE_ZEN, MainMenuScreenAnimated.MODE_ZEN_MODE,
				_layout.btn_zen_mode_pos_on_x, _layout.btn_zen_mode_pos_on_y,
				_layout.btn_zen_mode_pos_on_x, _layout.btn_zen_mode_pos_on_y, _library.btnZenModeTexture);
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_MODE_ZEN, parentContainer);
			
			screen.createAnimatedImage(ScreenObjectId.BTN_HL, 0, 0, 0, 0, _library.btnHihglightTexture);
			
			// создаем спрайт, содержащий созданный рисунок панели кнопок и сами кнопки уровней
			screen.createAnimatedSprite(ScreenObjectId.SPR_DROPDOWN_PANEL, 
				_layout.spr_dropdown_panel_pos_on_x, _layout.spr_dropdown_panel_pos_on_y, 
				_layout.spr_dropdown_panel_pos_out_x, _layout.spr_dropdown_panel_pos_out_y);
			// добавляем рисунок в список отображения спрайта
			parentContainer = screen.getSpriteById(ScreenObjectId.SPR_DROPDOWN_PANEL);
			screen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_DROPDOWN_PANEL, parentContainer);

			// добавляем кнопки на выпадающую панель
			
			// создаем кнопку возврата
			screen.createAnimatedButton(ScreenObjectId.BTN_HIDE_BUTTON_PANEL, MainMenuScreenAnimated.DROP_DOWN_HIDE, 
				_layout.btn_hide_panel_pos_on_x, _layout.btn_hide_panel_pos_on_y, 
				_layout.btn_hide_panel_pos_on_x, _layout.btn_hide_panel_pos_on_y, _library.btnBackTexture);
			// добавляем ее на выпадающую панель
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_HIDE_BUTTON_PANEL, parentContainer);

			
			// создаем кнопку Play
			screen.createAnimatedButton(ScreenObjectId.BTN_PLAY, FrameWorkStates.SS_NEW_LEVEL, 
				_layout.btn_play_pos_on_x, _layout.btn_play_pos_on_y, 
				_layout.btn_play_pos_on_x, _layout.btn_play_pos_on_y, _library.btnPlayTexture);
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_PLAY, parentContainer);
			
			// создаем кнопку для первого - четвертого уровней
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_0, FrameWorkStates.SS_GO_TO_LEVEL_0, 
				_layout.btn_level_0_pos_on_x, _layout.btn_level_0_pos_on_y, 
				_layout.btn_level_0_pos_on_x, _layout.btn_level_0_pos_on_y, _library.btnLevelTexture, "1");
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_0, parentContainer);

			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_1, FrameWorkStates.SS_GO_TO_LEVEL_1, 
				_layout.btn_level_1_pos_on_x, _layout.btn_level_1_pos_on_y, 
				_layout.btn_level_1_pos_on_x, _layout.btn_level_1_pos_on_y, _library.btnLevelTexture, "2");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_2, FrameWorkStates.SS_GO_TO_LEVEL_2, 
				_layout.btn_level_2_pos_on_x, _layout.btn_level_2_pos_on_y, 
				_layout.btn_level_2_pos_on_x, _layout.btn_level_2_pos_on_y, _library.btnLevelTexture, "3");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_3, FrameWorkStates.SS_GO_TO_LEVEL_3, 
				_layout.btn_level_3_pos_on_x, _layout.btn_level_3_pos_on_y, 
				_layout.btn_level_3_pos_on_x, _layout.btn_level_3_pos_on_y, _library.btnLevelTexture, "4");
			
			//---------------------------------------------------------------------------------------------
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_4, FrameWorkStates.SS_GO_TO_LEVEL_4, 
				_layout.btn_level_4_pos_on_x, _layout.btn_level_4_pos_on_y, 
				_layout.btn_level_4_pos_on_x, _layout.btn_level_4_pos_on_y, _library.btnLevelTexture, "5");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_5, FrameWorkStates.SS_GO_TO_LEVEL_5, 
				_layout.btn_level_5_pos_on_x, _layout.btn_level_5_pos_on_y, 
				_layout.btn_level_5_pos_on_x, _layout.btn_level_5_pos_on_y, _library.btnLevelTexture, "6");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_6, FrameWorkStates.SS_GO_TO_LEVEL_6, 
				_layout.btn_level_6_pos_on_x, _layout.btn_level_6_pos_on_y, 
				_layout.btn_level_6_pos_on_x, _layout.btn_level_6_pos_on_y, _library.btnLevelTexture, "7");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_7, FrameWorkStates.SS_GO_TO_LEVEL_7, 
				_layout.btn_level_7_pos_on_x, _layout.btn_level_7_pos_on_y, 
				_layout.btn_level_7_pos_on_x, _layout.btn_level_7_pos_on_y, _library.btnLevelTexture, "8");
			
			//-------------------------------------------------------------------------------------------------
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_8, FrameWorkStates.SS_GO_TO_LEVEL_8, 
				_layout.btn_level_8_pos_on_x, _layout.btn_level_8_pos_on_y, 
				_layout.btn_level_8_pos_on_x, _layout.btn_level_8_pos_on_y, _library.btnLevelTexture, "9");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_9, FrameWorkStates.SS_GO_TO_LEVEL_9, 
				_layout.btn_level_9_pos_on_x, _layout.btn_level_9_pos_on_y, 
				_layout.btn_level_9_pos_on_x, _layout.btn_level_9_pos_on_y, _library.btnLevelTexture, "10");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_10, FrameWorkStates.SS_GO_TO_LEVEL_10, 
				_layout.btn_level_10_pos_on_x, _layout.btn_level_10_pos_on_y, 
				_layout.btn_level_10_pos_on_x, _layout.btn_level_10_pos_on_y, _library.btnLevelTexture, "11");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_11, FrameWorkStates.SS_GO_TO_LEVEL_11, 
				_layout.btn_level_11_pos_on_x, _layout.btn_level_11_pos_on_y, 
				_layout.btn_level_11_pos_on_x, _layout.btn_level_11_pos_on_y, _library.btnLevelTexture, "12");
			
			//----------------------------------------------------------------------------------------------------
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_12, FrameWorkStates.SS_GO_TO_LEVEL_12, 
				_layout.btn_level_12_pos_on_x, _layout.btn_level_12_pos_on_y, 
				_layout.btn_level_12_pos_on_x, _layout.btn_level_12_pos_on_y, _library.btnLevelTexture, "13");
					
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_13, FrameWorkStates.SS_GO_TO_LEVEL_13, 
				_layout.btn_level_13_pos_on_x, _layout.btn_level_13_pos_on_y, 
				_layout.btn_level_13_pos_on_x, _layout.btn_level_13_pos_on_y, _library.btnLevelTexture, "14");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_14, FrameWorkStates.SS_GO_TO_LEVEL_14, 
				_layout.btn_level_14_pos_on_x, _layout.btn_level_14_pos_on_y, 
				_layout.btn_level_14_pos_on_x, _layout.btn_level_14_pos_on_y, _library.btnLevelTexture, "15");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_15, FrameWorkStates.SS_GO_TO_LEVEL_15, 
				_layout.btn_level_15_pos_on_x, _layout.btn_level_15_pos_on_y, 
				_layout.btn_level_15_pos_on_x, _layout.btn_level_15_pos_on_y, _library.btnLevelTexture, "16");
			
			//----------------------------------------------------------------------------------------------------
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_16, FrameWorkStates.SS_GO_TO_LEVEL_16, 
				_layout.btn_level_16_pos_on_x, _layout.btn_level_16_pos_on_y, 
				_layout.btn_level_16_pos_on_x, _layout.btn_level_16_pos_on_y, _library.btnLevelTexture, "17");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_17, FrameWorkStates.SS_GO_TO_LEVEL_17, 
				_layout.btn_level_17_pos_on_x, _layout.btn_level_17_pos_on_y, 
				_layout.btn_level_17_pos_on_x, _layout.btn_level_17_pos_on_y, _library.btnLevelTexture, "18");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_18, FrameWorkStates.SS_GO_TO_LEVEL_18, 
				_layout.btn_level_18_pos_on_x, _layout.btn_level_18_pos_on_y, 
				_layout.btn_level_18_pos_on_x, _layout.btn_level_18_pos_on_y, _library.btnLevelTexture, "19");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_19, FrameWorkStates.SS_GO_TO_LEVEL_19, 
				_layout.btn_level_19_pos_on_x, _layout.btn_level_19_pos_on_y, 
				_layout.btn_level_19_pos_on_x, _layout.btn_level_19_pos_on_y, _library.btnLevelTexture, "20");
			
			//----------------------------------------------------------------------------------------------------
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_20, FrameWorkStates.SS_GO_TO_LEVEL_20, 
				_layout.btn_level_20_pos_on_x, _layout.btn_level_20_pos_on_y, 
				_layout.btn_level_20_pos_on_x, _layout.btn_level_20_pos_on_y, _library.btnLevelTexture, "21");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_21, FrameWorkStates.SS_GO_TO_LEVEL_21, 
				_layout.btn_level_21_pos_on_x, _layout.btn_level_21_pos_on_y, 
				_layout.btn_level_21_pos_on_x, _layout.btn_level_21_pos_on_y, _library.btnLevelTexture, "22");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_22, FrameWorkStates.SS_GO_TO_LEVEL_22, 
				_layout.btn_level_22_pos_on_x, _layout.btn_level_22_pos_on_y, 
				_layout.btn_level_22_pos_on_x, _layout.btn_level_22_pos_on_y, _library.btnLevelTexture, "23");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_23, FrameWorkStates.SS_GO_TO_LEVEL_23, 
				_layout.btn_level_23_pos_on_x, _layout.btn_level_23_pos_on_y, 
				_layout.btn_level_23_pos_on_x, _layout.btn_level_23_pos_on_y, _library.btnLevelTexture, "24");
			
			//--------------------------------------------------------------------------------------------------
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_24, FrameWorkStates.SS_GO_TO_LEVEL_24, 
				_layout.btn_level_24_pos_on_x, _layout.btn_level_24_pos_on_y, 
				_layout.btn_level_24_pos_on_x, _layout.btn_level_24_pos_on_y, _library.btnLevelTexture, "25");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_25, FrameWorkStates.SS_GO_TO_LEVEL_25, 
				_layout.btn_level_25_pos_on_x, _layout.btn_level_25_pos_on_y, 
				_layout.btn_level_25_pos_on_x, _layout.btn_level_25_pos_on_y, _library.btnLevelTexture, "26");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_26, FrameWorkStates.SS_GO_TO_LEVEL_26, 
				_layout.btn_level_26_pos_on_x, _layout.btn_level_26_pos_on_y, 
				_layout.btn_level_26_pos_on_x, _layout.btn_level_26_pos_on_y, _library.btnLevelTexture, "27");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_27, FrameWorkStates.SS_GO_TO_LEVEL_27, 
				_layout.btn_level_27_pos_on_x, _layout.btn_level_27_pos_on_y, 
				_layout.btn_level_27_pos_on_x, _layout.btn_level_27_pos_on_y, _library.btnLevelTexture, "28");
			
			//-------------------------------------------------------------------------------------------------
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_28, FrameWorkStates.SS_GO_TO_LEVEL_28, 
				_layout.btn_level_28_pos_on_x, _layout.btn_level_28_pos_on_y, 
				_layout.btn_level_28_pos_on_x, _layout.btn_level_28_pos_on_y, _library.btnLevelTexture, "29");
			
			screen.createAnimatedButton(ScreenObjectId.BTN_LEVEL_29, FrameWorkStates.SS_GO_TO_LEVEL_29, 
				_layout.btn_level_29_pos_on_x, _layout.btn_level_29_pos_on_y, 
				_layout.btn_level_29_pos_on_x, _layout.btn_level_29_pos_on_y, _library.btnLevelTexture, "30");
			
			
			
			// добавляем выпадающую панель в список отображения экрана
			screen.addAnimatedSpriteToDisplayList(ScreenObjectId.SPR_DROPDOWN_PANEL, screen);
			screen.setupAnimatedSpriteMover(ScreenObjectId.SPR_DROPDOWN_PANEL);
			
			(screen as MainMenuScreenAnimated).gameMode  = Mode.UNDEFINED;
			
			// создаем изображения для анимации сверкания кнопки
			screen.createAnimatedImage(ScreenObjectId.IMG_GLOW_0, 0, 0, 0, 0, _library.btnEffectTextures[0]);
			screen.createAnimatedImage(ScreenObjectId.IMG_GLOW_1, 0, 0, 0, 0, _library.btnEffectTextures[1]);
			screen.createAnimatedImage(ScreenObjectId.IMG_GLOW_2, 0, 0, 0, 0, _library.btnEffectTextures[2]);
			screen.createAnimatedImage(ScreenObjectId.IMG_GLOW_3, 0, 0, 0, 0, _library.btnEffectTextures[3]);
			screen.createAnimatedImage(ScreenObjectId.IMG_GLOW_4, 0, 0, 0, 0, _library.btnEffectTextures[4]);
			
			screen.createBtnEffectImages();
			
			/*
			// освобождаем память
			btnPlayBitmapData.dispose();
			btnPlayTexture = null;
			// освобождаем память
			btnHelpBitmapData.dispose();
			btnHelpTexture = null;
			// освобождаем память
			btnHomeBitmapData.dispose();
			btnHomeTexture = null;
			// освобождаем память
			dropDownBitmapData.dispose();
			dropDownTexture = null;
			btnBackBitmapData.dispose();
			btnBackTexture = null;
			btnLevel1BitmapData.dispose();
			btnLevel1Texture = null;
			btnLevel2BitmapData.dispose();
			btnLevel2Texture = null;
			btnLevel3BitmapData.dispose();
			btnLevel3Texture = null;
			*/
			
			return screen;
		}
		
		
	}
}