package classes.game
{
	public class GameStates
	{
		public static const STATE_ANIMATE:int = 110;
		public static const STATE_REPLACE_SWITCHED_ELEMENTS_FORWARD:int = 111;
		public static const STATE_REPLACE_SWITCHED_ELEMENTS_BACKWARD:int = 112;
		public static const STATE_CHECK_3_IN_ROW:int = 113;
		public static const STATE_EXPLODE:int = 114;
		public static const STATE_REMOVE:int = 115;
		public static const STATE_MOVE_DOWN:int = 116;
		public static const STATE_MOVE_BACKWARD:int = 117;
		public static const STATE_CREATE_NEW_ELEMENTS:int = 118;
		
		public static const STATE_CHECK_FOR_END_GAME:int = 119;
		public static const STATE_WAIT_FOR_USER_ACTION:int = 120;
		public static const STATE_LUNCH_FIREWORKS:int = 121;
		public static const STATE_SHOW_MESSAGE:int = 122;
		public static const STATE_APPEAR:int = 123;
		public static const STATE_DISAPPEAR:int = 124;
		public static const STATE_FINALIZE:int = 125;
		public static const STATE_NEW_ELEMENTS_FALL_DOWN:int = 126;
		
		public static const STATE_LEVEL_COMPLETED:int = 127;
		public static const STATE_LEVEL_PASSED:int = 1280;
		public static const STATE_LEVEL_FAILED:int = 1290;
		
		//public static const STATE_GO_TO_NEXT_LEVEL:int = 1301;
		//public static const STATE_EARLY_EXIT_PREPARE:int = 1302;
		
		public static const STATE_SHOW_MENU_WARNING:int = 1303;
		public static const STATE_WAIT_FOR_USER_DECISION:int = 1304;
		public static const STATE_HIDE_MENU_WARNING:int = 1305;
		public static const STATE_EXIT_MENU_PREPARE:int = 1306;
		
		public static const STATE_BTN_NEXT_APPEAR:int = 1307;
		public static const STATE_WAIT_FOR_UNDERSTAND:int = 1308;
		public static const STATE_HIDE_NEXT_EXPLANATION:int = 1309;
		
		public static const STATE_SHOW_NEXT_WARNING:int = 1310;
		public static const STATE_HIDE_NEXT_WARNING:int = 1311;
	}
}