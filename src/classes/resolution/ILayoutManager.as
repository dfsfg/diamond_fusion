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
	
	public interface ILayoutManager
	{
		function get layout_ts():AbstractLayout_TS;
		
		function get layout_mms():AbstractLayout_MMS;
		
		function get layout_is():AbstractLayout_IS;
		
		function get layout_lis():AbstractLayout_LIS;
		
		function get layout_los():AbstractLayout_LOS;
		
		function get layout_game():AbstractLayout_Game;
		
		function get layout_sb():AbstractLayout_SB;
		
		function get layout_bg():AbstractLayout_BG;
	}
}