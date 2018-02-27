package classes.factories
{
	import assets.layout.abstract.AbstractLayout_SB;
	import assets.libraries.abstract.AbstractLibrary_SB;
	import assets.libraries.l_550x750.Library;
	
	import classes.board.ControlPanel;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	public class ControlPanelFactory
	{
		private var _layout_sb:AbstractLayout_SB;
		private var _library_sb:AbstractLibrary_SB;
		
		public function ControlPanelFactory(playout:AbstractLayout_SB, plibrary:AbstractLibrary_SB)
		{
			_layout_sb = playout;
			_library_sb = plibrary;
		}
		
		public function createControlPanel():ControlPanel{
			
			var panel:ControlPanel = new ControlPanel(_layout_sb);
			
			panel.createBgImage(_library_sb.bgTexture);
			
			panel.createBtnMusicOn(_library_sb.btnMusicOnTexture, _layout_sb.btn_music_pos_x, _layout_sb.btn_music_pos_y);
			
			panel.createBtnMusicOff(_library_sb.btnMusicOffTexture, _layout_sb.btn_music_pos_x, _layout_sb.btn_music_pos_y);
			
			panel.createBtnSound(_library_sb.btnSoundVolumeTexture, _layout_sb.btn_sound_pos_x, _layout_sb.btn_sound_pos_y, 
				_layout_sb.btn_sound_pos_left_x, _layout_sb.btn_sound_pos_right_x);
			
			panel.createTextures(_library_sb.elTextures, _library_sb.taskCompletedTexture, _library_sb.taskFailedTexture, _library_sb.scoreTexture);
			
			panel.createProgressBar(_library_sb.progressBarViewerTexture, _library_sb.progressBarCoverTexture, 
				_layout_sb.progress_bar_pos_x, _layout_sb.progress_bar_pos_y);
			
			return panel;
		}
	}
}