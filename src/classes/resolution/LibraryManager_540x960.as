package classes.resolution
{
	import assets.libraries.abstract.AbstractLibrary_BG;
	import assets.libraries.abstract.AbstractLibrary_Game;
	import assets.libraries.abstract.AbstractLibrary_IS;
	import assets.libraries.abstract.AbstractLibrary_LIS;
	import assets.libraries.abstract.AbstractLibrary_LOS;
	import assets.libraries.abstract.AbstractLibrary_MMS;
	import assets.libraries.abstract.AbstractLibrary_SB;
	import assets.libraries.abstract.AbstractLibrary_TS;
	import assets.libraries.l_550x750.Library_BG_540_960;
	import assets.libraries.l_550x750.Library_Game_550x750;
	import assets.libraries.l_550x750.Library_IS_550x750;
	import assets.libraries.l_550x750.Library_LIS_550x750;
	import assets.libraries.l_550x750.Library_LOS_550x750;
	import assets.libraries.l_550x750.Library_MMS_550x750;
	import assets.libraries.l_550x750.Library_SB_550x750;
	import assets.libraries.l_550x750.Library_TS_550x750;
	
	public class LibraryManager_540x960 implements ILibraryManager
	{		
		private var _scaleFactor:Number;
		
		public function LibraryManager_540x960(ps:Number)
		{
			init(ps);
		}
		
		private function init(ps:Number):void{
			_scaleFactor = ps;
		}
		
		
		//////////////////////////////////////////////////////////
		///
		//		LIBRARIES * LIBRARIES * LIBRARIES
		///
		//////////////////////////////////////////////////////////
		public function get library_ts():AbstractLibrary_TS{
			var _library_ts:AbstractLibrary_TS;
			_library_ts = new Library_TS_550x750(_scaleFactor);
			return _library_ts;
		}
		
		public function get library_mms():AbstractLibrary_MMS{
			var _library_mms:AbstractLibrary_MMS;
			_library_mms = new Library_MMS_550x750(_scaleFactor);
			return _library_mms;
		}
		
		public function get library_is():AbstractLibrary_IS{
			var _library_is:AbstractLibrary_IS;
			_library_is = new Library_IS_550x750(_scaleFactor);
			return _library_is;
		}
		
		public function get library_lis():AbstractLibrary_LIS{
			var _library_lis:AbstractLibrary_LIS;
			_library_lis = new Library_LIS_550x750(_scaleFactor);
			return _library_lis;
		}
		
		public function get library_los():AbstractLibrary_LOS{
			var _library_los:AbstractLibrary_LOS;
			_library_los = new Library_LOS_550x750(_scaleFactor);
			return _library_los;
		}
		
		public function get library_sb():AbstractLibrary_SB{
			var _library_sb:AbstractLibrary_SB;
			_library_sb = new Library_SB_550x750(_scaleFactor);
			return _library_sb;
		}
		
		public function get library_game():AbstractLibrary_Game{
			var _library_game:AbstractLibrary_Game;
			_library_game = new Library_Game_550x750(_scaleFactor);
			return _library_game;
		}
		
		public function get library_bg():AbstractLibrary_BG{
			var _library_bg:AbstractLibrary_BG;
			_library_bg = new Library_BG_540_960(_scaleFactor);
			return _library_bg;
		}
	}
}