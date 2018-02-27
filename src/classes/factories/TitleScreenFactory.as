package classes.factories
{
	import assets.layout.abstract.AbstractLayout_TS;
	import assets.libraries.abstract.AbstractLibrary_TS;
	import assets.libraries.l_550x750.Library;
	
	import cc.wgd.framework_on_starling.FrameWorkStates;
	
	import classes.screens.AnimatedScreen;
	import classes.screens.TitleScreenAnimated;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	/**
	 * <h1>Создатель экрана <i>TitleScreen</i></h1>
	 * <p>Класс имплементирует общий для всех создателей экранов интерфейс <i>IScreenFactory</i>,
	 * реализуя его единственный метод
	 * <ul><li><b><i>createScreen():AnimatedScreen;</i></b></li></ul>
	 * который создает и возвращает экземпляр класса
	 * <i>TitleScreenAnimated</i>, являющийся подклассом класса <i>AnimatedScreen</i>.</p>
	 * */
	public class TitleScreenFactory implements IScreenFactory
	{
		private var _layout:AbstractLayout_TS;
		private var _library:AbstractLibrary_TS;
		
		public function TitleScreenFactory(playout:AbstractLayout_TS, plibrary:AbstractLibrary_TS)
		{
			_layout = playout;
			_library = plibrary;
		}
		
		
		/**
		 * <h1>Создание <i>TitleScreen</i></h1>
		 * <p>метод создает и возвращает экземпляр класса <i>TitleScreenAnimated</i>.</p>
		 * */
		public function createScreen():AnimatedScreen
		{
			var titleScreen:TitleScreenAnimated = new TitleScreenAnimated();
			// создаем объекты, управляющие движением и прозрачностью визуальных объектов экрана
			titleScreen.createObjectMovers();
			titleScreen.createObjectSolvents();
			
			
			// передаем создаваемому экрану параметры расположения элементов
			titleScreen.layout = _layout;
			
			// подготавливаем создание кнопок
			titleScreen.prepareButtonCreation();
			
			// cоздаем текстуру для кнопки Start
			//var btnStartBitmapData:BitmapData = (new Library.BtnStart as Bitmap).bitmapData;
			//var btnStartTexture:Texture = Texture.fromBitmapData(btnStartBitmapData);
			// создаем кнопку
			titleScreen.createAnimatedButton(ScreenObjectId.BTN_MAIN_MENU, FrameWorkStates.SS_SET_MAIN_MENU, 
				_layout.btn_main_menu_pos_on_x, _layout.btn_main_menu_pos_on_y, 
				_layout.btn_main_menu_pos_out_x, _layout.btn_main_menu_pos_out_y, _library.btnStartTexture);
			// добавляем ее в список отображения экрана
			titleScreen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_MAIN_MENU, titleScreen);
			// создаем объект, управляющий ее движением
			titleScreen.setupAnimatedButtonMover(ScreenObjectId.BTN_MAIN_MENU);

			// освобождаем память
			//btnStartBitmapData.dispose();
			//btnStartTexture = null;
			
			// подготавливаем создание изображений
			titleScreen.prepareImageCreation();
			
			// создаем текстуру для бриллианта
			//var diamondBitmapData:BitmapData = (new Library.BlackDiamondBig as Bitmap).bitmapData;
			//var diamondTexture:Texture = Texture.fromBitmapData(diamondBitmapData);
			// создаем бриллиант
			titleScreen.createAnimatedImage(ScreenObjectId.IMG_DIAMOND_BIG, 
				_layout.img_diamond_big_pos_on_x, _layout.img_diamond_big_pos_on_y, 
				_layout.img_diamond_big_pos_on_x, _layout.img_diamond_big_pos_on_y, _library.diamondTexture, true);
			// добавляем его в список отображения экрана
			titleScreen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_DIAMOND_BIG, titleScreen);
			// создаем объект, управляющий его прозрачностью
			titleScreen.setupAnimatedImageSolvent(ScreenObjectId.IMG_DIAMOND_BIG);
			
			// осовобждаем память
			//diamondBitmapData.dispose();
			//diamondTexture = null;
			
			// создаем текстуру для надписи
			//var gameNameBitmapData:BitmapData = (new Library.NameDiamondFusion as Bitmap).bitmapData;
			//var gameNameTexture:Texture = Texture.fromBitmapData(gameNameBitmapData);
			// создаем надпись
			titleScreen.createAnimatedImage(ScreenObjectId.IMG_TITLE_NAME, 
				_layout.img_ts_name_pos_on_x, _layout.img_ts_name_pos_on_y, 
				_layout.img_ts_name_pos_out_x, _layout.img_ts_name_pos_out_y, _library.nameTexture);
			// добавляем ее в список отображения
			titleScreen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_TITLE_NAME, titleScreen);
			// создаем объект, управляющий ее движением
			titleScreen.setupAnimatedImageMover(ScreenObjectId.IMG_TITLE_NAME);

			// освобождаем память
			//gameNameBitmapData.dispose();
			//gameNameTexture = null;
			
			// задаем начальные параметры изменений - в данном случае изменения прозрачности бриллианта,
			// который появляется на экране, и лишь после его полного появления на сцене появляются кнопки
			titleScreen.defineAnimatedSolvence(ScreenObjectId.IMG_DIAMOND_BIG, 
				_layout.img_diamond_big_transparency_start, _layout.img_diamond_big_transparency_end, 
				_layout.img_diamond_big_transparency_step);
			
			// создаем изображения для анимации сверкания кнопки
			titleScreen.createAnimatedImage(ScreenObjectId.IMG_GLOW_0, 0, 0, 0, 0, _library.btnEffectTextures[0]);
			titleScreen.createAnimatedImage(ScreenObjectId.IMG_GLOW_1, 0, 0, 0, 0, _library.btnEffectTextures[1]);
			titleScreen.createAnimatedImage(ScreenObjectId.IMG_GLOW_2, 0, 0, 0, 0, _library.btnEffectTextures[2]);
			titleScreen.createAnimatedImage(ScreenObjectId.IMG_GLOW_3, 0, 0, 0, 0, _library.btnEffectTextures[3]);
			titleScreen.createAnimatedImage(ScreenObjectId.IMG_GLOW_4, 0, 0, 0, 0, _library.btnEffectTextures[4]);
			
			titleScreen.createBtnEffectImages();
			
			return titleScreen;
		}
	}
}