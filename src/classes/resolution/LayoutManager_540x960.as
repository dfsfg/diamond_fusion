package classes.resolution
{
	import assets.layout.abstract.AbstractLayout_BG;
	import assets.layout.abstract.AbstractLayout_Game;
	import assets.layout.abstract.AbstractLayout_IS;
	import assets.layout.abstract.AbstractLayout_LIS;
	import assets.layout.abstract.AbstractLayout_LOS;
	import assets.layout.abstract.AbstractLayout_MMS;
	import assets.layout.abstract.AbstractLayout_SB;
	import assets.layout.abstract.AbstractLayout_TS;
	import assets.layout.l_550x750.Layout_BG_540x960;
	import assets.layout.l_550x750.Layout_Game_550x750;
	import assets.layout.l_550x750.Layout_IS_550x750;
	import assets.layout.l_550x750.Layout_LIS_550x750;
	import assets.layout.l_550x750.Layout_LOS_550x750;
	import assets.layout.l_550x750.Layout_MMS_550x750;
	import assets.layout.l_550x750.Layout_SB_550x750;
	import assets.layout.l_550x750.Layout_TS_550x750;
	
	public class LayoutManager_540x960 implements ILayoutManager
	{
		private var _deltaX:Number;
		private var _deltaY:Number;
		private var _scaleFactor:Number;
		
		public function LayoutManager_540x960(px:Number, py:Number, ps:Number)
		{
			init(px, py, ps);
		}
		
		private function init(px:Number, py:Number, ps:Number):void{
			_deltaX = px;
			_deltaY = py;
			_scaleFactor = ps;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		LAYOUTS * LAYOUTS * LAYOUTS
		///
		//////////////////////////////////////////////////////////
		public function get layout_ts():AbstractLayout_TS{
			var layout:AbstractLayout_TS = new Layout_TS_550x750;
			layout.defineScaleParameters(_deltaX, _deltaY, _scaleFactor);
			return layout;
		}
		
		public function get layout_mms():AbstractLayout_MMS{
			var layout:AbstractLayout_MMS = new Layout_MMS_550x750;
			layout.defineScaleParameters(_deltaX, _deltaY, _scaleFactor);
			return layout;
		}
		
		public function get layout_is():AbstractLayout_IS{
			var layout:AbstractLayout_IS = new Layout_IS_550x750;
			layout.defineScaleParameters(_deltaX, _deltaY, _scaleFactor);
			return layout;
		}
		
		public function get layout_lis():AbstractLayout_LIS{
			var _layout_lis:AbstractLayout_LIS;
			_layout_lis = new Layout_LIS_550x750;
			_layout_lis.defineScaleParameters(_deltaX, _deltaY, _scaleFactor);
			return _layout_lis;
		}
		
		public function get layout_los():AbstractLayout_LOS{
			var _layout_los:AbstractLayout_LOS;
			_layout_los = new Layout_LOS_550x750;
			_layout_los.defineScaleParameters(_deltaX, _deltaY, _scaleFactor);
			return _layout_los;
		}
		
		public function get layout_game():AbstractLayout_Game{
			var _layout_game:AbstractLayout_Game;
			_layout_game = new Layout_Game_550x750;
			_layout_game.defineScaleParameters(_deltaX, _deltaY, _scaleFactor);
			return _layout_game;
		}
		
		public function get layout_sb():AbstractLayout_SB{
			var _layout_sb:AbstractLayout_SB;
			_layout_sb = new Layout_SB_550x750;
			_layout_sb.defineScaleParameters(_deltaX, _deltaY, _scaleFactor);
			return _layout_sb;
		}
		
		public function get layout_bg():AbstractLayout_BG{
			var _layout_bg:AbstractLayout_BG;
			_layout_bg = new Layout_BG_540x960;
			_layout_bg.defineScaleParameters(_deltaX, _deltaY, _scaleFactor);
			return _layout_bg;
		}
	}
}