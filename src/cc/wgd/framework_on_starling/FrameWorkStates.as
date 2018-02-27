package cc.wgd.framework_on_starling
{
	
	/**
	 * ...
	 * @author Jeff and Steve Fulton; <br>
	 * modified by WGD Studio
	 */
	public class FrameWorkStates 
	{
		public static const SS_WAIT_FOR_CLOSE:int = 0;
		
		/**
		 * <h1>Defines the state which adds to the stage <i>TitleScreen</i> class instance</h1> The <i>TitleScreen</i> class must be a child of BasicScreen class.<br>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>No previous system state</i></b> - first run initialization;</li>
		 * 	<li><b><i>SS_RUN_MAIN_MENU</i></b></li>
		 * 	<li><b><i>SS_RUN_LEVEL_COMPLETED</i></b></li>
		 * 	<li><b><i>SS_RUN_LEVEL_FAILED</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_RUN_TITLE</i></b></li>
		 * </ul>
		 * */
		public static const SS_SET_TITLE:int = 1;
		
		/**
		 * <h1>Defines the state which animates already created <i>TitleScreen</i> class instance</h1> The <i>TitleScreen</i> class must be a child of BasicScreen class.<br>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_SET_TITLE</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_SET_MAIN_MENU</i></b></li>
		 * </ul> 
		 * */
		public static const SS_RUN_TITLE:int = 2;
		
		/**
		 * <h1> the state which adds to the stage <i>MainMenuScreen</i> class instance</h1> The <i>MainMenuScreen</i> class must be a child of BasicScreen class.<br>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_RUN_TITLE</i></b></li>
		 * 	<li><b><i>SS_RUN_INSTRUCTIONS</i></b></li>
		 * 	<li><b><i>SS_RUN_LEVEL_COMPLETED</i></b></li>
		 * 	<li><b><i>SS_RUN_LEVEL_FAILED</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_RUN_MAIN_MENU</i></b></li>
		 * </ul>
		 * */
		public static const SS_SET_MAIN_MENU:int = 3;
		
		/**
		 * <h1> the state which animates <i>MainMenuScreen</i> class instance</h1> The <i>MainMenuScreen</i> class must be a child of BasicScreen class.<br>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_SET_MAIN_MENU</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_SET_INSTRUCTIONS</i></b> - go to instructions screen</li>
		 * 	<li><b><i>SS_NEW_GAME</i></b> - starts new game</li>
		 * 	<li><b><i>SS_NEW_LEVEL</i></b> - continue game play</li>
		 * 	<li><b><i>SS_SET_THE_LEVEL</i></b> - go to user-chosen level</li>
		 * </ul>
		 * */
		public static const SS_RUN_MAIN_MENU:int = 4;
		
		/**
		 * <h1>Defines the state which adds to the stage already created <i>InstructionsScreen</i> class instance</h1>
		 * The <i>InstructionsScreen</i> class instance must be a child of BasicScreen class.<br />
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_RUN_MAIN_MENU</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_RUN_INSTRUCTIONS</i></b></li>
		 * </ul>
		 * */
		public static const SS_SET_INSTRUCTIONS:int = 5;
		
		/**
		 * <h1>Defines the state which animates just added to the stage <i>InstructionsScreen</i> class instance</h1>
		 * The <i>InstructionsScreen</i> class instance must be a child of BasicScreen class.<br />
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_SET_INSTRUCTIONS</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_SET_MAIN_MENU</i></b></li>
		 * </ul>
		 * */
		public static const SS_RUN_INSTRUCTIONS:int = 6;
		
		
		/**
		 * <h1>Defines the state which prepares <i>Game</i> class instance for the first time</h1>
		 * The state adds all the necessary event listeners to the <i>Game</i> class instanse, initialises
		 * all the necessary variables of the class instance and adds it to the stage.
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_RUN_MAIN_MENU</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_NEW_LEVEL</i></b></li>
		 * </ul>
		 * */
		public static const SS_NEW_GAME:int = 7;
		
		/**
		 * <h1>Defines the state which prepares current level</h1>
		 * The state initialises all the variables necessary for current level, but does not add any display objects
		 * to the stage. (This is done by SS_START_NEW_LEVEL). <br />
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_NEW_GAME</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_SET_LEVEL_IN</i></b></li>
		 * </ul>
		 * */
		public static const SS_NEW_LEVEL:int = 8;
		
		/**
		 * <h1>Defines the state which adds to the stage <i>LevelInScreen</i> class instance</h1>
		 * The state initialises all the variables necessary to the <i>LevelInScreen</i> class instance.<br />
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_NEW_LEVEL</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_RUN_LEVEL_IN</i></b></li>
		 * </ul>
		 * */
		public static const SS_SET_LEVEL_IN:int = 9;
		
		
		/**
		 * <h1>Defines the state which animates <i>LevelInScreen</i> class instance</h1>
		 * This screen is used to show the user some kind of information related to the level,
		 * during short period of time (20 - 30 sec).
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_SET_LEVEL_IN</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_START_NEW_LEVEL</i></b></li>
		 * </ul>
		 * */
		public static const SS_RUN_LEVEL_IN:int = 91;
		
		/**
		 * <h1>Defines the state which adds to the stage all the display objects of the current level</h1>
		 * These objects were initialised during the state SS_NEW_LEVEL, but could not be added to the display list
		 * until <i>LevelInScreen</i> class instance is shown.<br />
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_RUN_LEVEL_IN</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_GAME_PLAY</i></b></li>
		 * </ul>
		 * */
		public static const SS_START_NEW_LEVEL:int = 92;
		
		/**
		 * <h1>Defines the state where the actual game play occures.</h1>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_START_NEW_LEVEL</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_SET_LEVEL_COMPLETED</i></b></li>
		 * 	<li><b><i>SS_SET_LEVEL_FAILED</i></b></li>
		 * </ul>
		 * */
		public static const SS_GAME_PLAY:int = 10;
		
		/**
		 * <h1>Defines...</h1>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li> 	
		 * </ul>
		 * */
		public static const SS_SET_LEVEL_OUT:int = 11;
		
		/**
		 * <h1>Defines...</h1>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * */
		public static const SS_WAIT:int = 12;
		
		/**
		 * <h1>Defines...</h1>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * */
		public static const SS_SET_LEVEL_COMPLETED:int = 13;
		
		/**
		 * <h1>Defines...</h1>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * */
		public static const SS_RUN_LEVEL_COMPLETED:int = 14;
		
		/**
		 * <h1>Defines...</h1>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * */
		public static const SS_SET_LEVEL_FAILED:int = 15;
		
		/**
		 * <h1>Defines...</h1>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * */
		public static const SS_RUN_LEVEL_FAILED:int = 16;
		
		
		/**
		 * <h1>Defines...</h1>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * */
		public static const SS_SET_GAME_OVER:int = 17;
		
		/**
		 * <h1>Defines...</h1>
		 * This state has the following previous and next system states:
		 * <h2>Previous:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * <h2>Next:</h2>
		 * <ul>
		 * 	<li><b><i>SS_...</i></b></li>
		 * </ul>
		 * */
		public static const SS_RUN_GAME_OVER:int = 18;

		public static const SS_SAVE_GAME_LOCAL_SLOT:int = 19;
		public static const SS_PAUSE:int = 20;
		
		// new states added in the class GameFrameWorkMod:
		public static const SS_TRY_AGAIN_LEVEL:int = 27;

		public static const SS_SET_THE_LEVEL:int = 40;
		// new states added for particular levels
		public static const SS_GO_TO_LEVEL_0:int = 400;
		public static const SS_GO_TO_LEVEL_1:int = 401;
		public static const SS_GO_TO_LEVEL_2:int = 402;
		public static const SS_GO_TO_LEVEL_3:int = 403;
		public static const SS_GO_TO_LEVEL_4:int = 404;		
		public static const SS_GO_TO_LEVEL_5:int = 405;
		public static const SS_GO_TO_LEVEL_6:int = 406;
		public static const SS_GO_TO_LEVEL_7:int = 407;
		public static const SS_GO_TO_LEVEL_8:int = 408;
		public static const SS_GO_TO_LEVEL_9:int = 409;
		public static const SS_GO_TO_LEVEL_10:int = 410;
		public static const SS_GO_TO_LEVEL_11:int = 411;
		public static const SS_GO_TO_LEVEL_12:int = 412;		
		public static const SS_GO_TO_LEVEL_13:int = 413;
		public static const SS_GO_TO_LEVEL_14:int = 414;
		public static const SS_GO_TO_LEVEL_15:int = 415;
		public static const SS_GO_TO_LEVEL_16:int = 416;
		
		public static const SS_GO_TO_LEVEL_17:int = 417;
		public static const SS_GO_TO_LEVEL_18:int = 418;
		public static const SS_GO_TO_LEVEL_19:int = 419;
		public static const SS_GO_TO_LEVEL_20:int = 420;		
		public static const SS_GO_TO_LEVEL_21:int = 421;
		public static const SS_GO_TO_LEVEL_22:int = 422;
		public static const SS_GO_TO_LEVEL_23:int = 423;
		public static const SS_GO_TO_LEVEL_24:int = 424;
		public static const SS_GO_TO_LEVEL_25:int = 425;
		public static const SS_GO_TO_LEVEL_26:int = 426;
		public static const SS_GO_TO_LEVEL_27:int = 427;
		public static const SS_GO_TO_LEVEL_28:int = 428;		
		public static const SS_GO_TO_LEVEL_29:int = 429;
		public static const SS_GO_TO_LEVEL_30:int = 430;
		public static const SS_GO_TO_LEVEL_31:int = 431;
		public static const SS_GO_TO_LEVEL_32:int = 432;
		
	}
	
}