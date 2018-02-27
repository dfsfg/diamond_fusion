package classes.factories
{
	import assets.libraries.l_550x750.Library;
	
	import cc.wgd.framework_on_starling.FrameWorkStates;
	
	import classes.screens.AnimatedScreen;
	import classes.screens.LevelOverScreenAnimated;
	import assets.layout.abstract.AbstractLayout_LOS;
	import assets.libraries.abstract.AbstractLibrary_LOS;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class LevelOverScreenFactory implements IScreenFactory
	{
		private var _layout:AbstractLayout_LOS;
		private var _library:AbstractLibrary_LOS;
		
		public function LevelOverScreenFactory(playout:AbstractLayout_LOS, plibrary:AbstractLibrary_LOS)
		{
			_layout = playout;
			_library = plibrary;
		}
		
		public function createScreen():AnimatedScreen
		{
			var screen:LevelOverScreenAnimated = new LevelOverScreenAnimated();
			// создаем движители
			screen.createObjectMovers();
			
			screen.layout = _layout;
			
			// подготавливаем создание изображений
			screen.prepareImageCreation();
			
			// создаем заголовки экрана
			// "Level completed"
			
			screen.createAnimatedImage(ScreenObjectId.IMG_LOS_COMPLETED, 
				_layout.img_los_name_pos_on_x, _layout.img_los_name_pos_on_y, 
				_layout.img_los_name_pos_out_x, _layout.img_los_name_pos_out_y, _library.nameCompletedTexture);
			screen.setupAnimatedImageMover(ScreenObjectId.IMG_LOS_COMPLETED);
			
			// "Level passed"
			
			screen.createAnimatedImage(ScreenObjectId.IMG_LOS_PASSED, 
				_layout.img_los_name_pos_on_x, _layout.img_los_name_pos_on_y, 
				_layout.img_los_name_pos_out_x, _layout.img_los_name_pos_out_y, _library.namePassedTexture);
			screen.setupAnimatedImageMover(ScreenObjectId.IMG_LOS_PASSED);
			
			// "Level failed"
			
			screen.createAnimatedImage(ScreenObjectId.IMG_LOS_FAILED, 
				_layout.img_los_name_pos_on_x, _layout.img_los_name_pos_on_y, 
				_layout.img_los_name_pos_out_x, _layout.img_los_name_pos_out_y, _library.nameFailedTexture);
			screen.setupAnimatedImageMover(ScreenObjectId.IMG_LOS_FAILED);
			
			// создаем спрайт-носитель для выпадающей панели
			screen.prepareSpriteCreation();
			screen.createAnimatedSprite(ScreenObjectId.SPR_LOS_DDP, 
				_layout.spr_los_ddp_pos_on_x, _layout.spr_los_ddp_pos_on_y, 
				_layout.spr_los_ddp_pos_out_x, _layout.spr_los_ddp_pos_out_y);
			screen.addAnimatedSpriteToDisplayList(ScreenObjectId.SPR_LOS_DDP, screen);
			screen.setupAnimatedSpriteMover(ScreenObjectId.SPR_LOS_DDP);
			
			var ps:Sprite = screen.getSpriteById(ScreenObjectId.SPR_LOS_DDP);
			
			// добавляем изображение панели
			screen.createAnimatedImage(ScreenObjectId.IMG_LOS_DDP, 0, 0, 0, 0, _library.dropDownPanelTexture);
			screen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_LOS_DDP, ps);
			
			// добавляем на спрайт визуальные элементы
			// cups
			
			screen.createAnimatedImage(ScreenObjectId.IMG_LOS_CUP_COMPLETED_GOLD, 
				_layout.img_super_cup_x, _layout.img_super_cup_y, 
				_layout.img_super_cup_x, _layout.img_super_cup_y, _library.cupGoldTexture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_LOS_CUP_COMPLETED_SILVER, 
				_layout.img_primary_cup_x, _layout.img_primary_cup_y, 
				_layout.img_primary_cup_x, _layout.img_primary_cup_y, _library.cupSilverTexture);
			
			
			screen.createAnimatedImage(ScreenObjectId.IMG_LOS_CUP_COMPLETED_BRONZE, 
				_layout.img_secondary_cup_x, _layout.img_secondary_cup_y, 
				_layout.img_secondary_cup_x, _layout.img_secondary_cup_y, _library.cupBronzeTexture);
			
			// три одинаковых пустых кубка - по одному для каждой цели
			
			screen.createAnimatedImage(ScreenObjectId.IMG_LOS_CUP_FAILED_GOLD, 
				_layout.img_super_cup_x, _layout.img_super_cup_y, 
				_layout.img_super_cup_x, _layout.img_super_cup_y, _library.cupFailedTexture);
			
			trace("gold cup: x = " + _layout.img_super_cup_x + ", y = " + _layout.img_super_cup_y);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_LOS_CUP_FAILED_SILVER, 
				_layout.img_primary_cup_x, _layout.img_primary_cup_y, 
				_layout.img_primary_cup_x, _layout.img_primary_cup_y, _library.cupFailedTexture);
			
			trace("silver cup: x = " + _layout.img_primary_cup_x + ", y = " + _layout.img_primary_cup_y);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_LOS_CUP_FAILED_BRONZE, 
				_layout.img_secondary_cup_x, _layout.img_secondary_cup_y, 
				_layout.img_secondary_cup_x, _layout.img_secondary_cup_y, _library.cupFailedTexture);
			
			trace("bronze cup: x = " + _layout.img_secondary_cup_x + ", y = " + _layout.img_secondary_cup_y);
			
			// создать изображение счета 
			screen.createAnimatedImage(ScreenObjectId.IMG_SCORE_ICON,
				_layout.img_super_goal_x, _layout.img_super_goal_y, 
				_layout.img_super_goal_x, _layout.img_super_goal_y, _library.scoreIconTexture);
			
			// создаем изображения бриллиантов для отображения заданий
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_0, 0, 0, 0, 0, _library.diam_0_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_1, 0, 0, 0, 0, _library.diam_1_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_2, 0, 0, 0, 0, _library.diam_2_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_3, 0, 0, 0, 0, _library.diam_3_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_4, 0, 0, 0, 0, _library.diam_4_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_5, 0, 0, 0, 0, _library.diam_5_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_6, 0, 0, 0, 0, _library.diam_6_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_7, 0, 0, 0, 0, _library.diam_7_Texture);
			
			//screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_8, 0, 0, 0, 0, _library.diam_0_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.OBSTACLE_GLASS, 0, 0, 0, 0, _library.obstacle_Glass_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.OBSTACLE_FULL, 0, 0, 0, 0, _library.obstacle_Full_Texture);
			
			// создать тектовые поля для отображения результатов уровня
			
			screen.prepareTextCreation();
			
			screen.createAnimatedText(ScreenObjectId.TXT_GOAL_SUPER, 
				_layout.txt_super_goal_x, _layout.txt_super_goal_y, 
				_layout.txt_super_goal_x, _layout.txt_super_goal_y, 
				_layout.txt_los_ddp_width, _layout.txt_los_ddp_height, 
				"-- / --", _layout.txt_los_ddp_font_name, _layout.txt_los_ddp_font_size, 
				_layout.txt_los_ddp_font_color, _layout.txt_los_ddp_font_bold);
			screen.addAnimatedTextToDisplayList(ScreenObjectId.TXT_GOAL_SUPER, ps);
			
			screen.createAnimatedText(ScreenObjectId.TXT_GOAL_PRIMARY, 
				_layout.txt_primary_goal_x, _layout.txt_primary_goal_y, 
				_layout.txt_primary_goal_x, _layout.txt_primary_goal_y, 
				_layout.txt_los_ddp_width, _layout.txt_los_ddp_height, 
				"-- / --", _layout.txt_los_ddp_font_name, _layout.txt_los_ddp_font_size, 
				_layout.txt_los_ddp_font_color, _layout.txt_los_ddp_font_bold);
			screen.addAnimatedTextToDisplayList(ScreenObjectId.TXT_GOAL_PRIMARY, ps);
			
			screen.createAnimatedText(ScreenObjectId.TXT_GOAL_SECONDARY, 
				_layout.txt_secondary_goal_x, _layout.txt_secondary_goal_y, 
				_layout.txt_secondary_goal_x, _layout.txt_secondary_goal_y, 
				_layout.txt_los_ddp_width, _layout.txt_los_ddp_height, 
				"-- / --", _layout.txt_los_ddp_font_name, _layout.txt_los_ddp_font_size, 
				_layout.txt_los_ddp_font_color, _layout.txt_los_ddp_font_bold);
			screen.addAnimatedTextToDisplayList(ScreenObjectId.TXT_GOAL_SECONDARY, ps);
			
			// создать кнопку NEXT
			
			screen.prepareButtonCreation();
			
			screen.createAnimatedButton(ScreenObjectId.BTN_CONTINUE, FrameWorkStates.SS_NEW_LEVEL, 
				_layout.btn_next_pos_on_x, _layout.btn_next_pos_on_y, 
				_layout.btn_next_pos_out_x, _layout.btn_next_pos_out_y, _library.btnContinueTexture);
			// в список отображения не добавляем
			screen.setupAnimatedButtonMover(ScreenObjectId.BTN_CONTINUE);
			
			screen.createAnimatedButton(ScreenObjectId.BTN_RETRY_LEVEL, FrameWorkStates.SS_NEW_LEVEL, 
				_layout.btn_next_pos_on_x, _layout.btn_next_pos_on_y, 
				_layout.btn_next_pos_out_x, _layout.btn_next_pos_out_y, _library.btnRetryTexture);
			
			screen.setupAnimatedButtonMover(ScreenObjectId.BTN_RETRY_LEVEL);
			
			screen.createAnimatedButton(ScreenObjectId.BTN_MAIN_MENU, FrameWorkStates.SS_SET_MAIN_MENU, 
				_layout.btn_main_menu_pos_on_x, _layout.btn_main_menu_pos_on_y, 
				_layout.btn_main_menu_pos_out_x, _layout.btn_main_menu_pos_out_y, _library.btnMainMenuTexture);
			
			screen.addAnimatedButtonToDisplayList(ScreenObjectId.BTN_MAIN_MENU, screen);
			screen.setupAnimatedButtonMover(ScreenObjectId.BTN_MAIN_MENU);
			
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