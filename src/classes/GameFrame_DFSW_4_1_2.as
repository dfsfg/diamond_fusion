package classes
{
	import assets.layout.abstract.AbstractLayout_BG;
	import assets.layout.abstract.AbstractLayout_Game;
	import assets.layout.abstract.AbstractLayout_IS;
	import assets.layout.abstract.AbstractLayout_LIS;
	import assets.layout.abstract.AbstractLayout_LOS;
	import assets.layout.abstract.AbstractLayout_MMS;
	import assets.layout.abstract.AbstractLayout_SB;
	import assets.layout.abstract.AbstractLayout_TS;
	import assets.libraries.abstract.AbstractLibrary_BG;
	import assets.libraries.abstract.AbstractLibrary_Game;
	import assets.libraries.abstract.AbstractLibrary_IS;
	import assets.libraries.abstract.AbstractLibrary_LIS;
	import assets.libraries.abstract.AbstractLibrary_LOS;
	import assets.libraries.abstract.AbstractLibrary_MMS;
	import assets.libraries.abstract.AbstractLibrary_SB;
	import assets.libraries.abstract.AbstractLibrary_TS;
	import assets.libraries.l_550x750.Library;
	
	import cc.wgd.framework_on_starling.EventType;
	import cc.wgd.framework_on_starling.FrameWorkStates;
	import cc.wgd.framework_on_starling.Game;
	import cc.wgd.framework_on_starling.GameFrameWorkExtended2;
	import cc.wgd.framework_on_starling.GraphicsElement;
	import cc.wgd.framework_on_starling.ScoreElement;
	
	import classes.board.ControlPanel;
	import classes.factories.BgFactory;
	import classes.factories.ControlPanelFactory;
	import classes.factories.InstructionsScreenFactory;
	import classes.factories.LevelInScreenFactory;
	import classes.factories.LevelOverScreenFactory;
	import classes.factories.MainMenuScreenFactory;
	import classes.factories.ScreenObjectId;
	import classes.factories.TitleScreenFactory;
	import classes.game.Game_DFSW_4_1_2_2;
	import classes.game.constants.Constants;
	import classes.game.constants.Mode;
	import classes.game.constants.SavedNames;
	import classes.game.constants.SoundNames;
	import classes.levels.LevelConditions;
	import classes.levels.LevelCounter;
	import classes.levels.LevelLimitations;
	import classes.levels.LevelObstaclesLayout;
	import classes.levels.LevelPass;
	import classes.levels.LevelTaskFactory;
	import classes.levels.SingleGoalProgress;
	import classes.levels.obstacles.ObstacleLayoutFactory;
	import classes.levels.saved.GameData;
	import classes.resolution.ILayoutManager;
	import classes.resolution.ILibraryManager;
	import classes.resolution.ResolutionManager;
	import classes.screens.AnimatedScreen;
	import classes.screens.InstructionsScreenAnimated;
	import classes.screens.LevelInScreenAnimated;
	import classes.screens.LevelOverScreenAnimated;
	import classes.screens.MainMenuScreenAnimated;
	
	import flash.system.System;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class GameFrame_DFSW_4_1_2 extends GameFrameWorkExtended2
	{		
		private var _layout_ts:AbstractLayout_TS;
		private var _layout_mms:AbstractLayout_MMS;
		private var _layout_is:AbstractLayout_IS;
		private var _layout_lis:AbstractLayout_LIS;
		private var _layout_los:AbstractLayout_LOS;
		
		private var _layout_game:AbstractLayout_Game;
		
		private var _library_ts:AbstractLibrary_TS;
		private var _library_mms:AbstractLibrary_MMS;
		private var _library_is:AbstractLibrary_IS;
		private var _library_lis:AbstractLibrary_LIS;
		private var _library_los:AbstractLibrary_LOS;
		
		private var _library_game:AbstractLibrary_Game;
		
		private var _factory_ts:TitleScreenFactory;
		private var _factory_mms:MainMenuScreenFactory;
		private var _factory_is:InstructionsScreenFactory;
		private var _factory_lis:LevelInScreenFactory;
		private var _factory_los:LevelOverScreenFactory;
		
		private var _layout_sb:AbstractLayout_SB;
		private var _library_sb:AbstractLibrary_SB;
		private var _factory_sb:ControlPanelFactory;
		
		private var _layout_bg:AbstractLayout_BG;
		private var _library_bg:AbstractLibrary_BG;
		private var _factory_bg:BgFactory;
		
		private var _resolutionManager:ResolutionManager;
		private var _layoutManager:ILayoutManager;
		private var _libraryManager:ILibraryManager;
		
		private var _levelObstaclesLayout:Vector.<LevelObstaclesLayout>;
		private var _levelObstacleLayoutFactory:ObstacleLayoutFactory;
		
		private var _levelCounter:LevelCounter;
		private var _levelConditions:Vector.<LevelConditions>;
		
		private var _levelTaskFactory:LevelTaskFactory;
		
		private var _levelCounterStrict:LevelCounter;
		private var _levelConditionsStrict:Vector.<LevelConditions>;
		
		private var _levelCounterZen:LevelCounter;
		private var _levelConditionsZen:Vector.<LevelConditions>;
		
		private var _gameData:GameData;
		private var _gameDataStrict:GameData;
		private var _gameDataZen:GameData;
		
		private var _gameMode:String;
		
		public function GameFrame_DFSW_4_1_2()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			var w:Number = this.stage.stageWidth;
			var h:Number = this.stage.stageHeight;
			trace("w = " + w + ", h = " + h);
			
			defineStageSize(550, 750);
			
			_resolutionManager = new ResolutionManager(550, 750);
			
			
			_layoutManager = _resolutionManager.layoutManager;
			_libraryManager = _resolutionManager.libraryManager;
			
			_layout_ts = _layoutManager.layout_ts;
			
			_layout_mms = _layoutManager.layout_mms;
			
			_layout_is = _layoutManager.layout_is;
			
			_layout_lis = _layoutManager.layout_lis;
			
			_layout_los = _layoutManager.layout_los;
			
			_layout_sb = _layoutManager.layout_sb;
			
			_layout_game = _layoutManager.layout_game;
			
			_layout_bg = _layoutManager.layout_bg;
			
			_library_sb = _libraryManager.library_sb;
			
			_library_game = _libraryManager.library_game;
			
			_library_bg = _libraryManager.library_bg;
			
			init();
		}
		
		private function createLayout(e:Event):void{
			
		}
		
		private function init():void{
			stageWidth = 550;
			stageHeight = 750;
			
			_gameDataStrict = new GameData(SavedNames.FOLDER_NAME, SavedNames.FILE_NAME_STRICT);
			_levelCounterStrict = _gameDataStrict.levelCounter;
			
			//_levelCounterStrict = new LevelCounter(29, 0, 19);
			_levelCounterZen = new LevelCounter(29, 0, 29);
			
			_levelObstacleLayoutFactory = new ObstacleLayoutFactory();
			_levelObstaclesLayout = _levelObstacleLayoutFactory.createLayout();
			
			_levelTaskFactory = new LevelTaskFactory(_levelObstaclesLayout);
			
			_levelConditionsStrict = _levelTaskFactory.createLevelConditions();
			_levelConditionsZen = _levelTaskFactory.createLevelConditions(Mode.ZEN);
			_levelTaskFactory = null;
			
			var imageBg:Image = new Image(_library_game.gameBg);
			addChild(imageBg);
			
			createTitleScreen();
			
			createGame();
			
			
			createScoreBoard();
			
			soundManager.addSound(SoundNames.MUSIC_1_MAIN_MENU, new Library.Music_1_MainMenu());
			soundManager.addSound(SoundNames.MUSIC_2_LEVEL_IN, new Library.Music_2_LevelIn());
			soundManager.addSound(SoundNames.MUSIC_3_GAME_PLAY, new Library.Music_3_GamePlay());
			soundManager.addSound(SoundNames.MUSIC_4_LEVEL_FAILED, new Library.Music_4_LevelFailed());
			soundManager.addSound(SoundNames.MUSIC_5_LEVEL_PASSED, new Library.Music_5_LevelPassed());
			
			soundManager.addSound(SoundNames.SOUND_EXPLODED_DIAMOND, new Library.DiamondExploded());
			soundManager.addSound(SoundNames.SOUND_EXPLODED_BOMB, new Library.BombExploded());
			soundManager.addSound(SoundNames.SOUND_EXPLODED_LIGHTNING, new Library.LightningExploded());
			soundManager.addSound(SoundNames.SOUND_DIAMOND_CLICKED, new Library.DiamondClicked());
			//soundManager.addSound(SoundNames.SOUND_DIAMOND_FELT, new Library.DiamondFelt());
			soundManager.addSound(SoundNames.SOUND_DIAMOND_SWAPPED_BACK, new Library.DiamondSwappedBack());
			soundManager.addSound(SoundNames.SOUND_HOVER_OVER_BUTTON, new Library.HoverOverButton());
			soundManager.addSound(SoundNames.SOUND_SPEC_DIAMOND_CREATED, new Library.SpecDiamondCreated());
			
			//soundManager.addSound(SoundNames.SOUND_GAME_PLAY, new Library.SoundGamePlay());
			soundManager.addSound(SoundNames.SOUND_LEVEL_COMPLETED, new Library.SoundLevelCompleted());
			//soundManager.addSound(SoundNames.SOUND_LEVEL_FAILED, new Library.SoundLevelFailed());
			//soundManager.addSound(SoundNames.SOUND_LEVEL_PASSED, new Library.SoundLevelPassed());
			
			game.onSetTitleScreen();
			this.switchSystemState(FrameWorkStates.SS_RUN_TITLE);
			frameRate = 60;
			startTimer();
		}
		
		
		private function defineStageSize(w:Number, h:Number):void{
			stageWidth = w;
			stageHeight = h;
		}
		
		private function createTitleScreen():void{
			_library_ts = _libraryManager.library_ts;
			_factory_ts = new TitleScreenFactory(_layout_ts, _library_ts);
			titleScreen = _factory_ts.createScreen();
			titleScreen.addEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			titleScreen.addEventListener(EventType.PLAY_SOUND, soundEventListener);
			titleScreen.addEventListener(EventType.STOP_SOUND, soundEventListener);
			addChild(titleScreen);
			_factory_ts = null;
			System.pauseForGCIfCollectionImminent(0.25);
		}
		
		private function createMainMenuScreen():void{
			_library_mms = _libraryManager.library_mms;
			_factory_mms = new MainMenuScreenFactory(_layout_mms, _library_mms);
			mainMenuScreen = _factory_mms.createScreen();
			mainMenuScreen.addEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			mainMenuScreen.addEventListener(EventType.SET_GAME_MODE, onSetGameMode);
			mainMenuScreen.addEventListener(EventType.PLAY_SOUND, soundEventListener);
			mainMenuScreen.addEventListener(EventType.STOP_SOUND, soundEventListener);
			
			(mainMenuScreen as MainMenuScreenAnimated).levelCounterStrict = _levelCounterStrict;
			(mainMenuScreen as MainMenuScreenAnimated).levelCounterZen = _levelCounterZen;
			
			switch(_gameMode){
				case Mode.STRICT:
					(mainMenuScreen as MainMenuScreenAnimated).gameMode = Mode.STRICT;
					break;
				case Mode.ZEN:
					(mainMenuScreen as MainMenuScreenAnimated).gameMode = Mode.ZEN;
					break;
			}
			
			addChild(mainMenuScreen);
			
			_factory_mms = null;
			System.pauseForGCIfCollectionImminent(0.25);
		}
		
		private function createInstructionsScreen():void{
			_library_is = _libraryManager.library_is;
			_factory_is = new InstructionsScreenFactory(_layout_is, _library_is);
			instructionsScreen = _factory_is.createScreen();
			instructionsScreen.addEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			instructionsScreen.addEventListener(EventType.PLAY_SOUND, soundEventListener);
			instructionsScreen.addEventListener(EventType.STOP_SOUND, soundEventListener);
			
			addChild(instructionsScreen);
			
			_factory_is = null;
			System.pauseForGCIfCollectionImminent();
		}
		
		private function createLevelInScreen():void{
			_library_lis = _libraryManager.library_lis;
			_factory_lis = new LevelInScreenFactory(_layout_lis, _library_lis);
			levelInScreen = _factory_lis.createScreen();
			addChild(levelInScreen);
			_factory_lis = null;
			System.pauseForGCIfCollectionImminent(0.25);
		}
		
		private function createLevelOverScreen():void{
			_library_los = _libraryManager.library_los;
			_factory_los = new LevelOverScreenFactory(_layout_los, _library_los);
			levelCompletedScreen = _factory_los.createScreen();
			levelCompletedScreen.addEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			levelCompletedScreen.addEventListener(EventType.PLAY_SOUND, soundEventListener);
			levelCompletedScreen.addEventListener(EventType.STOP_SOUND, soundEventListener);
			addChild(levelCompletedScreen);
			_factory_los = null;
			System.pauseForGCIfCollectionImminent(0.25);
		}
		
		private function createGame():void{
			game = new Game_DFSW_4_1_2_2(_layout_game, _library_game);
			game.newGame();
			game.addEventListener(EventType.SCORE_BOARD_SHOW, onScoreBoardShow);
			game.addEventListener(EventType.SCORE_BOARD_HIDE, onScoreBoardHide);
			game.addEventListener(EventType.SCORE_BOARD_UPDATE, onScoreBoardUpdate);
			game.addEventListener(EventType.SINGLE_TASK_COMPLETED, onSingleTaskCompleted);
			game.addEventListener(EventType.SINGLE_TASK_FAILED, onSingleTaskFailed);
			game.addEventListener(EventType.LEVEL_COMPLETED, onLevelCompleted);
			game.addEventListener(EventType.LEVEL_FAILED, onLevelFailed);
			game.addEventListener(EventType.ESCAPE_TO_MENU, onExitToMenu);
			
			
			game.addEventListener(EventType.PLAY_SOUND, soundEventListener);
			game.addEventListener(EventType.STOP_SOUND, soundEventListener);
			
			game.addEventListener(EventType.ADJUST_VOLUME, onSoundAdjust);
			game.addEventListener(EventType.MUTE_SOUND, onSoundMute);
			
			addChild(game);
			System.pauseForGCIfCollectionImminent(0.25);
		}
		
		private function createScoreBoard():void{
			_factory_sb = new ControlPanelFactory(_layout_sb, _library_sb);
			scoreBoard = _factory_sb.createControlPanel();
			
			var scoreElementScore:ScoreElement = new ScoreElement(7, 14, Constants.SCORE_BOARD_STEPS, 60, 25, 230, "0", 50, null, "Verdana", 14, 0x000000);
			scoreBoard.addScoreElement(scoreElementScore);
			
			scoreBoard.addEventListener(EventType.PLAY_SOUND, soundEventListener);
			scoreBoard.addEventListener(EventType.STOP_SOUND, soundEventListener);
			
			scoreBoard.addEventListener(EventType.ADJUST_VOLUME, onSoundAdjust);
			scoreBoard.addEventListener(EventType.MUTE_SOUND, onSoundMute);
			
			(scoreBoard as ControlPanel).setEndPoints(_layout_sb.score_board_pos_out_x,
				_layout_sb.score_board_pos_out_y, 
				_layout_sb.score_board_pos_on_x, 
				_layout_sb.score_board_pos_on_y);
			
			addChild(scoreBoard);
			
			_factory_sb = null;
		}
		
		private function destroyTitleScreen():void{
			titleScreen.removeEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			removeChild(titleScreen);
			(titleScreen as AnimatedScreen).clearify();
			titleScreen.dispose();
			titleScreen = null;
			_library_ts.clearify();
			_library_ts = null;
		}
		
		private function destroyMainMenuScreen():void{
			mainMenuScreen.removeEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			removeChild(mainMenuScreen);
			(mainMenuScreen as AnimatedScreen).clearify();
			mainMenuScreen.dispose();
			mainMenuScreen = null;
			_library_mms.clearify();
			_library_mms = null;
		}
		
		private function destroyInstructionsScreen():void{
			instructionsScreen.removeEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			removeChild(instructionsScreen);
			(instructionsScreen as AnimatedScreen).clearify();
			instructionsScreen.dispose();
			instructionsScreen = null;
			_library_is.clearify();
			_library_is = null;
		}
		
		private function destroyLevelInScreen():void{
			removeChild(levelInScreen);
			(levelInScreen as AnimatedScreen).clearify();
			levelInScreen.dispose();
			levelInScreen = null;
			_library_lis.clearify();
			_library_lis = null;
		}
		
		private function destroyLevelOverScreen():void{
			levelCompletedScreen.removeEventListener(EventType.BUTTON_CLICKED, onButtonClick);
			removeChild(levelCompletedScreen);
			(levelCompletedScreen as AnimatedScreen).clearify();
			levelCompletedScreen.dispose();
			levelCompletedScreen = null;
			_library_los.clearify();
			_library_los = null;
		}
		
		override public function systemSetTitle():void{
			switch(lastSystemState){
				case FrameWorkStates.SS_RUN_MAIN_MENU:
					destroyMainMenuScreen();
					break;
				case FrameWorkStates.SS_RUN_LEVEL_COMPLETED:
					break;
				case FrameWorkStates.SS_RUN_LEVEL_FAILED:
					break;
			}
			createTitleScreen();
			game.onSetTitleScreen();
			switchSystemState(FrameWorkStates.SS_RUN_TITLE);
		}
		
		override public function systemSetMainMenu():void{
			switch (lastSystemState){
				case FrameWorkStates.SS_RUN_TITLE:
					destroyTitleScreen();
					break;
				case FrameWorkStates.SS_RUN_INSTRUCTIONS:
					destroyInstructionsScreen();
					break;
				case FrameWorkStates.SS_RUN_LEVEL_COMPLETED:
					destroyLevelOverScreen();
					break;
			}
			createMainMenuScreen();
			game.onSetMainMenuScreen();
			switchSystemState(FrameWorkStates.SS_RUN_MAIN_MENU);
		}
		
		override public function systemInstructions():void{
			switch(lastSystemState){
				case FrameWorkStates.SS_RUN_MAIN_MENU:
					destroyMainMenuScreen();
					break;
			}
			createInstructionsScreen();
			game.onSetInstructionsScreen();
			switchSystemState(FrameWorkStates.SS_RUN_INSTRUCTIONS);
		}
		
		override public function systemLevelIn():void{
			super.systemLevelIn();
			game.onSetLevelInScreen();
		}
		
		override public function systemNewLevel():void{
			switch(lastSystemState){
				case FrameWorkStates.SS_RUN_MAIN_MENU:
					destroyMainMenuScreen();
					break;
				case FrameWorkStates.SS_RUN_LEVEL_COMPLETED:
					destroyLevelOverScreen();
					break;
			}
			setupNewLevelForGameInstance();
			scoreBoard.newLevel();
			createScoreBoardGraphicElements();
			createLevelInScreen();
			updateLevelInScreen();
			
			game.newLevel();
			
			switchSystemState(FrameWorkStates.SS_SET_LEVEL_IN);
		}
		
		override public function systemRunLevelIn():void{
			levelInScreen.runScreen();
			waitCount++;
			if(waitCount > waitTime){
				waitCount = 0;
				(levelInScreen as LevelInScreenAnimated).disappear();
			}
			
			if((levelInScreen as LevelInScreenAnimated).done){
				dispatchEvent(new Event(EventType.WAIT_COMPLETE));
			}
			
		}
		
		
		override public function systemLevelCompleted():void{
			var psuper:int;
			var pprim:int;
			var psec:int;
			createLevelOverScreen();
			var isSuperAchieved:Boolean = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[0].isCompleted;
			var current:int = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[0].current;
			psuper = current;
			var text:String = current.toString();
			text += " / ";
			text += _levelConditions[_levelCounter.currentLevel].levelGoalProgress[0].spec.needed;
			(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.TXT_GOAL_SUPER, text);
			var type:int;
			var strType:String = ScreenObjectId.IMG_SCORE_ICON;
			(levelCompletedScreen as AnimatedScreen).updateScreenData(Constants.SCORE_BOARD_SUPER, strType);
			if(isSuperAchieved){
				(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.IMG_LOS_CUP_GOLD, ScreenObjectId.IMG_LOS_CUP_COMPLETED_GOLD);
			}else{
				(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.IMG_LOS_CUP_GOLD, ScreenObjectId.IMG_LOS_CUP_FAILED_GOLD);
			}
			var isPrimaryAchieved:Boolean = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[1].isCompleted;
			current = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[1].current;
			pprim = current;
			text = current.toString();
			text += " / ";
			text += _levelConditions[_levelCounter.currentLevel].levelGoalProgress[1].spec.needed;
			(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.TXT_GOAL_PRIMARY, text);
			
			type = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[1].spec.type;
			strType = chooseGoalType(type);
			trace("primary goal type = " + strType);
			(levelCompletedScreen as AnimatedScreen).updateScreenData(Constants.SCORE_BOARD_PRIMARY, strType);
			
			if(isPrimaryAchieved){
				(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.IMG_LOS_CUP_SILVER, ScreenObjectId.IMG_LOS_CUP_COMPLETED_SILVER);
				(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.BTN_WHAT_NEXT, ScreenObjectId.BTN_CONTINUE);
				game.onSetLevelPassed();
			}else{
				(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.IMG_LOS_CUP_SILVER, ScreenObjectId.IMG_LOS_CUP_FAILED_SILVER);
				(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.BTN_WHAT_NEXT, ScreenObjectId.BTN_RETRY_LEVEL);
				game.onSetLevelFailed();
			}
			var isSecondaryAchieved:Boolean = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[2].isCompleted;
			current = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[2].current;
			psec = current;
			text = current.toString();
			text += " / ";
			text += _levelConditions[_levelCounter.currentLevel].levelGoalProgress[2].spec.needed;
			(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.TXT_GOAL_SECONDARY, text);
			type = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[2].spec.type;
			strType = chooseGoalType(type);
			(levelCompletedScreen as AnimatedScreen).updateScreenData(Constants.SCORE_BOARD_SECONDARY, strType);
			if(isSecondaryAchieved){
				(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.IMG_LOS_CUP_BRONZE, ScreenObjectId.IMG_LOS_CUP_COMPLETED_BRONZE);
			}else{
				(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.IMG_LOS_CUP_BRONZE, ScreenObjectId.IMG_LOS_CUP_FAILED_BRONZE);
			}
			var nameStrId:String;
			if(isSuperAchieved && isPrimaryAchieved && isSecondaryAchieved){
				nameStrId = ScreenObjectId.IMG_LOS_COMPLETED;
			}else if(!isPrimaryAchieved){
				nameStrId = ScreenObjectId.IMG_LOS_FAILED;
			}else{
				nameStrId = ScreenObjectId.IMG_LOS_PASSED;
			}
			(levelCompletedScreen as AnimatedScreen).updateScreenData(ScreenObjectId.IMG_LOS_NAME, nameStrId);
			var levelProgress:Vector.<SingleGoalProgress> = _levelConditions[_levelCounter.currentLevel].levelGoalProgress;
			for(var i:int = 0; i < levelProgress.length; i++){
				levelProgress[i].resume();
			}
			if(_gameMode == Mode.STRICT){
				var levelPass:LevelPass = _levelConditions[_levelCounter.currentLevel].levelPass;
				levelPass.resume();
			}
			if(isPrimaryAchieved){
				// пока все уровни ZEN mode открыты, запоминаем прогресс только для режима STRICT.
				// в дальнейшем это условие должно быть снято
				if(_gameMode == Mode.STRICT){
					_gameData.updateData(_levelCounter.currentLevel, psuper, pprim, psec);
				}
				
				_levelCounter.completedLevel = _levelCounter.currentLevel;
			}
			(scoreBoard as ControlPanel).removeGraphicElements();
			switchSystemState(FrameWorkStates.SS_RUN_LEVEL_COMPLETED);
		}
		
		override public function onButtonClick(event:Event):void{
			var stateToSwitch:int;
			switch(event.data){
				case FrameWorkStates.SS_GO_TO_LEVEL_0:
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					_levelCounter.currentLevel = 0;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_1:
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					_levelCounter.currentLevel = 1;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_2:
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					_levelCounter.currentLevel = 2;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_3:
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					_levelCounter.currentLevel = 3;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_4:
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					_levelCounter.currentLevel = 4;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_5:
					trace("going to level 5...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 5;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_6:
					trace("going to level 6...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 6;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_7:
					trace("going to level 7...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 7;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_8:
					trace("going to level 8...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 8;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_9:
					trace("going to level 9...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 9;
					break;
				//--------------------
				case FrameWorkStates.SS_GO_TO_LEVEL_10:
					trace("going to level 10.....");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 0;
					_levelCounter.currentLevel = 10;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_11:
					trace("going to level 11....");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 1;
					_levelCounter.currentLevel = 11;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_12:
					trace("going to level 12...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 12;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_13:
					trace("going to level 13...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 13;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_14:
					trace("going to level 14...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 14;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_15:
					trace("going to level 15...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 15;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_16:
					trace("going to level 16...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 16;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_17:
					trace("going to level 17...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 17;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_18:
					trace("going to level 18...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 18;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_19:
					trace("going to level 19...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 19;
					break;
				//--------------------------------------------
				case FrameWorkStates.SS_GO_TO_LEVEL_20:
					trace("going to level 20.....");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 0;
					_levelCounter.currentLevel =20;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_21:
					trace("going to level 21....");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 1;
					_levelCounter.currentLevel = 21;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_22:
					trace("going to level 22...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 22;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_23:
					trace("going to level 23...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 23;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_24:
					trace("going to level 24...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 24;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_25:
					trace("going to level 25...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 25;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_26:
					trace("going to level 26...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 26;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_27:
					trace("going to level 27...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 27;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_28:
					trace("going to level 28...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 28;
					break;
				case FrameWorkStates.SS_GO_TO_LEVEL_29:
					trace("going to level 29...");
					stateToSwitch = FrameWorkStates.SS_NEW_LEVEL;
					//_currentLevel = 2;
					_levelCounter.currentLevel = 29;
					break;
				//-----------------------------------------------
				
				case FrameWorkStates.SS_NEW_LEVEL:
					trace("going to new level...");
					stateToSwitch = int(event.data);
					//_currentLevel = _levelCounter.currentLevel;
					break;
				default:
					stateToSwitch = int(event.data);
					break;
			}
			switchSystemState(stateToSwitch);
		}
		
		/*
		override protected function onLevelCompleted(event:Event):void{
			super.onLevelCompleted(event);
		}
		
		override protected function onLevelFailed(event:Event):void{
			super.onLevelFailed(event);
		}
		*/
		
		private function setupNewLevelForGameInstance():void{
			(game as Game_DFSW_4_1_2_2).setupLevelConditions(_levelConditions[_levelCounter.currentLevel]);
			
			var obstacleLayout:Vector.<Vector.<int>>;
			for(var i:int = 0; i < _levelObstaclesLayout.length; i++){
				if(_levelCounter.currentLevel == _levelObstaclesLayout[i].levelNum){
					obstacleLayout = _levelObstaclesLayout[i].layout;
					break;
				}
			}
			(game as Game_DFSW_4_1_2_2).setupObstacleLayout(obstacleLayout);
		}
		
		private function createScoreBoardGraphicElements():void{
			(scoreBoard as ControlPanel).createGraphicElementSuperGoal();
			
			var primaryGoalType:int = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[1].spec.type;
			(scoreBoard as ControlPanel).createGraphicElementPrimaryGoal(primaryGoalType);
			
			var secondaryGoalType:int = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[2].spec.type;
			(scoreBoard as ControlPanel).createGraphicElementSecondaryGoal(secondaryGoalType);
			
			if(_gameMode == Mode.STRICT){
				var lims:int = _levelConditions[_levelCounter.currentLevel].levelPass.limits.value;
				(scoreBoard as ControlPanel).defineProgressBarMaxValue(lims);
				//trace("current level limitations = " + lims + "steps");
			}else{
				// здесь необходимо добавить код, устанавливающий ProgressBarLine в исходное положение
				(scoreBoard as ControlPanel).resetProgressBar();
			}
		}
		private function updateLevelInScreen():void{
			var superGoalNeeded:int = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[0].spec.needed;	
			
			var primaryGoalType:int = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[1].spec.type;
			var primaryGoalTypeStr:String = chooseGoalType(primaryGoalType);
			var primaryGoalNeeded:int = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[1].spec.needed;
			
			var secondaryGoalType:int = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[2].spec.type;
			var secondaryGoalTypeStr:String = chooseGoalType(secondaryGoalType);
			var secondaryGoalNeeded:int = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[2].spec.needed;
			
			(levelInScreen as LevelInScreenAnimated).updateScreenData(ScreenObjectId.TXT_GOAL_SUPER, superGoalNeeded.toString());
			
			(levelInScreen as LevelInScreenAnimated).updateScreenData(Constants.SCORE_BOARD_PRIMARY, primaryGoalTypeStr);
			(levelInScreen as LevelInScreenAnimated).updateScreenData(ScreenObjectId.TXT_GOAL_PRIMARY, primaryGoalNeeded.toString());
			
			(levelInScreen as LevelInScreenAnimated).updateScreenData(Constants.SCORE_BOARD_SECONDARY, secondaryGoalTypeStr);
			(levelInScreen as LevelInScreenAnimated).updateScreenData(ScreenObjectId.TXT_GOAL_SECONDARY, secondaryGoalNeeded.toString());
		}
		private function onScoreBoardShow(e:Event):void{
			(scoreBoard as ControlPanel).show();
		}
		
		private function onScoreBoardHide(e:Event):void{
			(scoreBoard as ControlPanel).hide();
		}
		
		private function onSingleTaskCompleted(e:Event):void{
			(scoreBoard as ControlPanel).completeTask(e.data.toString());
		}
		
		private function onSingleTaskFailed(e:Event):void{
			(scoreBoard as ControlPanel).failTask(e.data.toString());
		}
		
		private function chooseGoalType(pt:int):String{
			var str:String;
			switch(pt){
				case 0:
					str = ScreenObjectId.IMG_DIAM_0;
					break;
				case 1:
					str = ScreenObjectId.IMG_DIAM_1;
					break;
				case 2:
					str = ScreenObjectId.IMG_DIAM_2;
					break;
				case 3:
					str = ScreenObjectId.IMG_DIAM_3;
					break;
				case 4:
					str = ScreenObjectId.IMG_DIAM_4;
					break;
				case 5:
					str = ScreenObjectId.IMG_DIAM_5;
					break;
				case 6:
					str = ScreenObjectId.IMG_DIAM_6;
					break;
				case 7:
					str = ScreenObjectId.IMG_DIAM_7;
					break;
				case 8:
					str = ScreenObjectId.OBSTACLE_GLASS;
					break;
				case 9:
					str = ScreenObjectId.OBSTACLE_FULL;
					break;
			}
			return str;
		}
		
		private function onExitToMenu(evt:Event):void{
			var psuper:int;
			var pprim:int;
			var psec:int;
			var isSuperAchieved:Boolean = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[0].isCompleted;
			var current:int = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[0].current;
			psuper = current;
			var isPrimaryAchieved:Boolean = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[1].isCompleted;
			var levelProgress:Vector.<SingleGoalProgress> = _levelConditions[_levelCounter.currentLevel].levelGoalProgress;
			pprim = current;
			var isSecondaryAchieved:Boolean = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[2].isCompleted;
			current = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[2].current;
			psec = current;
			/*
			var isPrimaryAchieved:Boolean = _levelConditions[_levelCounter.currentLevel].levelGoalProgress[1].isCompleted;
			var levelProgress:Vector.<SingleGoalProgress> = _levelConditions[_levelCounter.currentLevel].levelGoalProgress;
			*/
			for(var i:int = 0; i < levelProgress.length; i++){
				levelProgress[i].resume();
			}
			if(_gameMode == Mode.STRICT){
				var levelPass:LevelPass = _levelConditions[_levelCounter.currentLevel].levelPass;
				levelPass.resume();
			}
			(scoreBoard as ControlPanel).removeGraphicElements();
			switchSystemState(FrameWorkStates.SS_SET_MAIN_MENU);
			if(isPrimaryAchieved){
				// пока все уровни ZEN mode открыты, запоминаем прогресс только для режима STRICT.
				// в дальнейшем это условие должно быть снято
				if(_gameMode == Mode.STRICT){
					_gameData.updateData(_levelCounter.currentLevel, psuper, pprim, psec);
				}
				_levelCounter.completedLevel = _levelCounter.currentLevel;
			}
		}
		
		private function onSetGameMode(e:Event):void{
			_gameMode = e.data.toString();
			switch(_gameMode){
				case Mode.STRICT:
					_gameData = _gameDataStrict;
					_levelCounter = _levelCounterStrict;
					_levelConditions = _levelConditionsStrict;
					break;
				case Mode.ZEN:
					_levelCounter = _levelCounterZen;
					_levelConditions = _levelConditionsZen;
					break;
			}
			
		}
		
	}
}