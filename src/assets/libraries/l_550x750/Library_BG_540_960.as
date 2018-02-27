package assets.libraries.l_550x750
{
	import assets.libraries.abstract.AbstractLibrary_BG;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	public class Library_BG_540_960 extends AbstractLibrary_BG
	{
		public function Library_BG_540_960(ps:Number)
		{
			super(ps);
		}
		
		override protected function init():void{
			var bitmapDataOriginal:BitmapData = (new Library.AppBg as Bitmap).bitmapData;
			var bitmapDataScaled:BitmapData = super.scaleBitmapData(bitmapDataOriginal);
			_image_bg_data = Texture.fromBitmapData(bitmapDataScaled);
		}
	}
}