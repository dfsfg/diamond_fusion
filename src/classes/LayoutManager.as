package classes
{
	import assets.layout.abstract.AbstractLayout_Game;
	import assets.layout.abstract.AbstractLayout_IS;
	import assets.layout.abstract.AbstractLayout_LIS;
	import assets.layout.abstract.AbstractLayout_LOS;
	import assets.layout.abstract.AbstractLayout_MMS;
	import assets.layout.abstract.AbstractLayout_SB;
	import assets.layout.abstract.AbstractLayout_TS;
	import assets.layout.l_550x750.Layout_Game_550x750;
	import assets.layout.l_550x750.Layout_IS_550x750;
	import assets.layout.l_550x750.Layout_LIS_550x750;
	import assets.layout.l_550x750.Layout_LOS_550x750;
	import assets.layout.l_550x750.Layout_MMS_550x750;
	import assets.layout.l_550x750.Layout_SB_550x750;
	import assets.layout.l_550x750.Layout_TS_550x750;
	import assets.libraries.abstract.AbstractLibrary_Game;
	import assets.libraries.abstract.AbstractLibrary_IS;
	import assets.libraries.abstract.AbstractLibrary_LIS;
	import assets.libraries.abstract.AbstractLibrary_LOS;
	import assets.libraries.abstract.AbstractLibrary_MMS;
	import assets.libraries.abstract.AbstractLibrary_SB;
	import assets.libraries.abstract.AbstractLibrary_TS;
	import assets.libraries.l_550x750.Library_Game_550x750;
	import assets.libraries.l_550x750.Library_IS_550x750;
	import assets.libraries.l_550x750.Library_LIS_550x750;
	import assets.libraries.l_550x750.Library_LOS_550x750;
	import assets.libraries.l_550x750.Library_MMS_550x750;
	import assets.libraries.l_550x750.Library_SB_550x750;
	import assets.libraries.l_550x750.Library_TS_550x750;
		
	public class LayoutManager
	{
		private var _width:Number;
		private var _height:Number;
		
		public function LayoutManager(pw:Number, ph:Number)
		{
			init(pw, ph);
		}
		
		private function init(pw:Number, ph:Number):void{
			_width = pw;
			_height = ph;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		LAYOUTS * LAYOUTS * LAYOUTS
		///
		//////////////////////////////////////////////////////////
		public function get layout_ts():AbstractLayout_TS{
			var layout:AbstractLayout_TS = new Layout_TS_550x750;
			layout.defineScaleParameters();
			return layout;
		}
		
		public function get layout_mms():AbstractLayout_MMS{
			var layout:AbstractLayout_MMS = new Layout_MMS_550x750;
			layout.defineScaleParameters();
			return layout;
		}
		
		public function get layout_is():AbstractLayout_IS{
			var layout:AbstractLayout_IS = new Layout_IS_550x750;
			layout.defineScaleParameters();
			return layout;
		}
		
		public function get layout_lis():AbstractLayout_LIS{
			var _layout_lis:AbstractLayout_LIS;
			_layout_lis = new Layout_LIS_550x750;
			_layout_lis.defineScaleParameters();
			return _layout_lis;
		}
		
		public function get layout_los():AbstractLayout_LOS{
			var _layout_los:AbstractLayout_LOS;
			_layout_los = new Layout_LOS_550x750;
			_layout_los.defineScaleParameters();
			return _layout_los;
		}
		
		public function get layout_game():AbstractLayout_Game{
			var _layout_game:AbstractLayout_Game;
			_layout_game = new Layout_Game_550x750;
			_layout_game.defineScaleParameters();
			return _layout_game;
		}
		
		public function get layout_sb():AbstractLayout_SB{
			var _layout_sb:AbstractLayout_SB;
			_layout_sb = new Layout_SB_550x750;
			_layout_sb.defineScaleParameters();
			return _layout_sb;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		LIBRARIES * LIBRARIES * LIBRARIES
		///
		//////////////////////////////////////////////////////////
		public function get library_ts():AbstractLibrary_TS{
			var _library_ts:AbstractLibrary_TS;
			_library_ts = new Library_TS_550x750;
			return _library_ts;
		}
		
		public function get library_mms():AbstractLibrary_MMS{
			var _library_mms:AbstractLibrary_MMS;
			_library_mms = new Library_MMS_550x750;
			return _library_mms;
		}
		
		public function get library_is():AbstractLibrary_IS{
			var _library_is:AbstractLibrary_IS;
			_library_is = new Library_IS_550x750;
			return _library_is;
		}
		
		public function get library_lis():AbstractLibrary_LIS{
			var _library_lis:AbstractLibrary_LIS;
			_library_lis = new Library_LIS_550x750;
			return _library_lis;
		}
		
		public function get library_los():AbstractLibrary_LOS{
			var _library_los:AbstractLibrary_LOS;
			_library_los = new Library_LOS_550x750;
			return _library_los;
		}
		
		public function get library_sb():AbstractLibrary_SB{
			var _library_sb:AbstractLibrary_SB;
			_library_sb = new Library_SB_550x750;
			return _library_sb;
		}
		
		public function get library_game():AbstractLibrary_Game{
			var _library_game:AbstractLibrary_Game;
			_library_game = new Library_Game_550x750;
			return _library_game;
		}
		
	}
}