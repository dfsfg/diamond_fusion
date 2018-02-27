package assets.libraries.l_550x750
{
	import assets.libraries.abstract.AbstractLibrary_Game;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	public class Library_Game_550x750 extends AbstractLibrary_Game
	{
		public function Library_Game_550x750(ps:Number)
		{
			super(ps);
		}
		
		override protected function init():void{
			var tempDataOriginal:BitmapData = (new Library.AppBg as Bitmap).bitmapData;
			var tempDataScaled:BitmapData = super.scaleBitmapData(tempDataOriginal);
			_game_bg = Texture.fromBitmapData(tempDataScaled);
			tempDataOriginal = (new Library.Hexagon as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_hexagonTexture = Texture.fromBitmapData(tempDataScaled);
			_elBitmaps = new Vector.<Bitmap>;
			tempDataOriginal = (new Library.El_0 as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			var tempBitmap:Bitmap = new Bitmap(tempDataScaled);
			_elBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.El_1 as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_elBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.El_2 as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_elBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.El_3 as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_elBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.El_4 as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_elBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.El_5 as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_elBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.El_6 as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_elBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.El_7 as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_elBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.El_0 as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_elBitmaps.push(tempBitmap);
			_bonusBitmaps = new Vector.<Bitmap>;
			tempDataOriginal = (new Library.Bomb as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_0_Ceylon as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_0_Leaf as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_0_Pear as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_0_Triangle as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_1_Ceylon as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_1_Leaf as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_1_Pear as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_1_Triangle as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_2_Ceylon as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_2_Leaf as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_2_Pear as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			tempDataOriginal = (new Library.Lightning_2_Triangle as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempBitmap = new Bitmap(tempDataScaled);
			_bonusBitmaps.push(tempBitmap);
			_obstacleTextures = new Vector.<Texture>;
			tempDataOriginal = (new Library.ObstacleStone as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			var tempTexture:Texture = Texture.fromBitmapData(tempDataScaled);
			_obstacleTextures.push(tempTexture);
			tempDataOriginal = (new Library.ObstacleGlass as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			tempTexture = Texture.fromBitmapData(tempDataScaled);
			_obstacleTextures.push(tempTexture);
			tempDataOriginal = (new Library.BtnMainMenuGame as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_btn_main_menu_texture = Texture.fromBitmapData(tempDataScaled);
			tempDataOriginal = (new Library.BtnNextGame as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_btn_next_texture = Texture.fromBitmapData(tempDataScaled);
			tempDataOriginal = (new Library.DownButtonPanel as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_down_panel_texture = Texture.fromBitmapData(tempDataScaled);
			tempDataOriginal = (new Library.Game_DDP_BG as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_ddp_menu_bg_texture = Texture.fromBitmapData(tempDataScaled);
			tempDataOriginal = (new Library.Game_DDP_LC as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_ddp_menu_level_completed_texture = Texture.fromBitmapData(tempDataScaled);
			tempDataOriginal = (new Library.Game_DDP_LF as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_ddp_menu_level_failed_texture = Texture.fromBitmapData(tempDataScaled);
			tempDataOriginal = (new Library.Game_DDP_LP as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_ddp_menu_level_passed_texture = Texture.fromBitmapData(tempDataScaled);
			tempDataOriginal = (new Library.Game_DDP_Next_Confirm as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_ddp_next_confirm_texture = Texture.fromBitmapData(tempDataScaled);
			tempDataOriginal = (new Library.BtnDDP_Yes as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_btn_ddp_yes_texture = Texture.fromBitmapData(tempDataScaled);
			tempDataOriginal = (new Library.BtnDDP_No as Bitmap).bitmapData;
			tempDataScaled = super.scaleBitmapData(tempDataOriginal);
			_btn_ddp_no_texture = Texture.fromBitmapData(tempDataScaled);
			
		}
	}
}