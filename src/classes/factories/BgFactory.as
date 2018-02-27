package classes.factories
{
	import assets.layout.abstract.AbstractLayout_BG;
	import assets.libraries.abstract.AbstractLibrary_BG;
	
	import starling.display.Image;

	public class BgFactory
	{
		private var _library_bg:AbstractLibrary_BG;
		private var _layout_bg:AbstractLayout_BG;
		
		public function BgFactory(playout_bg:AbstractLayout_BG, plibrary_bg:AbstractLibrary_BG)
		{
			_library_bg = plibrary_bg;
			_layout_bg = playout_bg;
		}
		
		public function get imageBg():Image{
			var image:Image = new Image(_library_bg.image_bg_texture);
			image.x = _layout_bg.pos_x;
			image.y = _layout_bg.pos_y;
			return image;
		}
	}
}