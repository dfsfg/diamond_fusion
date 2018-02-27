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
	
	public interface ILibraryManager
	{
		function get library_ts():AbstractLibrary_TS;
		
		function get library_mms():AbstractLibrary_MMS;
		
		function get library_is():AbstractLibrary_IS;
		
		function get library_lis():AbstractLibrary_LIS;
		
		function get library_los():AbstractLibrary_LOS;
		
		function get library_sb():AbstractLibrary_SB;
		
		function get library_game():AbstractLibrary_Game;
		
		function get library_bg():AbstractLibrary_BG;
	}
}