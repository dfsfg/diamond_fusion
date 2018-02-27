package classes.game
{
	import assets.layout.abstract.AbstractLayout_Game;
	import assets.libraries.abstract.AbstractLibrary_Game;
	
	import cc.wgd.framework_on_starling.EventType;
	import cc.wgd.framework_on_starling.Game;
	import cc.wgd.framework_on_starling.ScoreBoardUpdateData;
	import cc.wgd.framework_on_starling.SoundEventData;
	import cc.wgd.physics.math.Vector2D;
	
	import classes.game.constants.Constants;
	import classes.game.constants.SoundNames;
	import classes.game.elements.BonusSpec;
	import classes.game.elements.Element;
	import classes.game.elements.ElementConstants;
	import classes.game.elements.TreeNode;
	import classes.game.elements.VertexId;
	import classes.game.grid.HexBasedGraph;
	import classes.game.grid.Hexagon;
	import classes.game.grid.Matrix4Hexagon;
	import classes.game.grid.SwitchPathsGenerator;
	import classes.game.grid.Vertex;
	import classes.game.obstacles.Obstacle;
	import classes.game.particleEffects.FireworksMover;
	import classes.levels.LevelConditions;
	import classes.levels.LevelObstaclesLayout;
	import classes.levels.LevelPass;
	import classes.levels.SingleGoalProgress;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.system.System;
	import flash.utils.getTimer;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class Game_DFSW_4_1_2_2 extends Game
	{
		private var _library:AbstractLibrary_Game;
		private var _layout:AbstractLayout_Game;
		private var _levelProgress:Vector.<SingleGoalProgress>;
		private var _levelPass:LevelPass;
		private var _superGoalStr:String;
		private var _secondaryGoalStr:String;
		private var _primaryGoalStr:String;
		private var _time:int;
		private var _secs:int;
		private var _mins:int;
		private var _levelTime:String;
		private var _isTimeCounted:Boolean;
		private var _score:int;
		private var _steps:int;
		private var _swapFlag:Boolean;
		private var _hexagonRows:Vector.<Vector.<Vector.<VertexId>>>;
		private var _vertexes:Vector.<Vector.<Vertex>>;
		private var _bonusBitmaps:Vector.<Bitmap>;
		private var _elBitmaps:Vector.<Bitmap>;
		private var _elements:Vector.<Vector.<Element>>;
		private var _newElements:Vector.<Vector.<Element>>;
		private var _specElements:Vector.<Element>;
		private var _recreatedElements:Vector.<Element>;
		private var _obstacles:Vector.<Vector.<Obstacle>>;
		private var _height:Number;
		private var _fallingRowNum:int;
		private var _fallingDirection:int;
		private var _downButtonPanelSprite:Sprite;
		private var _downButtonPanelImage:Image;
		private var _hexagonImage:Image;
		private var _hexagonSprite:Sprite;
		private var _btnMenu:Button;
		private var _btnNext:Button;
		private var _panelMenuExitSprite:Sprite;
		private var _panelExitBGImage:Image;
		private var _panelMenuExitMessageImage:Image;
		private var _panelNextSprite:Sprite;
		private var _panelNextImage:Image;
		private var _panelNextConfirmImage:Image;
		private var _btnYes:Button;
		private var _btnNo:Button;
		private var _btnOk:Button;
		private var _btn_next_cur_pos_y:Number;
		private var _downPanelPosOnScreen:Point;
		private var _downPanelPosOutScreen:Point;
		private var _downPanelPosCurY:Number;
		private var _hexagonPosOnScreen:Point;
		private var _hexagonPosOutScreen:Point;
		private var _hexagonPosCurX:Number;
		private var _ddpPosOnScreen:Point;
		private var _ddpPosOutScreen:Point;
		private var _ddpCurPosY:Number;
		private var _ddpOnScreen:Boolean;
		private var _exitToMenu:Boolean;
		private var _exitToNextLevel:Boolean;
		private var _velocity:Number;
		private var _hasToBeShown:Boolean;
		private var _hasBeenShown:Boolean;
		private var _btnNextAdded:Boolean;
		private var systemGameFunction:Function;
		private var _currentGameState:int;
		private var _previousGameState:int;
		private var _stateBeforeUserExit:int;
		private var _switchedEl_1:Element;
		private var _switchedEl_2:Element;
		
		private var _is_switchedEl_1_Choosen:Boolean;
		private var _is_switchedEl_2_Choosen:Boolean;
		private var _branch:int;
		
		
		private var _firstId:VertexId;
		private var _secondId:VertexId;
		private var _touchEventBlocker:Boolean;
		private var _firstColumn:int;
		private var _secondColumn:int;
		private var _firstNum:int;
		private var _secondNum:int;
		private var _touched_el_X0:Number;
		private var _touched_el_Y0:Number;
		private var _touched_delta_X:Number;
		private var _touched_delta_Y:Number;
		private var _touched_el_drag_dist:Number;
		private var _switchPaths:Vector.<Vector.<Point>>;
		private var _isAnyDestroyed:Boolean;
		private var _isAnyMoved:Boolean;
		private var _isAllAlive:Boolean;
		private var _deletedGroups:Vector.<Vector.<Element>>;
		private var _vertexLineGroups:Vector.<int>;
		private var _deletedTrees:Vector.<TreeNode>;
		private var _checkedColumn:int;
		private var _checkedRow:int;
		private var _elementsToSwap:Vector.<Element>;
		private var _advice:Element;
		private var _timeToShowAdvice:int;
		private var _isAdviceChecked:Boolean;
		private var _showAdvice:Boolean;
		private var _at:int;
		private var _ats:int = 3;
		private var _fireworks:Vector.<Sprite>;
		private var _fireworkMovers:Vector.<FireworksMover>;
		
		private var _touchPhaseMovedUnlocked:Boolean;
		private var _touchPhaseEndedUnlocked:Boolean;
		
		public function Game_DFSW_4_1_2_2(playout:AbstractLayout_Game, plibrary:AbstractLibrary_Game)
		{
			super();
			init(playout, plibrary);
		}
		
		private function init(playout:AbstractLayout_Game, plibrary:AbstractLibrary_Game):void{
			_layout = playout;
			_library = plibrary;
			
			var matrix4Hexagon:Matrix4Hexagon = new Matrix4Hexagon(5);
			var hexagon:Hexagon = new Hexagon(matrix4Hexagon);
			matrix4Hexagon = null;
			
			_hexagonRows = hexagon.hexagon;
			hexagon = null;
			
			var graph:HexBasedGraph = new HexBasedGraph(_hexagonRows, new Point(_layout.hex_pos_on_x, _layout.hex_pos_on_y), _layout.element_side);
			_vertexes = graph.vertexes;
			graph = null;
			
			var switchPathGenerator:SwitchPathsGenerator = new SwitchPathsGenerator(_layout.element_side, 0);
			_switchPaths = switchPathGenerator.paths;
			switchPathGenerator = null;
			
			_height = _layout.created_element_height;
			_fallingDirection = 1;
			
			createBackgroundImages();
			
			createObstacles();
			createBonusBitmaps();
			createElementBitmaps();
			
			_elements = new Vector.<Vector.<Element>>;
			for(var i:int = 0; i < _vertexes.length; i++){
				var tempElements:Vector.<Element> = new Vector.<Element>;
				_elements.push(tempElements);
			}
			
			_newElements = new Vector.<Vector.<Element>>;
			
			for(i = 0; i < _vertexes.length; i++){
				var newTempElements:Vector.<Element> = new Vector.<Element>;
				_newElements.push(newTempElements);
			}
			
			_recreatedElements = new Vector.<Element>;
			
			_deletedGroups = new Vector.<Vector.<Element>>;
			_vertexLineGroups = new Vector.<int>;
			_deletedTrees = new Vector.<TreeNode>;
			_specElements = new Vector.<Element>;
			_elementsToSwap = new Vector.<Element>;
			
			_hasToBeShown = true;
			_hasBeenShown = false;
			
			
		}
		
		override public function newGame():void{
			
		}
		
		public function  setupLevelConditions(conditions:LevelConditions):void{
			_levelProgress = conditions.levelGoalProgress;
			_levelPass = conditions.levelPass;
		}
		
		
		override public function newLevel():void{
			_isAnyDestroyed = false;
			_isAnyMoved = false;
			
			_is_switchedEl_1_Choosen = false;
			_is_switchedEl_2_Choosen = false;
			
			_secs = 0;
			_mins = 0;
			_isTimeCounted = false;
			
			_score = 0;
			_steps = 0;
			
			_exitToMenu = false;
			_btnNextAdded = false;
			
			dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_SCORE, "0")));
			dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_TIME, "0")));
			
			_superGoalStr = _levelProgress[0].spec.needed.toString();
			var str0:String = "00 / " + _superGoalStr;
			dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_SUPER, str0)));
			
			_primaryGoalStr = _levelProgress[1].spec.needed.toString();
			var str1:String = "00 / " + _primaryGoalStr;
			dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_PRIMARY, str1)));
			
			_secondaryGoalStr = _levelProgress[2].spec.needed.toString();
			var str2:String = "00 / " + _secondaryGoalStr;
			dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_SECONDARY, str2)));
			
			updateSwapsOnScoreBoard();
			
			createVeryFirstElements();
			
			_btnNext.y = _layout.btn_next_pos_out_y;
			switchGameState(GameStates.STATE_APPEAR);
			
		}
		
		override public function runGame():void{
			systemGameFunction();
			
		}
		
		override public function onSetTitleScreen():void{
			var soundEventData:SoundEventData = new SoundEventData(SoundNames.MUSIC_2_LEVEL_IN, true, 10);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
		}
		
		override public function onSetMainMenuScreen():void{
			var soundEventData:SoundEventData = new SoundEventData(SoundNames.MUSIC_1_MAIN_MENU, true, 10);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
		}
		
		override public function onSetInstructionsScreen():void{
			var soundEventData:SoundEventData = new SoundEventData(SoundNames.MUSIC_2_LEVEL_IN, true, 10);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
		}
		
		override public function onSetLevelInScreen():void{
			var soundEventData:SoundEventData = new SoundEventData(SoundNames.MUSIC_2_LEVEL_IN, true, 10);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
		}
		
		override public function onSetLevelFailed():void{
			var soundEventData:SoundEventData = new SoundEventData(SoundNames.MUSIC_4_LEVEL_FAILED, true, 10);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
		}
		
		override public function onSetLevelPassed():void{
			var soundEventData:SoundEventData = new SoundEventData(SoundNames.MUSIC_5_LEVEL_PASSED, true, 10);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
		}
		
		private function createElementBitmaps():void{
			_elBitmaps = _library.elBitmaps;
			
		}
		
		private function createBonusBitmaps():void{
			_bonusBitmaps = _library.bonusBitmaps;
			
		}
		
		private function createBackgroundImages():void{
			_velocity = _layout.hex_velo;
			
			_downPanelPosOnScreen = new Point(_layout.panel_pos_on_x, _layout.panel_pos_on_y);
			_downPanelPosOutScreen = new Point(_layout.panel_pos_out_x, _layout.panel_pos_out_y);
			_downPanelPosCurY = _downPanelPosOutScreen.y;
			
			_downButtonPanelSprite = new Sprite();
			_downButtonPanelSprite.x = _downPanelPosOutScreen.x;
			_downButtonPanelSprite.y = _downPanelPosOutScreen.y;
			
			_downButtonPanelImage = new Image(_library.down_panel_texture);
			
			_downButtonPanelSprite.addChild(_downButtonPanelImage);
			addChild(_downButtonPanelSprite);
			
			_hexagonPosOnScreen = new Point(_layout.hex_pos_on_x, _layout.hex_pos_on_y);
			_hexagonPosOutScreen = new Point(_layout.hex_pos_out_x, _layout.hex_pos_out_y);
			_hexagonPosCurX = _hexagonPosOutScreen.x;
			
			_hexagonImage = new Image(_library.hexagonTexture);
			
			_hexagonSprite = new Sprite();
			_hexagonSprite.x = _hexagonPosOutScreen.x - _hexagonImage.width / 2;
			_hexagonSprite.y = _hexagonPosOutScreen.y - _hexagonImage.height / 2;
			
			_hexagonSprite.addChild(_hexagonImage);
			
			addChild(_hexagonSprite);
			
			_btnMenu = new Button(_library.btnMainMenuTexture);
			_btnMenu.x = _layout.btn_main_menu_pos_on_x - _btnMenu.width / 2;
			_btnMenu.y = _layout.btn_main_menu_pos_on_y - _btnMenu.height / 2;
			_btnMenu.addEventListener(Event.TRIGGERED, onBtnMainMenuClick);
			_downButtonPanelSprite.addChild(_btnMenu);
			
			_btnNext = new Button(_library.btnNextTexture);
			_btnNext.x = _layout.btn_next_pos_on_x - _btnNext.width / 2;
			_btnNext.y = _layout.btn_next_pos_out_y - _btnNext.height / 2;
			_btnNext.addEventListener(Event.TRIGGERED, onBtnNextClick);
			_downButtonPanelSprite.addChild(_btnNext);
			
			_btn_next_cur_pos_y = _layout.btn_next_pos_out_y; 
			
			_ddpPosOnScreen = new Point(_layout.panel_drop_down_pos_on_x, _layout.panel_drop_down_pos_on_y);
			_ddpPosOutScreen = new Point(_layout.panel_drop_down_pos_out_x, _layout.panel_drop_down_pos_out_y);
			_ddpCurPosY = _layout.panel_drop_down_pos_out_y;
			
			_ddpOnScreen = false;
			_exitToMenu = false;
			
		}
		
		private function createVeryFirstElements():void{
			var type:int;
			var tempElement:Element;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = _elements[i].length; j < _vertexes[i].length; j++){
					type = chooseNewElementType(i, j);
					var tempTexture:Texture = Texture.fromBitmap(_elBitmaps[type]);
					tempElement = new Element(type, tempTexture, _vertexes[i][j].xpos, _vertexes[i][j].ypos - _height, _vertexes[i][j].vertexId);
					tempElement.velo2D = new Vector2D(0, _layout.falling_velo);
					addChild(tempElement);
					_newElements[i].push(tempElement);
				}
			}
			_fallingRowNum = 0;
		}
		
		private function onBtnMainMenuClick(evt:Event):void{
			_stateBeforeUserExit = _currentGameState;
			createMenuDDP();
			removeSwitchEventListeners();
			removeDownPanelListeners();
			addChild(_panelMenuExitSprite);
			switchGameState(GameStates.STATE_SHOW_MENU_WARNING);
		}
		
		private function onBtnNextClick(evt:Event):void{
			_stateBeforeUserExit = _currentGameState;
			createNextDDPConfirm();
			removeSwitchEventListeners();
			removeDownPanelListeners();
			addChild(_panelNextSprite);
			switchGameState(GameStates.STATE_SHOW_NEXT_WARNING);
		}
		
		private function onBtnOkClick(evt:Event):void{
			switchGameState(GameStates.STATE_HIDE_NEXT_EXPLANATION);
		}
		
		private function onBtnMenuYesClick(evt:Event):void{
			_exitToMenu = true;
			addDownPanelListeners();
			switchGameState(GameStates.STATE_HIDE_MENU_WARNING);
		}
		
		private function onBtnMenuNoClick(evt:Event):void{
			_exitToMenu = false;
			addDownPanelListeners();
			addSwitchEventListeners();
			switchGameState(GameStates.STATE_HIDE_MENU_WARNING);
		}
		
		private function onBtnNextYesClick(evt:Event):void{
			_exitToNextLevel = true;
			addDownPanelListeners();
			switchGameState(GameStates.STATE_HIDE_NEXT_WARNING);
		}
		
		private function onBtnNextNoClick(evt:Event):void{
			_exitToNextLevel = false;
			addDownPanelListeners();
			addSwitchEventListeners();
			switchGameState(GameStates.STATE_HIDE_NEXT_WARNING);
		}
		
		private function switchGameState(stateVal:int):void{
			_previousGameState = _currentGameState;
			_currentGameState = stateVal;
			switch(stateVal){
				case GameStates.STATE_APPEAR:
					systemGameFunction = systemAppear;
					break;
				case GameStates.STATE_WAIT_FOR_USER_ACTION:
					systemGameFunction = systemWait;
					break;
				case GameStates.STATE_DISAPPEAR:
					systemGameFunction = systemDisappear;
					break;
				case GameStates.STATE_CREATE_NEW_ELEMENTS:
					systemGameFunction = systemCreateNewElements;
					break;
				case GameStates.STATE_NEW_ELEMENTS_FALL_DOWN:
					systemGameFunction = systemNewElementsFallDown;
					break;
				case GameStates.STATE_CHECK_3_IN_ROW:
					systemGameFunction = systemCheck3InRow;
					break;
				case GameStates.STATE_REPLACE_SWITCHED_ELEMENTS_FORWARD:
					systemGameFunction = systemSwitchForward;
					break;
				case GameStates.STATE_REPLACE_SWITCHED_ELEMENTS_BACKWARD:
					systemGameFunction = systemSwitchBackward;
					break;
				case GameStates.STATE_EXPLODE:
					systemGameFunction = systemExplode;
					break;
				case GameStates.STATE_MOVE_DOWN:
					systemGameFunction = systemMoveDown;
					break;
				case GameStates.STATE_LEVEL_COMPLETED:
					systemGameFunction = systemLevelCompleted;
					break;
				case GameStates.STATE_LEVEL_PASSED:
					systemGameFunction = systemLevelPassed;
					break;
				case GameStates.STATE_LEVEL_FAILED:
					systemGameFunction = systemLevelFailed;
					break;
				
				case GameStates.STATE_BTN_NEXT_APPEAR:
					systemGameFunction = systemBtnNextAppear;
					break;
				case GameStates.STATE_WAIT_FOR_USER_DECISION:
					systemGameFunction = systemWaitForMenuDecision;
					break;
				case GameStates.STATE_SHOW_MENU_WARNING:
					systemGameFunction = systemShowMenuWarning;
					break;
				
				case GameStates.STATE_HIDE_MENU_WARNING:
					systemGameFunction = systemHideMenuWarning;
					break;
				case GameStates.STATE_EXIT_MENU_PREPARE:
					systemGameFunction = systemExitMenuPrepare;
					break;
				case GameStates.STATE_SHOW_NEXT_WARNING:
					systemGameFunction = systemShowNextLevelConfirm;
					break;
				case GameStates.STATE_HIDE_NEXT_WARNING:
					systemGameFunction = systemHideNextLevelConfirm;
					break;
			}
		}
		
		private function systemAppear():void{
			var isApp_1:Boolean = false;
			var isApp_2:Boolean = false;
			
			_hexagonPosCurX -= _velocity;
			if(_hexagonPosCurX < _hexagonPosOnScreen.x - _hexagonImage.width / 2){
				_hexagonPosCurX = _hexagonPosOnScreen.x - _hexagonImage.width / 2;
				isApp_2 = true;
			}
			_hexagonSprite.x = _hexagonPosCurX;
			
			_downPanelPosCurY -= _velocity;
			if(_downPanelPosCurY < _downPanelPosOnScreen.y){
				_downPanelPosCurY = _downPanelPosOnScreen.y;
				isApp_1 = true;
			}
			_downButtonPanelSprite.y = _downPanelPosCurY;
			
			if(isApp_1 && isApp_2){
				dispatchEvent(new Event(EventType.SCORE_BOARD_SHOW));
				switchGameState(GameStates.STATE_NEW_ELEMENTS_FALL_DOWN);
			}
		}
		
		private function systemCreateNewElements():void{
			var random:int;
			var tempElement:Element;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = _elements[i].length; j < _vertexes[i].length; j++){
					random = new int(Math.random() * 8);
					var tempTexture:Texture = Texture.fromBitmap(_elBitmaps[random]);
					tempElement = new Element(random, tempTexture, _vertexes[i][j].xpos, _vertexes[i][j].ypos - _height, _vertexes[i][j].vertexId);
					tempElement = _recreatedElements[0];
					tempElement.recreate(random, tempTexture, _vertexes[i][j].xpos, _vertexes[i][j].ypos - _height, _vertexes[i][j].vertexId);
					tempElement.velo2D = new Vector2D(0, _layout.falling_velo);
					addChild(tempElement);
					_newElements[i].push(tempElement);
					_recreatedElements.splice(0, 1);
				}
			}
			_fallingRowNum = 0;
			switchGameState(GameStates.STATE_NEW_ELEMENTS_FALL_DOWN);
		}
		
		private function systemNewElementsFallDown():void{
			if(_newElements[_fallingRowNum].length > 0){
				_elements[_fallingRowNum].push(_newElements[_fallingRowNum][0]);
				_newElements[_fallingRowNum].splice(0, 1);
			}
			_fallingRowNum += _fallingDirection;
			if((_fallingRowNum == _newElements.length) && (_fallingDirection == 1)){
				_fallingRowNum--;
				_fallingDirection = -1;
			}
			if((_fallingRowNum < 0) && (_fallingDirection == - 1)){
				_fallingRowNum = 0;
				_fallingDirection = 1;
			}
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					var tempEl:Element = _elements[i][j];
					if(tempEl.status == ElementConstants.STATUS_MOVED){
						tempEl.pos2D = tempEl.pos2D.add(tempEl.velo2D);
						if((i == 0) && (j == 0)){
						}
						if(Math.abs(tempEl.pos2D.y - _vertexes[i][j].ypos) < _layout.epsilon_velo){
							tempEl.pos2D = new Vector2D(_vertexes[i][j].xpos, _vertexes[i][j].ypos);
							tempEl.velo2D = new Vector2D(0, 0);
							tempEl.status = ElementConstants.STATUS_WAITED;
						}
					}
				}
			}
			var isNewEmpty:Boolean = true;
			for(var k:int = 0; k < _newElements.length; k++){
				if(_newElements[k].length > 0){
					isNewEmpty = false;
					break;
				}
			}
			if(isNewEmpty){
				isFallen();
			}
			
		}
		
		private function systemCheck3InRow():void{
			
			calcAlive();
			var mustDie:Boolean = false;
			// сначала проверяем перестановку специальных элементов
			var specialDeletedGroup:Vector.<Element> = new Vector.<Element>;
			var currentSwitchedEl2:Element = _elements[_firstColumn][_firstNum];
			var currentSwitchedEl1:Element = _elements[_secondColumn][_secondNum];
			// trace("currentSwitchedEl1 = " + currentSwitchedEl1);
			// trace("currentSwitchedEl2 = " + currentSwitchedEl2);
			if(currentSwitchedEl1 && currentSwitchedEl2) {
				// trace("currentSwitchedEl1.special = " + currentSwitchedEl1.special);
				// trace("currentSwitchedEl2.special = " + currentSwitchedEl2.special);
			}
			if (currentSwitchedEl1 && currentSwitchedEl2 && currentSwitchedEl1.special && currentSwitchedEl2.special){
				// var tempDeletedGroup:Vector.<Element> = new Vector.<Element>;
				currentSwitchedEl1.status = ElementConstants.STATUS_EXPLODING;
				currentSwitchedEl1.velo2D = new Vector2D(0, 0);
				currentSwitchedEl2.status = ElementConstants.STATUS_EXPLODING;
				currentSwitchedEl2.velo2D = new Vector2D(0, 0);
				specialDeletedGroup.push(currentSwitchedEl1);
				specialDeletedGroup.push(currentSwitchedEl2);
				// прежде чем добавлять эту группу к удаляемым, нужно проверить условия "3 в ряд"
				// и убедиться, что ни один из этих двух элементов не входит в другую группу.
				// _deletedGroups.push(specialDeletedGroup);
				mustDie = true;
			}
			// затем проверяем услоие "3 в ряд"
			for(var i:int = 0; i < _hexagonRows.length; i++){
				for(var j:int = 0; j < _hexagonRows[i].length; j++){
					for(var k:int = 0; k < _hexagonRows[i][j].length; k++){
						var numsToDelete:Vector.<int> = new Vector.<int>;
						numsToDelete.push(k);
						var kLast:int = k + 1;
						var row:int = _hexagonRows[i][j][k].num_in_row;
						var column:int = _hexagonRows[i][j][k].num_of_row;
						var tempElement:Element = findElementById(new VertexId(column, row));
						if(kLast < _hexagonRows[i][j].length){
							row = _hexagonRows[i][j][kLast].num_in_row;
							column = _hexagonRows[i][j][kLast].num_of_row;
							var tempLastElement:Element = findElementById(new VertexId(column, row));
						}
						while((kLast < _hexagonRows[i][j].length) && (tempElement.type == tempLastElement.type)){
							numsToDelete.push(kLast);
							kLast++;
							if(kLast < _hexagonRows[i][j].length){
								row = _hexagonRows[i][j][kLast].num_in_row;
								column = _hexagonRows[i][j][kLast].num_of_row;
								tempLastElement = findElementById(new VertexId(column, row));
							}
						}
						
						if(numsToDelete.length > 2){
							var deletedGroup:Vector.<Element> = new Vector.<Element>;
							for(var l:int = 0; l < numsToDelete.length; l++){
								row = _hexagonRows[i][j][numsToDelete[l]].num_in_row;
								column = _hexagonRows[i][j][numsToDelete[l]].num_of_row;
								var deletedElement:Element = findElementById(new VertexId(column, row));
								deletedElement.status = ElementConstants.STATUS_EXPLODING;
								deletedElement.velo2D = new Vector2D(0, 0);
								deletedGroup.push(deletedElement);
							}
							_deletedGroups.push(deletedGroup);
							_vertexLineGroups.push(i);
							k += deletedGroup.length;
							mustDie = true;
						}else{
							numsToDelete.splice(0, numsToDelete.length);
						}
					}
				}
			}
			// проверяем элементы из спецгруппы на однократность вхождения
			for (i = specialDeletedGroup.length - 1; i >= 0; i--) {
				for (j = 0; j < _deletedGroups.length; j++) {
					var j_break:Boolean = false;
					for (k = 0; k < _deletedGroups[j].length; k++) {
						if (specialDeletedGroup[i] == _deletedGroups[j][k]) {
							trace ("Найден элемент, сидящий на 2 стульях!!! " + specialDeletedGroup[i].vertexId.hexCoords.toString());
							specialDeletedGroup.splice(i, 1);
							// обеспечиваем выход во внешний цикл
							j_break = true;
							break;
						}
					}
					if (j_break) break;
				}
			}
			// теперь спецгруппу можно добавить в общий список для уничтожения
			if (specialDeletedGroup.length > 0) {
				_deletedGroups.push(specialDeletedGroup);
			}
			
			if(mustDie){
				clearifyPossibleSwaps();
				
				clearifySwapVariables();
				
				
				calcMustDie();
				createDeletedTrees();
				setupFusionParameters();
				findOldSpecialsInDestroyed();
				checkDestroyedBySpecial();
				prepareFireworks();			
				var soundEventData:SoundEventData = new SoundEventData(SoundNames.SOUND_EXPLODED_DIAMOND);
				dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
				if(_swapFlag){
					countSteps();
				}
				System.pauseForGCIfCollectionImminent(0.25);
				switchGameState(GameStates.STATE_EXPLODE);
			}else{
				switch(_previousGameState){
					case GameStates.STATE_NEW_ELEMENTS_FALL_DOWN:
						if(!_isTimeCounted) _isTimeCounted = true;
						if(!checkGoalCompletion()){
							prepareToCheckingPossibleSwaps();
							switchGameState(GameStates.STATE_WAIT_FOR_USER_ACTION);
							addSwitchEventListeners();
							//trace("ready for user action");
						}
						
						break;
					case GameStates.STATE_REPLACE_SWITCHED_ELEMENTS_FORWARD:
						prepareElementsToSwitchBackward();
						
						clearifySwapVariables();
						
						switchGameState(GameStates.STATE_REPLACE_SWITCHED_ELEMENTS_BACKWARD);
						break;
				}
			}
		}
		
		private function systemExplode():void{
			runFireworks();
			var allHaveExploded:Boolean = true;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					var tempEl:Element = _elements[i][j];
					if(tempEl.status == ElementConstants.STATUS_ACTIVATED){
						if(tempEl.countDelay() == true){
							if(tempEl.special){
								var soundEventData:SoundEventData;
								if(tempEl.bonusSpec.bomb){
									soundEventData = new SoundEventData(SoundNames.SOUND_EXPLODED_BOMB);
								}else{
									soundEventData = new SoundEventData(SoundNames.SOUND_EXPLODED_LIGHTNING);
								}
								dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
							}
						}
					}
					if(tempEl.status == ElementConstants.STATUS_EXPLODING){
						if(tempEl.special){
							if(tempEl.bonusSpec.aged == true){
								tempEl.explode();
								_obstacles[i][j].explode();
								allHaveExploded = false;
							}
						}else{
							tempEl.explode();
							_obstacles[i][j].explode();
							tempEl.pos2D = tempEl.pos2D.add(tempEl.velo2D);
							allHaveExploded = false;
						}
						
					}
				}
			}
			if(allHaveExploded){
				for(i = 0; i < _elements.length; i++){
					for(j = 0; j < _elements[i].length; j++){
						if(_elements[i][j].status == ElementConstants.STATUS_EXPLODING){
							_elements[i][j].status = ElementConstants.STATUS_ALIVE;
							_elements[i][j].bonusSpec.growAged();
						}
						deactivateObstacleAndCalcScore(i, j);
					}
				}
				disposeDeletedGroups();
				disposeDeletedTrees();
				removeDeadElements();
				System.pauseForGCIfCollectionImminent(0.25);
				switchGameState(GameStates.STATE_MOVE_DOWN);
				removeFireworks();
			}
		}
		
		private function systemMoveDown():void{
			var allHasFallen:Boolean = true;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					if(_elements[i][j].status == ElementConstants.STATUS_MOVED){
						allHasFallen = false;
						_elements[i][j].pos2D = _elements[i][j].pos2D.add(new Vector2D(0, _layout.moving_velo));
						if(Math.abs(_elements[i][j].pos2D.y - _vertexes[i][j].ypos) < _layout.position_inaccuracy){
							_elements[i][j].pos2D = new Vector2D(_vertexes[i][j].xpos, _vertexes[i][j].ypos);
							_elements[i][j].status = ElementConstants.STATUS_ALIVE;
						}
					}
				}
			}
			if(allHasFallen){
				switchGameState(GameStates.STATE_CREATE_NEW_ELEMENTS);
			}
		}
		
		private function systemWait():void{
			checkPossibleSwaps();
			showPossibleSwap();
			checkForLevelOver();
		}
		
		private function systemSwitchForward():void{
			_elements[_firstColumn][_firstNum].moveSwitchedForward(_switchPaths);
			_elements[_secondColumn][_secondNum].moveSwitchedForward(_switchPaths);
			if((_elements[_firstColumn][_firstNum].status == ElementConstants.STATUS_ALIVE) 
				&& (_elements[_secondColumn][_secondNum].status == ElementConstants.STATUS_ALIVE)){
				_elements[_firstColumn][_firstNum].downlight();
				_elements[_secondColumn][_secondNum].downlight();
				switchGameState(GameStates.STATE_CHECK_3_IN_ROW);
			}
			
		}
		private function systemSwitchBackward():void{
			_elements[_firstColumn][_firstNum].moveSwitchedBackward(_switchPaths);
			_elements[_secondColumn][_secondNum].moveSwitchedBackward(_switchPaths);
			if((_elements[_firstColumn][_firstNum].status == ElementConstants.STATUS_ALIVE) 
				&& (_elements[_secondColumn][_secondNum].status == ElementConstants.STATUS_ALIVE)){
				_elements[_firstColumn][_firstNum].downlight();
				_elements[_secondColumn][_secondNum].downlight();
				addSwitchEventListeners();
				switchGameState(GameStates.STATE_WAIT_FOR_USER_ACTION);
				
			}
			
		}
		private function systemLevelCompleted():void{
			//runFireworks();
			runFinalExplosion2();
			if(checkFinalExplosion2()){
				finalizeLevelCompleted();
			}
		}
		private function systemLevelPassed():void{
			runFinalExplosion2();
			if(checkFinalExplosion2()){
				finalizeLevelPassed();
			}
		}
		private function systemLevelFailed():void{
			runFinalExplosion2();
			if(checkFinalExplosion2()){
				finalizeLevelFailed();
			}
		}
		private function systemDisappear():void{
			var isApp_1:Boolean = false;
			var isApp_2:Boolean = false;
			
			_downPanelPosCurY += _velocity;
			if(_downPanelPosCurY > _downPanelPosOutScreen.y){
				_downPanelPosCurY = _downPanelPosOutScreen.y;
				isApp_1 = true;
			}
			_downButtonPanelSprite.y = _downPanelPosCurY;
			
			_hexagonPosCurX += _velocity;
			if(_hexagonPosCurX > _hexagonPosOutScreen.x - _hexagonImage.width / 2){
				_hexagonPosCurX = _hexagonPosOutScreen.x - _hexagonImage.width / 2;
				isApp_2 = true;
			}
			_hexagonSprite.x = _hexagonPosCurX;
			
			if(isApp_1 && isApp_2){
				resetObstacles();
				if(!_exitToMenu){
					dispatchEvent(new Event(EventType.LEVEL_COMPLETED));
				}else{
					dispatchEvent(new Event(EventType.ESCAPE_TO_MENU));
				}
				
			}
		}
		private function systemShowMenuWarning():void{
			var appeared:Boolean = showDDP(_panelMenuExitSprite);
			if(appeared){
				switchGameState(GameStates.STATE_WAIT_FOR_USER_DECISION);
			}
		}
		private function systemWaitForMenuDecision():void{
			// do nothing - just wait
		}
		
		private function systemHideMenuWarning():void{
			var hidden:Boolean = hideDDP(_panelMenuExitSprite);
			if(hidden){
				switch(_exitToMenu){
					case true:
						switchGameState(GameStates.STATE_EXIT_MENU_PREPARE);
						break;
					case false:
						switchGameState(_stateBeforeUserExit);
						break;
				}
				disposeMenuDDP();
			}
		}
		
		/**  */
		private function systemExitMenuPrepare():void{
			var elementsRemoved:Boolean = removeAllElements();
			var fireworksRemoved:Boolean = removeAllFireworks();
			if(elementsRemoved && fireworksRemoved){
				dispatchEvent(new Event(EventType.SCORE_BOARD_HIDE));
				switchGameState(GameStates.STATE_DISAPPEAR);
			}
		}
		
		private function systemBtnNextAppear():void{
			if(btnNextAppear()){
				addSwitchEventListeners();
				switchGameState(_stateBeforeUserExit);
			}
		}
		private function systemShowNextLevelConfirm():void{
			var appeared:Boolean = showDDP(_panelNextSprite);
			if(appeared){
				switchGameState(GameStates.STATE_WAIT_FOR_USER_DECISION);
			}
		}
		private function systemHideNextLevelConfirm():void{
			var hidden:Boolean = hideDDP(_panelNextSprite);
			if(hidden){
				switch(_exitToNextLevel){
					case true:
						removeAllFireworks();
						prepareLevelCompleted();
						break;
					case false:
						switchGameState(_stateBeforeUserExit);
						break;
				}
				disposeNextDDPConfirm();
			}
		}
		
		private function createObstacles():void{
			var center:Vector2D = new Vector2D(_layout.hex_pos_on_x - _hexagonImage.width / 2, _layout.hex_pos_on_y - _hexagonImage.height / 2);
			_obstacles = new Vector.<Vector.<Obstacle>>;
			for(var i:int = 0; i < _vertexes.length; i++){
				var tempObstacles:Vector.<Obstacle> = new Vector.<Obstacle>;
				
				for(var j:int = 0; j < _vertexes[i].length; j++){
					var pos:Vector2D = new Vector2D(_vertexes[i][j].xpos, _vertexes[i][j].ypos);
					pos = pos.subtract(center);
					
					var tempObstacle:Obstacle = new Obstacle(_library.obstacleTextures, pos.x, pos.y);
					_hexagonSprite.addChild(tempObstacle);
					tempObstacles.push(tempObstacle);
				}
				_obstacles.push(tempObstacles);
			}
		}
		public function setupObstacleLayout(pObstacleLayout:Vector.<Vector.<int>>):void{			
			if(pObstacleLayout){
				for(var i:int = 0; i < _obstacles.length; i++){
					for(var j:int = 0; j < _obstacles[i].length; j++){
						_obstacles[i][j].reset();
						switch(pObstacleLayout[i][j]){
							case 0:
								_obstacles[i][j].type = 0;
								break;
							case 1:
								_obstacles[i][j].type = ElementConstants.TYPE_GLASS;
								break;
							case 2:
								_obstacles[i][j].type = ElementConstants.TYPE_STONE;
								break;
							
						}
					}
				}
			}
		}
		
		private function resetObstacles():void{
			for(var i:int = 0; i < _obstacles.length; i++){
				for(var j:int = 0; j < _obstacles[i].length; j++){
					_obstacles[i][j].reset();
				}
			}
		}
		private function deactivateObstacleAndCalcScore(pi:int, pj:int):void{
			var addToScore:int = 0;
			var multiply:int;
			if(_levelProgress[0].isCompleted){
				multiply = Constants.SCORE_RATE_SUPER;
			}else{
				multiply = 1;
			}
			var addOrNot:Boolean;
			addOrNot = _obstacles[pi][pj].deactivate();
			if(addOrNot){
				switch(_obstacles[pi][pj].type){
					case _levelProgress[1].spec.type:
						addToScore += Constants.SCORE_MARK_PRIMARY * multiply;
						break;
					case _levelProgress[2].spec.type:
						addToScore += Constants.SCORE_MARK_SECONDARY * multiply;
						break;;
				}
				updateGoalProgress(_obstacles[pi][pj].type);
				_score += addToScore;
				var str:String = _score.toString() + " / "; 
				str += _levelProgress[0].spec.needed.toString();
				dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_SUPER, str)));
				updateSuperGoalProgress(addToScore);
			}
			
		}
		
		private function isFallen():void{
			var res:Boolean = true;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					if(_elements[i][j].pos2D.y != _vertexes[i][j].ypos){
						res = false;
						break;
					}
				}
				if(!res){
					break;
				}
			}
			if(res){
				switchGameState(GameStates.STATE_CHECK_3_IN_ROW);
			}
		}
		
		private function findElementById(pid:VertexId):Element{
			var element:Element;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					if((_elements[i][j].vertexId.num_of_row == pid.num_of_row) && (_elements[i][j].vertexId.num_in_row == pid.num_in_row)){
						element = _elements[i][j];
						break;
					}
				}
			}
			return element;
		}
		
		private function findNewElementById(pid:VertexId):Element{
			var element:Element;
			for(var i:int = 0; i < _newElements.length; i++){
				for(var j:int = 0; j < _newElements[i].length; j++){
					if((_newElements[i][j].vertexId.num_of_row == pid.num_of_row) && (_newElements[i][j].vertexId.num_in_row == pid.num_in_row)){
						element = _newElements[i][j];
						break;
					}
				}
				if(element == null){
					element = findElementById(pid);
				}
			}
			return element;
		}
		
		private function findClosestElement(px:Number, py:Number):Element{
			var dist:Number = 2000;
			var element:Element;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					var currentDist:Number = Math.sqrt((px - _elements[i][j].xpos) * (px - _elements[i][j].xpos) + 
						(py - _elements[i][j].ypos) * (py - _elements[i][j].ypos));
					if(currentDist < dist){
						dist = currentDist;
						element = _elements[i][j];
					}
				}
			}
			//trace("distance to closest element = " + dist);
			return element;
		}
		
		
		
		private function calcMustDie():void{
			var mustDie:Number = 0;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					var tempEl:Element = _elements[i][j];
					if(_elements[i][j].status == ElementConstants.STATUS_EXPLODING){
						mustDie++;
						
						if(tempEl.special){
							var soundEventData:SoundEventData;
							if(tempEl.bonusSpec.bomb){
								soundEventData = new SoundEventData(SoundNames.SOUND_EXPLODED_BOMB);
							}else{
								soundEventData = new SoundEventData(SoundNames.SOUND_EXPLODED_LIGHTNING);
							}
							dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
						}
					}
				}
			}
		}
		
		private function calcAlive():void{
			var alive:Number = 0;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					if(_elements[i][j].status != ElementConstants.STATUS_EXPLODING){
						alive++;
					}
				}
			}
		}
		
		private function prepareElementsToSwitchForward(pSwapFirstEl:Boolean):Boolean{
			var res:Boolean;
			try{
				var tempEl_1:Element = _switchedEl_1.clone();
				var tempEl_2:Element = _switchedEl_2.clone();
				
				tempEl_1.defineStartSwitchForwardConditions(_switchedEl_2.pos2D, pSwapFirstEl);
				tempEl_2.defineStartSwitchForwardConditions(_switchedEl_1.pos2D);
				
				tempEl_1.highlight();
				tempEl_2.highlight();
				_firstId = new VertexId(tempEl_1.vertexId.num_of_row, tempEl_1.vertexId.num_in_row);
				_secondId = new VertexId(tempEl_2.vertexId.num_of_row, tempEl_2.vertexId.num_in_row);
				_firstColumn = _firstId.num_of_row;
				_secondColumn = _secondId.num_of_row;
				_firstNum = _elements[_firstColumn].indexOf(_switchedEl_1);
				_secondNum = _elements[_secondColumn].indexOf(_switchedEl_2);
				
				removeChild(findElementById(_firstId));
				removeChild(findElementById(_secondId));
				
				_elements[_firstColumn].splice(_firstNum, 1, tempEl_2);
				_elements[_secondColumn].splice(_secondNum, 1, tempEl_1);
				
				
				addChild(_elements[_firstColumn][_firstNum]);
				addChild(_elements[_secondColumn][_secondNum]);
				var tempVertexId:VertexId = new VertexId(tempEl_1.vertexId.num_of_row, tempEl_1.vertexId.num_in_row);
				tempEl_1.vertexId.copyValues(tempEl_2.vertexId);
				tempEl_2.vertexId.copyValues(tempVertexId);
				_swapFlag = true;
				res = true;
			}catch(e:RangeError){
				trace("Catched!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				if(findElementById(_firstId).parent == null){
					addChild(findElementById(_firstId));
				}
				if(findElementById(_secondId).parent == null){
					addChild(findElementById(_secondId));
				}
				_is_switchedEl_1_Choosen = false;
				_is_switchedEl_2_Choosen = false;
				_switchedEl_1 = null;
				_switchedEl_2 = null;
				res = false;
			}
			return res;	
		}
		
		private function prepareElementsToSwitchBackward():void{
			var tempEl_1:Element = _elements[_firstColumn][_firstNum].clone();
			var tempEl_2:Element = _elements[_secondColumn][_secondNum].clone();
			
			tempEl_1.defineStartSwitchBackwardConditions(_elements[_secondColumn][_secondNum].pos2D);
			tempEl_2.defineStartSwitchBackwardConditions(_elements[_firstColumn][_firstNum].pos2D);
			
			tempEl_1.highlight();
			tempEl_2.highlight();
			
			removeChild(findElementById(_firstId));
			removeChild(findElementById(_secondId));
			
			_elements[_firstColumn].splice(_firstNum, 1, tempEl_2);
			_elements[_secondColumn].splice(_secondNum, 1, tempEl_1);
			
			addChild(_elements[_firstColumn][_firstNum]);
			addChild(_elements[_secondColumn][_secondNum]);
			var tempVertexId:VertexId = new VertexId(tempEl_1.vertexId.num_of_row, tempEl_1.vertexId.num_in_row);
			tempEl_1.vertexId.copyValues(tempEl_2.vertexId);
			tempEl_2.vertexId.copyValues(tempVertexId);
			_swapFlag = false;
			
			var soundEventDataPlay:SoundEventData = new SoundEventData(SoundNames.SOUND_DIAMOND_SWAPPED_BACK);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventDataPlay));
		}
		
		private function onTouchEvent(event:TouchEvent):void{
			var touch:Touch = event.getTouch(stage);
			var tempElement:Element = ((event.target as Image).parent as Element);
			if(touch)
			{
				if(tempElement){
					if(touch.phase == TouchPhase.BEGAN)
					{
						onTouchBegan(touch, tempElement);
					}
						
					else if(touch.phase == TouchPhase.ENDED)
					{
						onTouchEnded(touch, tempElement);
					}
						
					else if(touch.phase == TouchPhase.MOVED)
					{
						onTouchMoved(touch, tempElement);
					}
				}
			}
		}
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////
		///
		//		МОДИФИЦИРОВАННАЯ ВЕРСИЯ ПЕРЕКЛЮЧЕНИЯ ЭЛЕМЕНТОВ
		///
		////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		private function onTouchBegan(touch:Touch, el:Element):void{
			if(_advice == el){
				_advice.resetDefaultButtonImage();
				_advice = null;
			}
			
			_touchPhaseEndedUnlocked = true;
			_touchPhaseMovedUnlocked = true;
			
			if(_advice){
				_advice.resetDefaultButtonImage();
				_advice = null;
			}
			
			
			if(_is_switchedEl_1_Choosen == false){
				_switchedEl_1 = el;
				_switchedEl_1.highlight();
				_is_switchedEl_1_Choosen = true;
				_branch = 1;
			}else{
				_switchedEl_2 = el;
				_switchedEl_2.highlight();
				_is_switchedEl_2_Choosen = true;
				_branch = 2;
			}
			var num:int = this.numChildren;
			this.setChildIndex(el, num);
			_touched_el_X0 = el.x;
			_touched_el_Y0 = el.y;
			_touched_el_drag_dist = 0;
			_touched_delta_X = el.x - touch.globalX;
			_touched_delta_Y = el.y - touch.globalY;
			
			var soundEventData:SoundEventData = new SoundEventData(SoundNames.SOUND_DIAMOND_CLICKED);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
		}
		
		private function onTouchMoved(touch:Touch, el:Element):void{
			if(_touchPhaseMovedUnlocked){
				_touched_el_drag_dist = Math.sqrt((touch.globalX + _touched_delta_X - _touched_el_X0) * (touch.globalX + _touched_delta_X - _touched_el_X0)
					+ (touch.globalY + _touched_delta_Y - _touched_el_Y0) * (touch.globalY + _touched_delta_Y - _touched_el_Y0));
				if(_touched_el_drag_dist <= _layout.element_side * 2){
					el.x = touch.globalX + _touched_delta_X;
					el.y = touch.globalY + _touched_delta_Y;
				}else{
					el.x = _touched_el_X0 + _layout.element_side * 2 * (touch.globalX + _touched_delta_X - _touched_el_X0) / _touched_el_drag_dist;
					el.y = _touched_el_Y0 + _layout.element_side * 2 * (touch.globalY + _touched_delta_Y - _touched_el_Y0) / _touched_el_drag_dist;
				}
			}
			
		}
		
		private function onTouchEnded(touch:Touch, el:Element):void{
			if(_touchPhaseEndedUnlocked){
				_touchPhaseMovedUnlocked = false;
				_touchPhaseEndedUnlocked = false;
				switch(_branch){
					case 1:
						if(_touched_el_drag_dist < 3 * _layout.element_side / 2){
							el.x = _touched_el_X0;
							el.y = _touched_el_Y0;
						}else{
							_switchedEl_2 = findClosestElement(el.x, el.y);
							_is_switchedEl_1_Choosen = false;
							_is_switchedEl_2_Choosen = false;
							if(prepareElementsToSwitchForward(Element.SWITCH_DIRECTLY)){
								_switchedEl_2.highlight();
								removeSwitchEventListeners();
								switchGameState(GameStates.STATE_REPLACE_SWITCHED_ELEMENTS_FORWARD);
							}
						}
						break;
					case 2:
						if(_touched_el_drag_dist < 3 * _layout.element_side / 2){
							if(_switchedEl_1 == _switchedEl_2){
								_switchedEl_1.downlight();
								clearifySwapVariables();
							}else{
								var dist:Number = Math.sqrt((_switchedEl_2.pos2D.x - _switchedEl_1.pos2D.x) * (_switchedEl_2.pos2D.x - _switchedEl_1.pos2D.x) +
									(_switchedEl_2.pos2D.y - _switchedEl_1.pos2D.y) * (_switchedEl_2.pos2D.y - _switchedEl_1.pos2D.y));
								
								if(dist < _layout.element_side * 2){
									_is_switchedEl_1_Choosen = false;
									_is_switchedEl_2_Choosen = false;
									if(prepareElementsToSwitchForward(Element.SWITCH_GRADUALLY)){
										removeSwitchEventListeners();
										switchGameState(GameStates.STATE_REPLACE_SWITCHED_ELEMENTS_FORWARD);
									}
								}else{
									_switchedEl_1.downlight();
									_switchedEl_1 = _switchedEl_2;
									_switchedEl_2 = null;
									_is_switchedEl_2_Choosen = false;
								}
							}
							el.x = _touched_el_X0;
							el.y = _touched_el_Y0;
						}else{
							_is_switchedEl_1_Choosen = false;
							_is_switchedEl_2_Choosen = false;
							_switchedEl_1.downlight();
							var tempEl:Element = findClosestElement(el.x, el.y);
							_switchedEl_1 = _switchedEl_2;
							_switchedEl_2 = tempEl;
							_switchedEl_2.highlight();
							if(prepareElementsToSwitchForward(Element.SWITCH_DIRECTLY)){
								removeSwitchEventListeners();
								switchGameState(GameStates.STATE_REPLACE_SWITCHED_ELEMENTS_FORWARD);
							}
						}
						break;
				}
			}
			
		}
		
		
		private function removeDeadElements():void{
			var addToScore:int = 0;
			var multiply:int;
			if(_levelProgress[0].isCompleted){
				multiply = Constants.SCORE_RATE_SUPER;
			}else{
				multiply = 1;
			}
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = _elements[i].length - 1; j >= 0; j--){
					if(_elements[i][j].status == ElementConstants.STATUS_DEAD){
						switch(_elements[i][j].type){
							case _levelProgress[1].spec.type:
								addToScore += Constants.SCORE_MARK_PRIMARY * multiply;
								break;
							case _levelProgress[2].spec.type:
								addToScore += Constants.SCORE_MARK_SECONDARY * multiply;
								break;
							default:
								addToScore += Constants.SCORE_MARK_ORDINARY * multiply;
								break;
						}
						updateGoalProgress(_elements[i][j].type);
						removeChild(_elements[i][j]);
						_recreatedElements.push(_elements[i][j]);
						
						_elements[i].splice(j, 1);
						for(var k:int = j; k < _elements[i].length; k++){
							_elements[i][k].vertexId.copyValues(_vertexes[i][k].vertexId);
							_elements[i][k].status = ElementConstants.STATUS_MOVED;
						}
					}
				}
			}
			_score += addToScore;
			var str:String = _score.toString() + " / "; 
			str += _levelProgress[0].spec.needed.toString();
			dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_SUPER, str)));
			updateSuperGoalProgress(addToScore);
		}
		private function checkAliveStatus():void{
			_isAllAlive = true;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					if(_elements[i][j].status != ElementConstants.STATUS_ALIVE){
						_isAllAlive = false;
						break;
					}
				}
			}
		}
		
		
		private function disposeDeletedGroups():void{
			for(var i:int = _deletedGroups.length - 1; i >= 0; i--){
				for(var j:int = _deletedGroups[i].length; j >= 0; j--){
					_deletedGroups[i].splice(j, 1);
				}
				_deletedGroups.splice(i, 1);
			}
			
			for(i = _vertexLineGroups.length - 1; i >= 0; i--){
				_vertexLineGroups.splice(i, 1);
			}
			
		}
		private function createDeletedTrees():void{
			var checkedGroups:Vector.<Boolean> = new Vector.<Boolean>;
			for(var i:int = 0; i < _deletedGroups.length; i++){
				checkedGroups.push(false);
			}
			for(i = 0; i < _deletedGroups.length; i++){
				var isConnected:Boolean;
				
				if(!checkedGroups[i]){
					var currentGroupLength:int = _deletedGroups[i].length;
					var root:TreeNode = new TreeNode(_deletedGroups[i][0]);
					_deletedTrees.push(root);
					isConnected = checkAndConnect(root, i, checkedGroups, currentGroupLength);
					var currentNode:TreeNode = root;
					for(var j:int = 1; j < _deletedGroups[i].length; j++){
						var isCurrentConnected:Boolean;
						currentNode.createNextNode(_deletedGroups[i][j]);
						currentNode = currentNode.nexts[currentNode.nexts.length - 1];
						isCurrentConnected = checkAndConnect(currentNode, i, checkedGroups, currentGroupLength);
						isConnected = (isConnected || isCurrentConnected);
					}
				}
				if(!isConnected){
					if(_deletedGroups[i].length > 3){
						var num:int = 0;
						var specNode:TreeNode = _deletedTrees[_deletedTrees.length - 1];
						while(num < 2){
							specNode = specNode.nexts[0];
							num++;
						}
						specNode.current.specialize();
						if(_deletedGroups[i].length == 4){
							specNode.current.bonusSpec.bomb = true;
						}else if (_deletedGroups[i].length == 5){
							specNode.current.bonusSpec.activateLine(_vertexLineGroups[i]);
						}
					}
				}
			}
		}
		private function checkAndConnect(node:TreeNode, currentGroupNum:int, checkedGroups:Vector.<Boolean>, currentGroupLength:int):Boolean{
			var res:Boolean = false;
			for(var i:int = currentGroupNum + 1; i < _deletedGroups.length; i++){
				for(var j:int = 0; j < _deletedGroups[i].length; j++){
					if(node.current.vertexId.isEqual(_deletedGroups[i][j].vertexId)){
						res = true;
						checkedGroups[i] = true;
						var currentNode:TreeNode = node;
						if(currentNode.current.special == false){
							currentNode.current.specialize();
						}
						
						var currentBonusSpec:BonusSpec = currentNode.current.bonusSpec;
						currentBonusSpec.activateLine(_vertexLineGroups[i]);
						currentBonusSpec.activateLine(_vertexLineGroups[currentGroupNum]);
						for(var k:int = j-1; k >= 0; k--){
							currentNode.createNextNode(_deletedGroups[i][k]);
							currentNode = currentNode.nexts[currentNode.nexts.length - 1];
						}
						currentNode = node;
						for(k = j+1; k < _deletedGroups[i].length; k++){
							currentNode.createNextNode(_deletedGroups[i][k]);
							currentNode = currentNode.nexts[currentNode.nexts.length - 1];
						}
					}
				}
			}
			return res;
		}
		private function setupFusionParameters():void{
			for(var i:int = 0; i < _deletedTrees.length; i++){
				var specNode:TreeNode = _deletedTrees[i];
				while(specNode){
					if(specNode.current.special){
						if(!specNode.current.bonusSpec.aged){
							markElementAsSpecial(specNode.current);
							var x0:Number = specNode.current.pos2D.x;
							var y0:Number = specNode.current.pos2D.y;
							var ordinary:TreeNode;
							for(var j:int = 0; j < specNode.nexts.length; j++){
								if(specNode.nexts.length > 0) ordinary = specNode.nexts[j];
								else ordinary = null;
								while(ordinary){
									var xc:Number = ordinary.current.pos2D.x;
									var yc:Number = ordinary.current.pos2D.y;
									var vx:Number = (x0 - xc) / Constants.BONUS_CREATION_TIME;
									var vy:Number = (y0 - yc) / Constants.BONUS_CREATION_TIME;
									ordinary.current.velo2D = new Vector2D(vx, vy);
									if(ordinary.nexts.length > 0) ordinary = ordinary.nexts[0];
									else ordinary = null;
									
								}
								ordinary = specNode.previous;
								while(ordinary){
									xc = ordinary.current.pos2D.x;
									yc = ordinary.current.pos2D.y;
									vx = (x0 - xc) / Constants.BONUS_CREATION_TIME;
									vy = (y0 - yc) / Constants.BONUS_CREATION_TIME;
									ordinary.current.velo2D = new Vector2D(vx, vy);
									ordinary = ordinary.previous;
								}
							}
							break;
						}else{
							if(specNode.nexts.length > 0) specNode = specNode.nexts[0];
							else specNode = null;
						}
						
					}else{
						if(specNode.nexts.length > 0) specNode = specNode.nexts[0];
						else specNode = null;
					}
				}
			}
		}
		
		private function disposeDeletedTrees():void{
			for(var i:int = _deletedTrees.length - 1; i >= 0; i--){
				disposeBranch(_deletedTrees[i]);
				_deletedTrees.splice(i, 1);
			}
		}
		
		private function disposeBranch(node:TreeNode):void{
			while(node.nexts.length > 0){
				node = node.nexts[node.nexts.length - 1];
			}
			var previous:TreeNode = node.previous;
			node.dispose();
			node = previous;
			if(node){
				node.nexts.splice(node.nexts.length - 1, 1);
				if(node.nexts.length > 0){
					disposeBranch(node);
				}
			}
		}
		
		private function prepareFireworks():void{
			//trace("preparing fireworks...");
			_fireworks = new Vector.<Sprite>;
			_fireworkMovers = new Vector.<FireworksMover>;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					if(_elements[i][j].status == ElementConstants.STATUS_EXPLODING){
						
						var tempFirework:Sprite = new Sprite();
						tempFirework.x = _elements[i][j].pos2D.x;
						tempFirework.y = _elements[i][j].pos2D.y;
						addChild(tempFirework);
						_fireworks.push(tempFirework);
						var tempMover:FireworksMover = new FireworksMover(tempFirework);
						_fireworkMovers.push(tempMover);
					}
				}
			}
		}
		private function prepareFinalFireworks():void{
			var num:int = 12;
			_fireworks = new Vector.<Sprite>;
			_fireworkMovers = new Vector.<FireworksMover>;
			for(var i:int = 0; i < num; i++){
				var x0:Number = _layout.stage_width / 4 + Math.random() * _layout.stage_width / 2;
				var y0:Number = _layout.stage_height / 4 + Math.random() * _layout.stage_height / 2;
				var tempFirework:Sprite = new Sprite();
				tempFirework.x = x0;
				tempFirework.y = y0;
				addChild(tempFirework);
				var tempMover:FireworksMover = new FireworksMover(tempFirework);
				_fireworkMovers.push(tempMover);
			}
		}
		
		private function runFireworks():void{
			for(var i:int = 0; i < _fireworkMovers.length; i++){
				_fireworkMovers[i].runFirework();
			}
		}
		
		private function removeFireworks():void{
			for(var i:int = _fireworks.length - 1; i >= 0; i--){
				removeChild(_fireworks[i]);
				_fireworks.splice(i, 1);
				_fireworkMovers.splice(i, 1);
			}
			_fireworks = null;
			_fireworkMovers = null;
		}
		private function markElementAsSpecial(el:Element):void{
			var type:int = el.type;
			var sprite:flash.display.Sprite = new flash.display.Sprite();
			sprite.addChild(_elBitmaps[type]);
			var maxWidth:Number = _elBitmaps[type].width;
			var maxHeight:Number = _elBitmaps[type].height;
			
			if(el.bonusSpec.lines[0]){
				if((type == ElementConstants.TYPE_FIRST) || (type == ElementConstants.TYPE_SECOND)){
					maxWidth = (maxWidth > _bonusBitmaps[1].width) ? maxWidth : _bonusBitmaps[1].width;
					maxHeight = (maxHeight > _bonusBitmaps[1].height) ? maxHeight : _bonusBitmaps[1].height;
					sprite.addChild(_bonusBitmaps[1]);
				}else if((type == ElementConstants.TYPE_THIRD) || (type == ElementConstants.TYPE_FOURTH)){
					maxWidth = (maxWidth > _bonusBitmaps[2].width) ? maxWidth : _bonusBitmaps[2].width;
					maxHeight = (maxHeight > _bonusBitmaps[2].height) ? maxHeight : _bonusBitmaps[2].height;
					sprite.addChild(_bonusBitmaps[2]);
				}else if((type == ElementConstants.TYPE_FIFTH) || (type == ElementConstants.TYPE_SIXTH)){
					maxWidth = (maxWidth > _bonusBitmaps[3].width) ? maxWidth : _bonusBitmaps[3].width;
					maxHeight = (maxHeight > _bonusBitmaps[3].height) ? maxHeight : _bonusBitmaps[3].height;
					sprite.addChild(_bonusBitmaps[3]);
				}else if((type == ElementConstants.TYPE_SEVENTH) || (type == ElementConstants.TYPE_ZERO)){
					maxWidth = (maxWidth > _bonusBitmaps[4].width) ? maxWidth : _bonusBitmaps[4].width;
					maxHeight = (maxHeight > _bonusBitmaps[4].height) ? maxHeight : _bonusBitmaps[4].height;
					sprite.addChild(_bonusBitmaps[4]);
				}
				
			}
			if(el.bonusSpec.lines[1]){
				if((type == ElementConstants.TYPE_FIRST) || (type == ElementConstants.TYPE_SECOND)){
					maxWidth = (maxWidth > _bonusBitmaps[5].width) ? maxWidth : _bonusBitmaps[5].width;
					maxHeight = (maxHeight > _bonusBitmaps[5].height) ? maxHeight : _bonusBitmaps[5].height;
					sprite.addChild(_bonusBitmaps[5]);
				}else if((type == ElementConstants.TYPE_THIRD) || (type == ElementConstants.TYPE_FOURTH)){
					maxWidth = (maxWidth > _bonusBitmaps[6].width) ? maxWidth : _bonusBitmaps[6].width;
					maxHeight = (maxHeight > _bonusBitmaps[6].height) ? maxHeight : _bonusBitmaps[6].height;
					sprite.addChild(_bonusBitmaps[6]);
				}else if((type == ElementConstants.TYPE_FIFTH) || (type == ElementConstants.TYPE_SIXTH)){
					maxWidth = (maxWidth > _bonusBitmaps[7].width) ? maxWidth : _bonusBitmaps[7].width;
					maxHeight = (maxHeight > _bonusBitmaps[7].height) ? maxHeight : _bonusBitmaps[7].height;
					sprite.addChild(_bonusBitmaps[7]);
				}else if((type == ElementConstants.TYPE_SEVENTH) || (type == ElementConstants.TYPE_ZERO)){
					maxWidth = (maxWidth > _bonusBitmaps[8].width) ? maxWidth : _bonusBitmaps[8].width;
					maxHeight = (maxHeight > _bonusBitmaps[8].height) ? maxHeight : _bonusBitmaps[8].height;
					sprite.addChild(_bonusBitmaps[8]);
				}
			}
			if(el.bonusSpec.lines[2]){
				if((type == ElementConstants.TYPE_FIRST) || (type == ElementConstants.TYPE_SECOND)){
					maxWidth = (maxWidth > _bonusBitmaps[9].width) ? maxWidth : _bonusBitmaps[9].width;
					maxHeight = (maxHeight > _bonusBitmaps[9].height) ? maxHeight : _bonusBitmaps[9].height;
					sprite.addChild(_bonusBitmaps[9]);
				}else if((type == ElementConstants.TYPE_THIRD) || (type == ElementConstants.TYPE_FOURTH)){
					maxWidth = (maxWidth > _bonusBitmaps[10].width) ? maxWidth : _bonusBitmaps[10].width;
					maxHeight = (maxHeight > _bonusBitmaps[10].height) ? maxHeight : _bonusBitmaps[10].height;
					sprite.addChild(_bonusBitmaps[10]);
				}else if((type == ElementConstants.TYPE_FIFTH) || (type == ElementConstants.TYPE_SIXTH)){
					maxWidth = (maxWidth > _bonusBitmaps[11].width) ? maxWidth : _bonusBitmaps[11].width;
					maxHeight = (maxHeight > _bonusBitmaps[11].height) ? maxHeight : _bonusBitmaps[11].height;
					sprite.addChild(_bonusBitmaps[11]);
				}else if((type == ElementConstants.TYPE_SEVENTH) || (type == ElementConstants.TYPE_ZERO)){
					maxWidth = (maxWidth > _bonusBitmaps[12].width) ? maxWidth : _bonusBitmaps[12].width;
					maxHeight = (maxHeight > _bonusBitmaps[12].height) ? maxHeight : _bonusBitmaps[12].height;
					sprite.addChild(_bonusBitmaps[12]);
				}
			}
			if(el.bonusSpec.bomb){
				maxWidth = (maxWidth > _bonusBitmaps[0].width) ? maxWidth : _bonusBitmaps[0].width;
				maxHeight = (maxHeight > _bonusBitmaps[0].height) ? maxHeight : _bonusBitmaps[0].height;
				sprite.addChild(_bonusBitmaps[0]);
			}
			
			var num:int = sprite.numChildren;
			for(var i:int = 0; i < num; i++){
				var obj:flash.display.DisplayObject = sprite.getChildAt(i);
				obj.x = maxWidth / 2 - obj.width / 2;
				obj.y = maxHeight / 2 - obj.height / 2;
			}
			
			var bitmapData:BitmapData = new BitmapData(sprite.width, sprite.height, true, 0x000000);
			bitmapData.draw(sprite);
			var texture:Texture = Texture.fromBitmapData(bitmapData);
			el.resetButtonImage(texture);
			bitmapData.dispose();
			
			var soundEventDataPlay:SoundEventData = new SoundEventData(SoundNames.SOUND_SPEC_DIAMOND_CREATED);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventDataPlay));
			
		}
		
		private function findOldSpecialsInDestroyed():void{
			for(var i:int = 0; i < _deletedGroups.length; i++){
				for(var j:int = 0; j < _deletedGroups[i].length; j++){
					var tempElement:Element = _deletedGroups[i][j];
					if(tempElement.special){
						if(tempElement.bonusSpec.aged){
							var isAlreadyAdded:Boolean = false;
							for(var k:int = _specElements.length - 1; k >=0; k--){
								if(tempElement == _specElements[k]){
									isAlreadyAdded = true;
									break;
								}
							}
							if(!isAlreadyAdded) _specElements.push(tempElement);
						}
					}
				}
			}
		}
		private function checkDestroyedBySpecial():void{
			for(var i:int = 0; i < _specElements.length; i++){
				if(_specElements[i].bonusSpec.bomb){
					for(var group:int = 0; group < 3; group++){
						var row:int = _specElements[i].vertexId.hexCoords[group][0];
						var num:int = _specElements[i].vertexId.hexCoords[group][1];
						var currentSpecDelay:int = _specElements[i].delay;
						var deltaDelay:int = 2 * _layout.element_side * Math.cos(Math.PI / 6) / _layout.wave_velo;
						var delay:int = currentSpecDelay + deltaDelay;
						if(num > 0) markDestroyedBySpecial(group, row, num - 1, delay);
						if(num < _hexagonRows[group][row].length - 1) markDestroyedBySpecial(group, row, num + 1, delay);
					}
				}
				for(group = 0; group < 3; group++){
					if(_specElements[i].bonusSpec.lines[group]){
						row = _specElements[i].vertexId.hexCoords[group][0];
						num = _specElements[i].vertexId.hexCoords[group][1];
						currentSpecDelay = _specElements[i].delay;
						deltaDelay = 2 * _layout.element_side * Math.cos(Math.PI / 6) / _layout.wave_velo;
						delay = currentSpecDelay + deltaDelay;
						for(var k:int = num + 1; k < _hexagonRows[group][row].length; k++){
							markDestroyedBySpecial(group, row, k, delay);
							delay += deltaDelay;
						}
						
						delay = currentSpecDelay + deltaDelay;
						for(k = num - 1; k >= 0; k--){
							markDestroyedBySpecial(group, row, k, delay);
							delay += deltaDelay;
						}
					}
				}
				
			}
			for(i = _specElements.length - 1; i >= 0; i--){
				_specElements.splice(i, 1);
			}
		}
		private function markDestroyedBySpecial(pgroup:int, prow:int, pnum:int, pdelay:int):void{
			var tempVertexId:VertexId = _hexagonRows[pgroup][prow][pnum];
			var tempElement:Element = findElementById(tempVertexId);
			if((tempElement.status != ElementConstants.STATUS_EXPLODING) && (tempElement.status != ElementConstants.STATUS_ACTIVATED)){
				if(tempElement.special) _specElements.push(tempElement);
				tempElement.status = ElementConstants.STATUS_ACTIVATED;
				tempElement.delay = pdelay;
			}
		}
		private function prepareToCheckingPossibleSwaps():void{
			_checkedColumn = 0;
			_checkedRow = 0;
			_timeToShowAdvice = 0;
			_isAdviceChecked = false;
		}
		
		private function checkPossibleSwaps():void{
			if(!_isAdviceChecked){
				var checkedEl:Element = _elements[_checkedColumn][_checkedRow];
				var checkedType:int = checkedEl.type;
				var neighbours:Vector.<Element> = new Vector.<Element>;
				for(var i:int = 0; i < 3; i++){
					var hexRow:int = checkedEl.vertexId.hexCoords[i][0];
					var hexNum:int = checkedEl.vertexId.hexCoords[i][1];
					if(hexNum > 0){
						var tempId:VertexId = _hexagonRows[i][hexRow][hexNum - 1];
						var tempEl:Element = findElementById(tempId);
						neighbours.push(tempEl);
					}
					if(hexNum < _hexagonRows[i][hexRow].length - 2){
						tempId = _hexagonRows[i][hexRow][hexNum + 1];
						tempEl = findElementById(tempId);
						neighbours.push(tempEl);
					}
				}
				for(i = 0; i < neighbours.length; i++){
					for(var j:int = 0; j < 3; j++){
						hexRow = neighbours[i].vertexId.hexCoords[j][0];
						hexNum = neighbours[i].vertexId.hexCoords[j][1];
						var currentNeighbourType:int = neighbours[i].type;
						var leftType1:int = -1;
						var leftType2:int = -2;
						var rightType1:int = -3;
						var rightType2:int = -4;
						if(hexNum > 0){
							tempId = _hexagonRows[j][hexRow][hexNum - 1];
							if(tempId.isEqual(checkedEl.vertexId)){
								leftType1 = currentNeighbourType;
							}else{
								tempEl = findElementById(tempId);
								leftType1 = tempEl.type;
							}
						}else{
							leftType1 = -1;
						}
						if(hexNum > 1){
							tempId = _hexagonRows[j][hexRow][hexNum - 2];
							tempEl = findElementById(tempId);
							leftType2 = tempEl.type;
						}else{
							leftType2 = -2;
						}
						if(hexNum < _hexagonRows[j][hexRow].length - 1){
							tempId = _hexagonRows[j][hexRow][hexNum + 1];
							if(tempId.isEqual(checkedEl.vertexId)){
								rightType1 = currentNeighbourType;
							}else{
								tempEl = findElementById(tempId);
								rightType1 = tempEl.type;
							}
						}else{
							rightType1 = -3;
						}
						if(hexNum < _hexagonRows[j][hexRow].length - 2){
							tempId = _hexagonRows[j][hexRow][hexNum + 2];
							tempEl = findElementById(tempId);
							rightType2 = tempEl.type;
						}
						else{
							rightType2 = -4;
						}
						if( ((leftType1 == leftType2) && (leftType1 == checkedType)) ||
							((leftType1 == checkedType) && (rightType1 == checkedType)) ||
							((checkedType == rightType1) && (rightType1 == rightType2)) ){
							_elementsToSwap.push(checkedEl);
						}
					}
				}
				_checkedRow++;
				if(_checkedRow == _elements[_checkedColumn].length){
					_checkedRow = 0;
					_checkedColumn++
				}
				if(_checkedColumn == _elements.length){
					_isAdviceChecked = true;
				}
			}
		}
		private function showPossibleSwap():void{
			var c0:int;
			var r0:int;
			var adviceTexture:Texture;
			if(_showAdvice){
				if(_advice){
					
					_showAdvice = false;
				}
				
			}else{
				if(_timeToShowAdvice++ > Constants.DELAY_TO_SHOW_ADVICE){
					var random:int = Math.random() * (_elementsToSwap.length - 1);
					if(_elementsToSwap.length > 0){
						_advice = _elementsToSwap[random];
					}
					_at = 0;
					_timeToShowAdvice = 0;
					_showAdvice = true;
				}
			}
			if(_advice){
				if(!_advice.isAdviceCompleted){
					_advice.animateAdvice();
				}
				
			}
			
			
		}
		private function clearifyPossibleSwaps():void{
			for(var i:int = _elementsToSwap.length - 1; i >= 0; i--){
				_elementsToSwap.splice(i, 1);
			}
			
		}
		private function countSteps():void{
			_steps++;
			if(_levelPass){
				if(_levelPass.limits.type == Constants.LIMIT_STEPS){
					_levelPass.update();
				}
			}
			updateSwapsOnScoreBoard();
			_swapFlag = false;
		}
		
		private function updateSwapsOnScoreBoard():void{
			if(_levelPass){
				if(_levelPass.limits.type == Constants.LIMIT_STEPS){
					var stepsToShow:int = _levelPass.limits.value - _steps;
					dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_STEPS, String(stepsToShow))));
				}else{
					dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_STEPS, String(_steps))));
				}
				dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_PROGRESS_BAR, String(_steps))));
			}else{
				dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, new ScoreBoardUpdateData(Constants.SCORE_BOARD_STEPS, String(_steps))));
			}
		}
		private function updateGoalProgress(elType:int):void{
			for(var i:int = 1; i < _levelProgress.length; i++){
				var csgp:SingleGoalProgress = _levelProgress[i];
				if(elType == csgp.spec.type){
					var wc:Boolean = csgp.isCompleted;
					csgp.update();
					var goal:String;
					switch(i){
						case 1:
							goal = Constants.SCORE_BOARD_PRIMARY;
							break;
						case 2:
							goal = Constants.SCORE_BOARD_SECONDARY;
							break;
					}
					var updateStr:String = csgp.current.toString();
					updateStr += " / ";
					switch(i){
						case 1:
							
							updateStr += _primaryGoalStr;
							break;
						case 2:
							updateStr += _secondaryGoalStr;
							break;
					}
					var updateData:ScoreBoardUpdateData = new ScoreBoardUpdateData(goal, updateStr);
					dispatchEvent(new Event(EventType.SCORE_BOARD_UPDATE, false, updateData));
					if(!wc){
						if(csgp.isCompleted){
							dispatchEvent(new Event(EventType.SINGLE_TASK_COMPLETED, false, goal));
						}
					}
				}
			}
			
		}
		private function updateSuperGoalProgress(change:int):void{
			var csgp:SingleGoalProgress = _levelProgress[0];
			var wc:Boolean = csgp.isCompleted;
			csgp.update(change);
			if(!wc){
				if(csgp.isCompleted){
					dispatchEvent(new Event(EventType.SINGLE_TASK_COMPLETED, false, Constants.SCORE_BOARD_SUPER));
				}
			}
		}
		private function checkForLevelCompleted():void{
			var completed:Boolean = true;
			for(var i:int = 0; i < _levelProgress.length; i++){
				if(!_levelProgress[i].isCompleted){
					completed = false;
					break;
				}
			}
			if(completed){
				
				prepareLevelCompleted();
			}
		}
		private function checkForLevelOver():void{
			if(_levelPass){
				if(_levelPass.isOver){
					if(_levelProgress[1].isCompleted){
						prepareLevelPassed();
					}else{
						prepareLevelFailed();
					}
				}
			}
			
		}
		private function prepareLevelCompleted():void{
			/*
			var soundEventDataPlay:SoundEventData = new SoundEventData(SoundNames.SOUND_LEVEL_COMPLETED);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventDataPlay));
			*/
			setAllAlive();
			switchGameState(GameStates.STATE_LEVEL_COMPLETED);
			
		}
		private function prepareLevelPassed():void{
			/*
			var soundEventDataFail:SoundEventData = new SoundEventData(SoundNames.SOUND_LEVEL_PASSED);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventDataFail));
			*/
			setAllAlive();
			switchGameState(GameStates.STATE_LEVEL_PASSED);
		}
		
		private function prepareLevelFailed():void{
			/*
			var soundEventDataFail:SoundEventData = new SoundEventData(SoundNames.SOUND_LEVEL_FAILED);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventDataFail));
			*/
			setAllAlive();
			switchGameState(GameStates.STATE_LEVEL_FAILED);
		}
		
		private function finalizeLevelCompleted():void{
			dispatchEvent(new Event(EventType.SCORE_BOARD_HIDE));
			switchGameState(GameStates.STATE_DISAPPEAR);
		}
		private function finalizeLevelPassed():void{
			dispatchEvent(new Event(EventType.SCORE_BOARD_HIDE));
			switchGameState(GameStates.STATE_DISAPPEAR);
		}
		
		private function finalizeLevelFailed():void{
			dispatchEvent(new Event(EventType.SCORE_BOARD_HIDE));
			switchGameState(GameStates.STATE_DISAPPEAR);
		}
		private function runFinalExplosion2():void{
			var rr:int;
			var rn:int;
			var rowsToExplode:Vector.<int> = new Vector.<int>;
			for (var i:int = 0; i < _elements.length; i++){
				for(var j:int = _elements[i].length - 1; j >= 0; j--){
					if(_elements[i][j].status == ElementConstants.STATUS_ALIVE){
						rowsToExplode.push(i);
						break;
					}
				}
			}
			if(rowsToExplode.length > 0){
				rr = rowsToExplode[Math.floor(Math.random() * rowsToExplode.length)];
				var numsToExplode:Vector.<int> = new Vector.<int>;
				for(j = 0; j < _elements[rr].length; j++){
					if(_elements[rr][j].status == ElementConstants.STATUS_ALIVE){
						numsToExplode.push(j);
					}
				}
				rn = numsToExplode[Math.floor(Math.random() * numsToExplode.length)];
				_elements[rr][rn].status = ElementConstants.STATUS_EXPLODING;
			}
			
			for(i = _elements.length - 1; i >= 0; i--){
				for(j = _elements[i].length - 1; j >= 0; j--){
					if(_elements[i][j].status == ElementConstants.STATUS_EXPLODING){
						_elements[i][j].explode();
					}
					if(_elements[i][j].status == ElementConstants.STATUS_DEAD){
						removeChild(_elements[i][j]);
						_elements[i][j].clearify();
						_elements[i][j].dispose();
						_elements[i].splice(j, 1);
					}
				}
			}
		}
		
		private function checkFinalExplosion2():Boolean{
			var res:Boolean = true;
			for(var i:int = 0; i < _elements.length; i++){
				if(_elements[i].length > 0){
					res = false;
					break;
				}
			}
			return res;
		}
		
		private function setAllAlive():void{
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					if(_elements[i][j].status != ElementConstants.STATUS_ALIVE){
						_elements[i][j].status = ElementConstants.STATUS_ALIVE;
					}
				}
			}
		}
		
		private function addSwitchEventListeners():void{
			//_touchEventBlocker = false;
			_is_switchedEl_1_Choosen = false;
			_is_switchedEl_2_Choosen = false;
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					_elements[i][j].addEventListener(TouchEvent.TOUCH, onTouchEvent);
					//_touched_el_drag_dist = 2000;
					_touched_el_drag_dist = 0;
				}
			}
		}
		
		private function removeSwitchEventListeners():void{
			for(var i:int = 0; i < _elements.length; i++){
				for(var j:int = 0; j < _elements[i].length; j++){
					_elements[i][j].removeEventListener(TouchEvent.TOUCH, onTouchEvent);
				}
			}
		}
		
		private function chooseNewElementType(pi:int, pj:int):int{
			var type:int;
			var suitable:Boolean = true;
			var types:Vector.<int> = new Vector.<int>;
			for(var i:int = 0; i < 8; i++){
				types.push(i);
			}
			do{
				var n:int = new int(Math.random() * types.length);
				type = types[n];
				var suites:Vector.<Boolean> = new Vector.<Boolean>;
				suites.push(true);
				suites.push(true);
				suites.push(true);
				suitable = true;
				for(var j:int = 0; j < 3; j++){
					var num_of_row:int = _vertexes[pi][pj].vertexId.hexCoords[j][0];
					var num_in_row:int = _vertexes[pi][pj].vertexId.hexCoords[j][1];
					var prev_type:int = -1;
					var prev_prev_type:int = -2;
					var tempEl:Element;
					var tempId:VertexId;
					if(num_in_row > 0){
						tempId = _hexagonRows[j][num_of_row][num_in_row - 1];
						tempEl = findNewElementById(tempId);
						prev_type = tempEl.type;
					}
					if(num_in_row > 1){
						tempId = _hexagonRows[j][num_of_row][num_in_row - 2];
						tempEl = findNewElementById(tempId);
						prev_prev_type = tempEl.type;
					}
					if((type == prev_type) && (type == prev_prev_type)){
						suites[j] = false;
						types.splice(n, 1);
						break;
					}else{
						suites[j] = true;
					}
				}
				suitable = true;
				for(var ii:int = 0; ii < suites.length; ii++){
					if(suites[ii] == false){
						suitable = false;
						break;
					}
				}
			}while(!suitable);
			
			return type;
		}
		private function showDDP(ddp:Sprite):Boolean{
			var shown:Boolean = false;
			_ddpCurPosY += _velocity;
			if(_ddpCurPosY >= _ddpPosOnScreen.y){
				_ddpCurPosY = _ddpPosOnScreen.y;
				shown = true;
				_ddpOnScreen = true;
			}
			ddp.y = _ddpCurPosY;
			return shown;
		}
		
		private function hideDDP(ddp:Sprite):Boolean{
			var hidden:Boolean = false;
			_ddpCurPosY -= _velocity;
			if(_ddpCurPosY <= _ddpPosOutScreen.y){
				_ddpCurPosY = _ddpPosOutScreen.y;
				hidden = true;
				_ddpOnScreen = false;
			}
			ddp.y = _ddpCurPosY;
			return hidden;
		}
		
		private function removeDownPanelListeners():void{
			_btnMenu.removeEventListener(Event.TRIGGERED, onBtnMainMenuClick);
			_btnNext.removeEventListener(Event.TRIGGERED, onBtnNextClick);
		}
		
		private function addDownPanelListeners():void{
			_btnMenu.addEventListener(Event.TRIGGERED, onBtnMainMenuClick);
			_btnNext.addEventListener(Event.TRIGGERED, onBtnNextClick);
		}
		
		private function createMenuDDP():void{
			_panelExitBGImage = new Image(_library.ddp_menu_bg_texture);
			_panelExitBGImage.x = - _panelExitBGImage.width / 2;
			_panelExitBGImage.y = - _panelExitBGImage.height / 2;
			if(_levelProgress[0].isCompleted && _levelProgress[1].isCompleted && _levelProgress[1].isCompleted){
				_panelMenuExitMessageImage = new Image(_library.ddp_menu_level_completed_texture);
			}else if(_levelProgress[1].isCompleted){
				_panelMenuExitMessageImage = new Image(_library.ddp_menu_level_passed_texture);
			}else{
				_panelMenuExitMessageImage = new Image(_library.ddp_menu_level_failed_texture);
			}
			_panelMenuExitMessageImage.x = - _panelMenuExitMessageImage.width / 2;
			_panelMenuExitMessageImage.y = - _panelMenuExitMessageImage.height / 2;
			_btnYes = new Button(_library.btn_ddp_yes_texture);
			_btnYes.addEventListener(Event.TRIGGERED, onBtnMenuYesClick);
			_btnYes.x = _layout.btn_yes_pos_on_x - _btnYes.width / 2;
			_btnYes.y = _layout.btn_yes_pos_on_y - _btnYes.height / 2;
			_btnNo = new Button(_library.btn_ddp_no_texture);
			_btnNo.addEventListener(Event.TRIGGERED, onBtnMenuNoClick);
			_btnNo.x = _layout.btn_no_pos_on_x - _btnNo.width / 2;
			_btnNo.y = _layout.btn_no_pos_on_y - _btnNo.height / 2;
			_panelMenuExitSprite = new Sprite();
			_panelMenuExitSprite.x = _layout.panel_drop_down_pos_out_x;
			_panelMenuExitSprite.y = _layout.panel_drop_down_pos_out_y;
			_panelMenuExitSprite.addChild(_panelExitBGImage);
			_panelMenuExitSprite.addChild(_panelMenuExitMessageImage);
			_panelMenuExitSprite.addChild(_btnYes);
			_panelMenuExitSprite.addChild(_btnNo);
		}
		private function disposeMenuDDP():void{
			_panelMenuExitSprite.removeChild(_btnNo);
			_btnNo.dispose();
			_btnNo = null;
			_panelMenuExitSprite.removeChild(_btnYes);
			_btnYes.dispose();
			_btnNo = null;
			_panelMenuExitSprite.removeChild(_panelExitBGImage);
			_panelExitBGImage.dispose();
			_panelExitBGImage = null;
			_panelMenuExitSprite.removeChild(_panelMenuExitMessageImage);
			_panelMenuExitMessageImage.dispose();
			_panelMenuExitMessageImage = null;
			this.removeChild(_panelMenuExitSprite);
			_panelMenuExitSprite.dispose();
			_panelMenuExitSprite = null;
		}
		
		private function createNextDDPConfirm():void{
			_panelExitBGImage = new Image(_library.ddp_menu_bg_texture);
			_panelExitBGImage.x = - _panelExitBGImage.width / 2;
			_panelExitBGImage.y = - _panelExitBGImage.height / 2;
			
			_panelNextConfirmImage = new Image(_library.ddp_next_confirm_texture);
			_panelNextConfirmImage.x = - _panelNextConfirmImage.width / 2;
			_panelNextConfirmImage.y = - _panelNextConfirmImage.height / 2;
			
			_btnYes = new Button(_library.btn_ddp_yes_texture);
			_btnYes.addEventListener(Event.TRIGGERED, onBtnNextYesClick);
			_btnYes.x = _layout.btn_yes_pos_on_x - _btnYes.width / 2;
			_btnYes.y = _layout.btn_yes_pos_on_y - _btnYes.height / 2;
			
			_btnNo = new Button(_library.btn_ddp_no_texture);
			_btnNo.addEventListener(Event.TRIGGERED, onBtnNextNoClick);
			_btnNo.x = _layout.btn_no_pos_on_x - _btnNo.width / 2;
			_btnNo.y = _layout.btn_no_pos_on_y - _btnNo.height / 2;
			
			_panelNextSprite = new Sprite();
			_panelNextSprite.x = _layout.panel_drop_down_pos_out_x;
			_panelNextSprite.y = _layout.panel_drop_down_pos_out_y;
			_panelNextSprite.addChild(_panelExitBGImage);
			_panelNextSprite.addChild(_panelNextConfirmImage);
			_panelNextSprite.addChild(_btnYes);
			_panelNextSprite.addChild(_btnNo);
			
		}
		
		private function disposeNextDDPConfirm():void{
			_panelNextSprite.removeChild(_btnNo);
			_btnNo.removeEventListener(Event.TRIGGERED, onBtnNextNoClick);
			_btnNo.dispose();
			_btnNo = null;
			
			_panelNextSprite.removeChild(_btnYes);
			_btnYes.removeEventListener(Event.TRIGGERED, onBtnNextYesClick);
			_btnYes.dispose();
			_btnYes = null;
			
			_panelNextSprite.removeChild(_panelNextConfirmImage);
			_panelNextConfirmImage.dispose();
			_panelNextConfirmImage = null;
			
			_panelNextSprite.removeChild(_panelExitBGImage);
			_panelExitBGImage.dispose();
			_panelExitBGImage = null;
			
			removeChild(_panelNextSprite);
			_panelNextSprite.dispose();
			_panelNextSprite = null;
		}
		private function removeAllElements():Boolean{
			var removed:Boolean = true;
			for(var i:int = _elements.length - 1; i >= 0; i--){
				for(var j:int = _elements[i].length - 1; j >= 0; j--){
					_elements[i][j].explode();
					if(_elements[i][j].status == ElementConstants.STATUS_DEAD){
						removeChild(_elements[i][j]);
						_elements[i][j].clearify();
						_elements[i][j].dispose();
						_elements[i].splice(j, 1);
					}else{
						removed = false;
					}
				}
			}
			
			for(i = _newElements.length - 1; i >= 0; i--){
				for(j = _newElements[i].length - 1; j >= 0; j--){
					_newElements[i][j].explode();
					if(_newElements[i][j].status == ElementConstants.STATUS_DEAD){
						_newElements[i].splice(j, 1);
					}else{
						removed = false;
					}
				}
			}
			
			return removed;
		}
		
		private function removeAllFireworks():Boolean{
			var removed:Boolean = true;
			if(_fireworks){
				removeFireworks();
				removed = false;
			}
			return removed;
		}
		
		private function checkGoalCompletion():Boolean{
			var completed:Boolean = false;
			if(!_btnNextAdded){
				if(_levelPass){
					if(!_levelPass.isOver){
						completed = reallyCheckGoalCompletion();
					}
				}else{
					completed = reallyCheckGoalCompletion();
				}
			}
			return completed;
		}
		
		
		private function reallyCheckGoalCompletion():Boolean{
			var completed:Boolean = true;
			for(var i:int = 0; i < _levelProgress.length; i++){
				if(!_levelProgress[i].isCompleted){
					completed = false;
					break;
				}
			}
			if(completed){
				_stateBeforeUserExit = _currentGameState;
				switchGameState(GameStates.STATE_BTN_NEXT_APPEAR);
			}
			return completed;
		}
		
		private function btnNextAppear():Boolean{
			var appeared:Boolean = false;
			_btn_next_cur_pos_y -= _layout.btn_next_velo;
			if(_btn_next_cur_pos_y < _layout.btn_next_pos_on_y - _btnNext.height / 2){
				_btn_next_cur_pos_y = _layout.btn_next_pos_on_y - _btnNext.height / 2;
				appeared = true;
				_btnNextAdded = true;
				
				var soundEventData:SoundEventData = new SoundEventData(SoundNames.SOUND_LEVEL_COMPLETED);
				dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
				
			}
			_btnNext.y = _btn_next_cur_pos_y;
			return appeared;
		}
		
		private function clearifySwapVariables():void{
			_branch = 0;
			_touched_el_drag_dist = 0;
			_is_switchedEl_1_Choosen = false;
			_is_switchedEl_2_Choosen = false;
			_switchedEl_1 = null;
			_switchedEl_2 = null;
			_firstId = null;
			_secondId = null;			
		}
		
	}
}