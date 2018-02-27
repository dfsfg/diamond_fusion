package classes.factories
{
	import assets.libraries.l_550x750.Library;
	
	import classes.screens.AnimatedScreen;
	import classes.screens.LevelInScreenAnimated;
	import assets.layout.abstract.AbstractLayout_LIS;
	import assets.libraries.abstract.AbstractLibrary_LIS;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class LevelInScreenFactory implements IScreenFactory
	{
		private var _layout:AbstractLayout_LIS;
		private var _library:AbstractLibrary_LIS;
		
		public function LevelInScreenFactory(playout:AbstractLayout_LIS, plibrary:AbstractLibrary_LIS)
		{
			_layout = playout;
			_library = plibrary;
		}
		
		public function createScreen():AnimatedScreen
		{
			var screen:LevelInScreenAnimated = new LevelInScreenAnimated();
			screen.createObjectMovers();
			
			screen.layout = _layout;
			
			// создаем изображения
			screen.prepareImageCreation();
			
			// создаем изображение названия экрана
			
			screen.createAnimatedImage(ScreenObjectId.IMG_LIS_NAME, 
				_layout.img_lis_name_pos_on_x, _layout.img_lis_name_pos_on_y, 
				_layout.img_lis_name_pos_out_x, _layout.img_lis_name_pos_out_y, _library.nameTexture);
			screen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_LIS_NAME, screen);
			screen.setupAnimatedImageMover(ScreenObjectId.IMG_LIS_NAME);
			screen.defineAnimatedMovement(ScreenObjectId.IMG_LIS_NAME, 
				new Point(_layout.img_lis_name_pos_out_x, _layout.img_lis_name_pos_out_y), 
				new Point(_layout.img_lis_name_pos_on_x, _layout.img_lis_name_pos_on_y), _layout.img_lis_name_velo);
			
			// создаем спрайт, содержащий выпадающую панель с заданиями
			screen.prepareSpriteCreation();
			
			screen.createAnimatedSprite(ScreenObjectId.SPR_LIS_DDP, 
				_layout.spr_lis_ddp_pos_on_x, _layout.spr_lis_ddp_pos_on_y, 
				_layout.spr_lis_ddp_pos_out_x, _layout.spr_lis_ddp_pos_out_y);
			screen.addAnimatedSpriteToDisplayList(ScreenObjectId.SPR_LIS_DDP, screen);
			screen.setupAnimatedSpriteMover(ScreenObjectId.SPR_LIS_DDP);
			screen.defineAnimatedMovement(ScreenObjectId.SPR_LIS_DDP, 
				new Point(_layout.spr_lis_ddp_pos_out_x, _layout.spr_lis_ddp_pos_out_y), 
				new Point(_layout.spr_lis_ddp_pos_on_x, _layout.spr_lis_ddp_pos_on_y), _layout.spr_lis_ddp_velo);
			
			// получаем ссылку на спрайт для добавления элементов в его список отображения
			var ps:Sprite = screen.getSpriteById(ScreenObjectId.SPR_LIS_DDP);
			
			// создаем изображения на выпадающей панели
			// создаем изображение самой панели
			screen.createAnimatedImage(ScreenObjectId.IMG_LIS_DDP, 0, 0, 0, 0, _library.dropDownPanelTexture);
			
			// добавляем изображение в список отображения спрайта
			screen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_LIS_DDP, ps);
			
			
			// добавляем текстовые поля
			screen.prepareTextCreation();
			
			screen.createAnimatedText(ScreenObjectId.TXT_GOAL_SUPER, 
				_layout.txt_super_goal_x, _layout.txt_super_goal_y, 
				_layout.txt_super_goal_x, _layout.txt_super_goal_y, 
				_layout.txt_lis_ddp_width, _layout.txt_lis_ddp_height, 
				"-- / --", _layout.txt_lis_ddp_font_name, _layout.txt_lis_ddp_font_size, 
				_layout.txt_lis_ddp_font_color, _layout.txt_lis_ddp_font_bold);
			screen.addAnimatedTextToDisplayList(ScreenObjectId.TXT_GOAL_SUPER, ps);
			
			screen.createAnimatedText(ScreenObjectId.TXT_GOAL_PRIMARY, 
				_layout.txt_primary_goal_x, _layout.txt_primary_goal_y, 
				_layout.txt_primary_goal_x, _layout.txt_primary_goal_y, 
				_layout.txt_lis_ddp_width, _layout.txt_lis_ddp_height, 
				"-- / --", _layout.txt_lis_ddp_font_name, _layout.txt_lis_ddp_font_size, 
				_layout.txt_lis_ddp_font_color, _layout.txt_lis_ddp_font_bold);
			screen.addAnimatedTextToDisplayList(ScreenObjectId.TXT_GOAL_PRIMARY, ps);
			
			screen.createAnimatedText(ScreenObjectId.TXT_GOAL_SECONDARY, 
				_layout.txt_secondary_goal_x, _layout.txt_secondary_goal_y, 
				_layout.txt_secondary_goal_x, _layout.txt_secondary_goal_y, 
				_layout.txt_lis_ddp_width, _layout.txt_lis_ddp_height, 
				"-- / --", _layout.txt_lis_ddp_font_name, _layout.txt_lis_ddp_font_size, 
				_layout.txt_lis_ddp_font_color, _layout.txt_lis_ddp_font_bold);
			screen.addAnimatedTextToDisplayList(ScreenObjectId.TXT_GOAL_SECONDARY, ps);
			
			// создаем изображения, которые будут добавляться на экран для отображения задания текущего уровня
			
			// создаем изображение иконки счета
			screen.createAnimatedImage(ScreenObjectId.IMG_SCORE_ICON, 
				_layout.img_super_goal_x, _layout.img_super_goal_y, 
				_layout.img_super_goal_x, _layout.img_super_goal_y, _library.scoreIconTexture);
			// добавляем изображение в список отображения сразу - оно одно для всех уровней
			screen.addAnimatedImageToDisplayList(ScreenObjectId.IMG_SCORE_ICON, ps);
			
			// создаем изображения бриллиантов для отображения заданий
			
			
			//var diamData:BitmapData = (new Library.El_1 as Bitmap).bitmapData;
			//var diamTexture:Texture = Texture.fromBitmapData(diamData);
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_0, 0, 0, 0, 0, _library.diam_0_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_1, 0, 0, 0, 0, _library.diam_1_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_2, 0, 0, 0, 0, _library.diam_2_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_3, 0, 0, 0, 0, _library.diam_3_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_4, 0, 0, 0, 0, _library.diam_4_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_5, 0, 0, 0, 0, _library.diam_5_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_6, 0, 0, 0, 0, _library.diam_6_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.IMG_DIAM_7, 0, 0, 0, 0, _library.diam_7_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.OBSTACLE_GLASS, 0, 0, 0, 0, _library.obstacle_Glass_Texture);
			
			screen.createAnimatedImage(ScreenObjectId.OBSTACLE_FULL, 0, 0, 0, 0, _library.obstacle_Full_Texture);
			
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