package cc.wgd.framework_on_starling
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	public class GameFrameWork extends Sprite
	{
		public var systemFunction:Function;
		public var currentSystemState:int;
		public var nextSystemState:int;
		public var lastSystemState:int;
		
		public var titleScreen:BasicScreen;
		public var mainMenuScreen:BasicScreen;
		public var instructionsScreen:BasicScreen;
		public var levelInScreen:BasicScreen;
		public var levelCompleted:BasicScreen;
		
		public var scoreBoard:ScoreBoard;
		
		public var game:Game;
		
		/**
		 * <h1>Number of frame ticks per second.</h1>
		 * This variable must be defined in the child class of the <i>GameFrameWork</i> class.
		 * */
		public var frameRate:int;
		
		/**
		 * <h1>Number of milliseconds between frame ticks</h1>
		 * This variable is calculated and passed as the parameter into the <i>Timer</i> class instance.
		 * */
		public var timerPeriod:Number;
		
		/**
		 * <h1>Controls the frame rate of the game</h1>
		 * */
		public var gameTimer:Timer;
		
		public var waitTime:int;
		public var waitCount:int;
		
		private var appBackBitmapData:BitmapData;
		private var appBackBitmap:Bitmap;
		private var appBackImage:Image;
		
		public function GameFrameWork()
		{
			super();
		}
		
		public function startTimer():void{
			timerPeriod = 1000 / frameRate;
			gameTimer = new Timer(timerPeriod);
			gameTimer.addEventListener(TimerEvent.TIMER, runGame);
			gameTimer.start();
		}
		
		public function setApplicationBackGround(width:Number, height:Number, isTransparent:Boolean = false, color:uint = 0x000000):void {
			appBackBitmapData = new BitmapData(width, height, isTransparent, color);
			appBackBitmap = new Bitmap(appBackBitmapData);
			appBackImage = Image.fromBitmap(appBackBitmap);
			addChild(appBackImage);
		}
		
		
		public function runGame(event:TimerEvent):void{
			systemFunction();
			event.updateAfterEvent();
		}
		
		//switchSystem state is called only when the state is to be changed (not every frame like in some switch/case
		//based simple state machines
		
		public function switchSystemState(stateval:int):void {
			lastSystemState = currentSystemState;
			currentSystemState = stateval;
			
			trace("currentSystemState=" + currentSystemState)
			switch(stateval) {
				
				case FrameWorkStates.SS_WAIT: 
					systemFunction = systemWait;
					break;
				
				case FrameWorkStates.SS_WAIT_FOR_CLOSE:
					systemFunction = systemWaitForClose;
					break;
				
				case FrameWorkStates.SS_SET_TITLE:
					systemFunction = systemSetTitle;
					break;
				
				case FrameWorkStates.SS_RUN_TITLE:
					systemFunction = systemRunTitle;
					break;
				
				case FrameWorkStates.SS_SET_MAIN_MENU:
					systemFunction = systemSetMainMenu;
					break;
				
				case FrameWorkStates.SS_RUN_MAIN_MENU:
					systemFunction = systemRunMainMenu;
					break;
				
				case FrameWorkStates.SS_SET_INSTRUCTIONS:
					systemFunction = systemInstructions;
					break;
				
				case FrameWorkStates.SS_RUN_INSTRUCTIONS:
					systemFunction = systemRunInstructions;
					break;
				
				case FrameWorkStates.SS_NEW_GAME:
					systemFunction = systemNewGame;
					break;	
				
				case FrameWorkStates.SS_NEW_LEVEL:
					systemFunction = systemNewLevel;
					break;
				
				case FrameWorkStates.SS_SET_LEVEL_IN:
					systemFunction = systemLevelIn;
					break;
				
				case FrameWorkStates.SS_RUN_LEVEL_IN:
					systemFunction = systemRunLevelIn;
					break;
				
				case FrameWorkStates.SS_GAME_PLAY:
					systemFunction = systemGamePlay;
					break
				
				case FrameWorkStates.SS_SET_GAME_OVER:
					systemFunction = systemGameOver;
					break;

				//*** added in this class
				
				// переход к єкрану завершения уровня с кнопкой перехода на следующий уровень
				case FrameWorkStates.SS_SET_LEVEL_COMPLETED:
					systemFunction = systemLevelCompleted;
					break;
				
				// переход к єкрану завершения уроаня с кнопкой возврата к началу непройденного уровня
				case FrameWorkStates.SS_SET_LEVEL_FAILED:
					systemFunction = systemLevelFailed;
					break;
				
				// возврат к началу непройденного уровня
				case FrameWorkStates.SS_TRY_AGAIN_LEVEL:
					systemFunction = systemTryAgainLevel;
					break;
				

				// сохранение игры
				case FrameWorkStates.SS_SAVE_GAME_LOCAL_SLOT:
					systemFunction = systemSaveGameLocalSlot;
					break;
				
				//*** end added in this class
			}
		}
		
		public function onButtonClick(event:Event):void{
			trace("Button " + event.data + " clicked!");
			switchSystemState(int(event.data));
		}
		
		public function systemWait():void{
			
		}
		
		public function systemWaitForClose():void{
			
		}
		
		public function systemSetTitle():void{
			switch(lastSystemState){
				case FrameWorkStates.SS_RUN_MAIN_MENU:
					mainMenuScreen.removeEventListener(EventType.BUTTON_CLICKED, onButtonClick);
					removeChild(mainMenuScreen);
					break;
				case FrameWorkStates.SS_RUN_LEVEL_COMPLETED:
					break;
				case FrameWorkStates.SS_RUN_LEVEL_FAILED:
					break;
			}
			titleScreen.addEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			addChild(titleScreen);
			switchSystemState(FrameWorkStates.SS_RUN_TITLE);
		}
		
		public function systemRunTitle():void{
			titleScreen.runScreen();
		}
		
		public function systemInstructions():void{
			switch(lastSystemState){
				case FrameWorkStates.SS_RUN_MAIN_MENU:
					mainMenuScreen.removeEventListener(EventType.BUTTON_CLICKED, onButtonClick);
					removeChild(mainMenuScreen);
					break;
			}
			instructionsScreen.addEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			addChild(instructionsScreen);
			switchSystemState(FrameWorkStates.SS_RUN_INSTRUCTIONS);
		}
		
		public function systemRunInstructions():void{
			instructionsScreen.runScreen();
		}
		
		public function systemNewGame():void{
			// в состояние NewGame игра может перейти только после mainMenuScreen
			// поэтому нет смысла проверять предыдущее состояние - оно единственное.
			mainMenuScreen.removeEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			removeChild(mainMenuScreen);
			// инициализируем новую игру
			game.newGame();
			game.addEventListener(EventType.SCORE_BOARD_UPDATE, onScoreBoardUpdate);
			game.addEventListener(EventType.LEVEL_COMPLETED, onLevelCompleted);
			game.addEventListener(EventType.LEVEL_FAILED, onLevelFailed);
			addChild(game);
			switchSystemState(FrameWorkStates.SS_NEW_LEVEL);
			trace("systemNewGame completed...");
		}
		
		public function systemNewLevel():void{
			game.newLevel();
			switchSystemState(FrameWorkStates.SS_SET_LEVEL_IN);
			trace("systemNewLevel completed...");
		}
		
		public function systemLevelIn():void{
			addChild(levelInScreen);
			waitCount = 0;
			waitTime = 100;
			nextSystemState = FrameWorkStates.SS_GAME_PLAY;
			addEventListener(EventType.WAIT_COMPLETE, waitCompleteListener);
			switchSystemState(FrameWorkStates.SS_RUN_LEVEL_IN);
		}
		
		public function systemRunLevelIn():void{
			waitCount++;
			if(waitCount > waitTime){
				waitCount = 0;
				dispatchEvent(new Event(EventType.WAIT_COMPLETE));
				trace("wait completed");
			}
			levelInScreen.runScreen();
		}
		
		public function systemGamePlay():void{
			game.runGame();
		}
		
		public function systemGameOver():void{
			
		}
		
		public function systemLevelCompleted():void{
			removeChild(game);
			levelCompleted.addEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			addChild(levelCompleted);
			switchSystemState(FrameWorkStates.SS_RUN_LEVEL_COMPLETED);
		}
		
		public function systemLevelFailed():void{
			
		}
		
		public function systemTryAgainLevel():void{
			
		}
		
		public function systemSetMainMenu():void{
			switch (lastSystemState){
				case FrameWorkStates.SS_RUN_TITLE:
					titleScreen.removeEventListener(EventType.BUTTON_CLICKED, onButtonClick);
					removeChild(titleScreen);
					break;
				case FrameWorkStates.SS_RUN_INSTRUCTIONS:
					instructionsScreen.removeEventListener(EventType.BUTTON_CLICKED, onButtonClick);
					removeChild(instructionsScreen);
					break;
				case FrameWorkStates.SS_RUN_LEVEL_COMPLETED:
					levelCompleted.removeEventListener(EventType.BUTTON_CLICKED, onButtonClick);
					removeChild(levelCompleted);
					break;
				case FrameWorkStates.SS_RUN_LEVEL_FAILED:
					break;
			}
			mainMenuScreen.addEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			addChild(mainMenuScreen);
			switchSystemState(FrameWorkStates.SS_RUN_MAIN_MENU);
		}
		
		public function systemRunMainMenu():void{
			mainMenuScreen.runScreen();
		}
		public function systemSaveGameLocalSlot():void{
			
		}
		
		public function waitCompleteListener(event:Event):void{
			switch(currentSystemState){
				case FrameWorkStates.SS_RUN_LEVEL_IN:
					removeChild(levelInScreen);
					break;
			}
			//removeChild(levelInScreen);
			removeEventListener(EventType.WAIT_COMPLETE, waitCompleteListener);
			switchSystemState(FrameWorkStates.SS_GAME_PLAY);
		}
		
		private function onScoreBoardUpdate(event:Event):void{
			var key:String = (event.data as ScoreBoardUpdateData).key;
			var value:String = (event.data as ScoreBoardUpdateData).value;
			//trace("Event received...");
			//trace("key = " + key  + ", value = " + value);
			scoreBoard.update(key, value);
		}
		
		private function onLevelCompleted(event:Event):void{
			// выполняем действия, необходимые при успешном завершении уровня...
			game.levelCompleted();
			// и переключаемся в состояние, подготавливающее экран завершения уровня
			switchSystemState(FrameWorkStates.SS_SET_LEVEL_COMPLETED);
		}
		
		private function onLevelFailed(event:Event):void{
			// выполняем действия, если уровень не пройден...
			game.levelFailed();
			// и переключаемся в состояние, подготавливающее экран завершения уровня
			switchSystemState(FrameWorkStates.SS_SET_LEVEL_FAILED);
		}
	}
}