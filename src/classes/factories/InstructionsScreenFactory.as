package classes.factories
{
	import assets.libraries.l_550x750.Library;
	
	import cc.wgd.framework_on_starling.FrameWorkStates;
	import cc.wgd.framework_on_starling.GameFrameWork;
	
	import classes.screens.AnimatedScreen;
	import classes.screens.InstructionsScreenAnimated;
	import assets.layout.abstract.AbstractLayout_IS;
	import assets.libraries.abstract.AbstractLibrary_IS;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class InstructionsScreenFactory implements IScreenFactory
	{
		private var _layout:AbstractLayout_IS;
		private var _library:AbstractLibrary_IS;
		
		public function InstructionsScreenFactory(playout:AbstractLayout_IS, plibrary:AbstractLibrary_IS)
		{
			_layout = playout;
			_library = plibrary;
		}
		
		public function createScreen():AnimatedScreen
		{
			var screen:InstructionsScreenAnimated = new InstructionsScreenAnimated();
			
			screen.createObjectMovers();
			
			screen.layout = _layout;
			
			screen.prepareButtonCreation();
			screen.prepareImageCreation();
			
			// создаем название экрана
			
			screen.createAnimatedImage(ScreenObjectId.IMG_IS_NAME, _layout.img_is_name_pos_on_x, _layout.img_is_name_pos_on_y,
				_layout.img_is_name_pos_out_x, _layout.img_is_name_pos_out_y, _library.nameTexture);
			screen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_IS_NAME, screen);
			screen.setupAnimatedImageMover(ScreenObjectId.IMG_IS_NAME);
			screen.defineAnimatedMovement(ScreenObjectId.IMG_IS_NAME, 
				new Point(_layout.img_is_name_pos_out_x, _layout.img_is_name_pos_out_y),
				new Point(_layout.img_is_name_pos_on_x, _layout.img_is_name_pos_on_y), _layout.img_is_name_velo);
			
			// создаем изображение выпадающей панели
			
			screen.createAnimatedImage(ScreenObjectId.IMG_IS_DDP, _layout.img_is_ddp_pos_on_x, _layout.img_is_ddp_pos_on_y, 
				_layout.img_is_ddp_pos_out_x, _layout.img_is_ddp_pos_out_y, _library.dropDownPanelTexture);
			screen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_IS_DDP, screen);
			screen.setupAnimatedImageMover(ScreenObjectId.IMG_IS_DDP);
			screen.defineAnimatedMovement(ScreenObjectId.IMG_IS_DDP, 
				new Point(_layout.img_is_ddp_pos_out_x, _layout.img_is_ddp_pos_out_y),
				new Point(_layout.img_is_ddp_pos_on_x, _layout.img_is_ddp_pos_on_y), _layout.img_is_ddp_velo);
			
			// создаем кнопку главного меню
			
			screen.createAnimatedButton(ScreenObjectId.BTN_MAIN_MENU, FrameWorkStates.SS_SET_MAIN_MENU, 
				_layout.btn_main_menu_pos_on_x, _layout.btn_main_menu_pos_on_y,
				_layout.btn_main_menu_pos_out_x, _layout.btn_main_menu_pos_out_y, _library.btnMainMenuTexture);
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_MAIN_MENU, screen);
			screen.setupAnimatedButtonMover(ScreenObjectId.BTN_MAIN_MENU);
			screen.defineAnimatedMovement(ScreenObjectId.BTN_MAIN_MENU, 
				new Point(_layout.btn_main_menu_pos_out_x, _layout.btn_main_menu_pos_out_y),
				new Point(_layout.btn_main_menu_pos_on_x, _layout.btn_main_menu_pos_on_y), _layout.btn_main_menu_velo);
			
			// создаем изображения для анимации сверкания кнопки
			screen.createAnimatedImage(ScreenObjectId.IMG_GLOW_0, 0, 0, 0, 0, _library.btnEffectTextures[0]);
			screen.createAnimatedImage(ScreenObjectId.IMG_GLOW_1, 0, 0, 0, 0, _library.btnEffectTextures[1]);
			screen.createAnimatedImage(ScreenObjectId.IMG_GLOW_2, 0, 0, 0, 0, _library.btnEffectTextures[2]);
			screen.createAnimatedImage(ScreenObjectId.IMG_GLOW_3, 0, 0, 0, 0, _library.btnEffectTextures[3]);
			screen.createAnimatedImage(ScreenObjectId.IMG_GLOW_4, 0, 0, 0, 0, _library.btnEffectTextures[4]);
			
			screen.createBtnEffectImages();
			
			return screen;
		}
	}
}