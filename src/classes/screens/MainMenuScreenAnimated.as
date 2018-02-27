package classes.screens
{
	import assets.layout.abstract.AbstractLayout_MMS;
	
	import cc.wgd.framework_on_starling.BasicScreenExtended;
	import cc.wgd.framework_on_starling.EventType;
	import cc.wgd.framework_on_starling.FrameWorkStates;
	import cc.wgd.framework_on_starling.SimpleButton;
	
	import classes.factories.ScreenObjectId;
	import classes.game.constants.Mode;
	import classes.levels.LevelCounter;
	
	import flash.geom.Point;
	
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	//import starling.filters.BlurFilter;

	public class MainMenuScreenAnimated extends AnimatedScreen
	{
		// идентификатор кнопки Play на основном экране, который используется
		// для вызова вспомогательного экрана, на котором располагается
		// ещё одна кнопка Play с идентификатором FrameWorkStates.SS_NEW_LEVEL.
		// значение 1000 взято для того, чтобы заведомо не совпадать со значением
		// какого-либо другого состояния игры
		public static const DROP_DOWN_SHOW:int = 1000;
		public static const DROP_DOWN_HIDE:int = 1001;
		
		public static const MODE_PANEL_SHOW:int = 1002;
		public static const MODE_STRICT_MODE:int = 1003;
		public static const MODE_ZEN_MODE:int = 1004;
		
		private const STATE_EXECUTE_DROP_DOWN_APPEAR:int = 1;
		private const STATE_EXECUTE_DROP_DOWN_DISAPPEAR:int = 2;
		private const STATE_EXECUTE_DROP_DOWN_EXECUTE:int = 3;
		
		private const STATE_EXECUTE_MODE_APPEAR:int = 4;
		private const STATE_EXECUTE_MODE_DISAPPEAR:int = 5;
		private const STATE_EXECUTE_MODE_EXECUTE:int = 6;
		
		private var _buttonId:int;
		private var _executeState:int;
		
		private var _layout:AbstractLayout_MMS;
		
		private var _gameMode:String;
		private var _ddpBtnWaiting:Boolean;
		private var _levelCounterStrict:LevelCounter;
		private var _levelCounterZen:LevelCounter;
		
		public function MainMenuScreenAnimated()
		{
			super();
		}
		
		public function set layout(playout:AbstractLayout_MMS):void{
			_layout = playout;
		}
		
		public function set levelCounterStrict(plc:LevelCounter):void{
			_levelCounterStrict = plc;
		}
		
		public function set levelCounterZen(plc:LevelCounter):void{
			_levelCounterZen = plc;
		}
		
		public function set gameMode(pgm:String):void{
			_gameMode = pgm;
			switch(_gameMode){
				case Mode.STRICT:
					highlightStrictModeButton();
					break;
				
				case Mode.ZEN:
					highlightZenModeButton();
					break;
			}
			updateLevelButtons();
		}
				
		override protected function prepareScreen():void{
			var moveDone:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) moveDone = false;
			}
			var solveDone:Boolean = true;
			for(i = 0; i < _solvents.length; i++){
				_solvents[i].solve();
				if(_solvents[i].isSolving) solveDone = false;
			}
			if(moveDone && solveDone){
				switchScreenState(STATE_EXECUTE);
			}
		}
		
		override protected function executeScreen():void{
			//trace("_executeState = " + _executeState);
			switch(_executeState){
				case STATE_EXECUTE_DROP_DOWN_APPEAR:
					//trace("dropDownPanel must be showing...");
					showDropDownPanel();
					break;
				case STATE_EXECUTE_DROP_DOWN_DISAPPEAR:
					hideDropDownPanel();
					break;
				case STATE_EXECUTE_MODE_APPEAR:
					showModePanel();
					break;
				case STATE_EXECUTE_MODE_DISAPPEAR:
					hideModePanel();
					break;
				case STATE_EXECUTE_DROP_DOWN_EXECUTE:
					wait();
					break;
				
			}
		}
		
		override protected function finalizeScreen():void{
			var moveDone:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) moveDone = false;
			}
			var solveDone:Boolean = true;
			for(i = 0; i < _solvents.length; i++){
				_solvents[i].solve();
				if(_solvents[i].isSolving) solveDone = false;
			}
			if(moveDone && solveDone){
				// подготовить новое начало
				setupStartMovement();
				switchScreenState(STATE_EXECUTE);
				super.finalizeScreen();
			}
		}
		
		override protected function buttonClickListener(e:Event):void{
			// запоминаем идентификатор нажатой кнпоки...
			_buttonClickedId = (e.target as SimpleButton).id;
			trace("_button with id = " + _buttonClickedId + " clicked...");
			// на экране находятся две кнопки, которые не предназначены для перехода между
			// состояниями игры - это кнопка Play на основном экране, вызывающая панель с кнопками
			// уровней, и кнопка Back, просто поднимающая панель и возвращающая игрока
			// на основной экран главного меню.
			switch(_buttonClickedId){
				// проверяем кнопки на основном экране
				case MODE_PANEL_SHOW:
					this.defineAnimatedMovement(ScreenObjectId.SPR_MODE_PANEL,
						new Point(_layout.spr_mode_panel_pos_out_x, _layout.spr_mode_panel_pos_out_y), 
						new Point(_layout.spr_mode_panel_pos_on_x, _layout.spr_mode_panel_pos_on_y), _layout.spr_mode_panel_velo);
					// опускаем панель выбора режима
					_executeState = STATE_EXECUTE_MODE_APPEAR;
					break;
				case DROP_DOWN_SHOW:
					// подготавливаем параметры движения для опускающейся панели
					if(_gameMode == Mode.UNDEFINED){
						// если режим еще не задан, сначала запускаем экран выбора режима
						this.defineAnimatedMovement(ScreenObjectId.SPR_MODE_PANEL,
							new Point(_layout.spr_mode_panel_pos_out_x, _layout.spr_mode_panel_pos_out_y), 
							new Point(_layout.spr_mode_panel_pos_on_x, _layout.spr_mode_panel_pos_on_y), _layout.spr_mode_panel_velo);
						_ddpBtnWaiting = true;
						// опускаем панель выбора режима
						_executeState = STATE_EXECUTE_MODE_APPEAR;
					}else{
						this.defineAnimatedMovement(ScreenObjectId.SPR_DROPDOWN_PANEL, 
							new Point(_layout.spr_dropdown_panel_pos_out_x, _layout.spr_dropdown_panel_pos_out_y), 
							new Point(_layout.spr_dropdown_panel_pos_on_x, _layout.spr_dropdown_panel_pos_on_y), _layout.spr_dropdown_panel_velo);
						// опускаем dropDownPanel
						_executeState = STATE_EXECUTE_DROP_DOWN_APPEAR;
						trace("_executeState = STATE_EXECUTE_DROP_DOWN_APPEAR;");
					}
					
					break;
				case MODE_STRICT_MODE:
					_gameMode = Mode.STRICT;
					highlightStrictModeButton();
					trace("attempt to dispatch event SET_GAME_MODE: _gameMode = " + _gameMode);
					dispatchEvent(new Event(EventType.SET_GAME_MODE, false, _gameMode));
					this.defineAnimatedMovement(ScreenObjectId.SPR_MODE_PANEL,
						new Point(_layout.spr_mode_panel_pos_on_x, _layout.spr_mode_panel_pos_on_y),
						new Point(_layout.spr_mode_panel_pos_out_x, _layout.spr_mode_panel_pos_out_y), _layout.spr_mode_panel_velo);
					_executeState = STATE_EXECUTE_MODE_DISAPPEAR;
					break;
				case MODE_ZEN_MODE:
					_gameMode = Mode.ZEN;
					highlightZenModeButton();
					trace("attempt to dispatch event SET_GAME_MODE: _gameMode = " + _gameMode);
					dispatchEvent(new Event(EventType.SET_GAME_MODE, false, _gameMode));
					this.defineAnimatedMovement(ScreenObjectId.SPR_MODE_PANEL,
						new Point(_layout.spr_mode_panel_pos_on_x, _layout.spr_mode_panel_pos_on_y),
						new Point(_layout.spr_mode_panel_pos_out_x, _layout.spr_mode_panel_pos_out_y), _layout.spr_mode_panel_velo);
					_executeState = STATE_EXECUTE_MODE_DISAPPEAR;
					break;
				case FrameWorkStates.SS_SET_INSTRUCTIONS:
					trace("переходим к экрану инструкций...");
					setupFinalMovement();
					switchScreenState(BasicScreenExtended.STATE_FINALIZE);
					break;
				case FrameWorkStates.SS_SET_TITLE:
					trace("переходим к титульному экрану...");
					setupFinalMovement();
					switchScreenState(BasicScreenExtended.STATE_FINALIZE);
					break;
				
				// если нажатая кнопка не находится на основном экране,
				// сначала поднимаем dropDownPanel, а затем проверяем 
				// id нажатой кнопки
				default:
					// подготавливаем параметры для поднимания экрана
					
					this.defineAnimatedMovement(ScreenObjectId.SPR_DROPDOWN_PANEL, 
						new Point(_layout.spr_dropdown_panel_pos_on_x, _layout.spr_dropdown_panel_pos_on_y), 
						new Point(_layout.spr_dropdown_panel_pos_out_x, _layout.spr_dropdown_panel_pos_out_y), _layout.spr_dropdown_panel_velo);
					
					trace("сначала поднимем экран, а потом проверим идентификатор кнопки");
					_executeState = STATE_EXECUTE_DROP_DOWN_DISAPPEAR;
					break;
				
			}
		}
		
		private function updateLevelButtons():void{
			trace("setting game mode: game mode = " + _gameMode);
			var counter:LevelCounter;
			switch(_gameMode){
				case Mode.STRICT:
					counter = _levelCounterStrict;
					break;
				case Mode.ZEN:
					counter = _levelCounterZen;
					break;
			}
			trace("counter = " + counter);
			if(counter){
				for(var i:int = 0; i <= counter.maxLevelNum; i++){
					lockLevelButton(i);
				}
				for(i = 0; i <= counter.completedlevel; i++){
					unlockLevelButton(i);
				}
				var possibleCurrentLevel:int = counter.completedlevel + 1;
				if(possibleCurrentLevel <= counter.maxLevelNum){
					unlockLevelButton(possibleCurrentLevel);
				}
			}
		}
		
		public function unlockLevelButton(level:int):void{
			// номер кнопки нужного уровня в массиве кнопок
			var parentSprite:Sprite = getSpriteById(ScreenObjectId.SPR_DROPDOWN_PANEL);
			switch(level){
				case 1:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_1, parentSprite);
					break;
				case 2:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_2, parentSprite);
					break;
				case 3:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_3, parentSprite);
					break;
				case 4:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_4, parentSprite);
					break;
				case 5:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_5, parentSprite);
					break;
				case 6:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_6, parentSprite);
					break;
				case 7:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_7, parentSprite);
					break;
				case 8:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_8, parentSprite);
					break;
				case 9:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_9, parentSprite);
					break;
				case 10:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_10, parentSprite);
					break;
				case 11:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_11, parentSprite);
					break;
				case 12:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_12, parentSprite);
					break;
				case 13:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_13, parentSprite);
					break;
				case 14:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_14, parentSprite);
					break;
				case 15:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_15, parentSprite);
					break;
				case 16:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_16, parentSprite);
					break;
				case 17:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_17, parentSprite);
					break;
				case 18:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_18, parentSprite);
					break;
				case 19:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_19, parentSprite);
					break;
				case 20:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_20, parentSprite);
					break;
				case 21:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_21, parentSprite);
					break;
				case 22:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_22, parentSprite);
					break;
				case 23:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_23, parentSprite);
					break;
				case 24:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_24, parentSprite);
					break;
				case 25:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_25, parentSprite);
					break;
				case 26:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_26, parentSprite);
					break;
				case 27:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_27, parentSprite);
					break;
				case 28:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_28, parentSprite);
					break;
				case 29:
					addAnimatedButtonToDisplayList(ScreenObjectId.BTN_LEVEL_29, parentSprite);
					break;
				default:
					trace("there is no such level");
					break;
			}
		}
		
		private function lockLevelButton(level:int):void{
			switch(level){
				case 1:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_1);
					break;
				case 2:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_2);
					break;
				case 3:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_3);
					break;
				case 4:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_4);
					break;
				case 5:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_5);
					break;
				case 6:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_6);
					break;
				case 7:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_7);
					break;
				case 8:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_8);
					break;
				case 9:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_9);
					break;
				case 10:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_10);
					break;
				case 11:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_11);
					break;
				case 12:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_12);
					break;
				case 13:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_13);
					break;
				case 14:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_14);
					break;
				case 15:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_15);
					break;
				case 16:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_16);
					break;
				case 17:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_17);
					break;
				case 18:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_18);
					break;
				case 19:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_19);
					break;
				case 20:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_20);
					break;
				case 21:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_21);
					break;
				case 22:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_22);
					break;
				case 23:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_23);
					break;
				case 24:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_24);
					break;
				case 25:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_25);
					break;
				case 26:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_26);
					break;
				case 27:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_27);
					break;
				case 28:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_28);
					break;
				case 29:
					removeAnimatedButtonFromDisplayList(ScreenObjectId.BTN_LEVEL_29);
					break;
				default:
					trace("there is no such level");
					break;
			}
		}
		
		private function showDropDownPanel():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			if(done) _executeState = STATE_EXECUTE_DROP_DOWN_EXECUTE;
		}
		
		private function hideDropDownPanel():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			if(done){
				_executeState = STATE_EXECUTE_DROP_DOWN_EXECUTE;
				switch(_buttonClickedId){
					case DROP_DOWN_HIDE:
						break;
					default:
						// подготовить движения кнопок за пределы экрана
						setupFinalMovement();
						/*
						defineAnimatedMovement(ScreenObjectId.BTN_SHOW_BUTTON_PANEL, new Point(275, 450), new Point(-150, 450), 30);
						defineAnimatedMovement(ScreenObjectId.BTN_HELP, new Point(275, 525), new Point(700, 525), 30);
						defineAnimatedMovement(ScreenObjectId.BTN_HOME, new Point(275, 600), new Point(275, 1025), 30);
						defineAnimatedMovement(ScreenObjectId.IMG_DIAMOND_SMALL, new Point(275, 150), new Point(275, -275), 30);
						defineAnimatedSolvence(ScreenObjectId.IMG_MAIN_MENU_NAME, 100, 0, -2);
						*/
						// переключиться в завершающее состояние
						switchScreenState(BasicScreenExtended.STATE_FINALIZE);
						break;
				}
				

			}
		}
		
		private function showModePanel():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			if(done) _executeState = STATE_EXECUTE_MODE_EXECUTE;
		}
		
		private function hideModePanel():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			if(done){
				updateLevelButtons();
				trace("_ddpBtnWaiting = " + _ddpBtnWaiting);
				if(_ddpBtnWaiting){
					_ddpBtnWaiting = false;
					trace("define drop down button panel movement...");
					this.defineAnimatedMovement(ScreenObjectId.SPR_DROPDOWN_PANEL, 
						new Point(_layout.spr_dropdown_panel_pos_out_x, _layout.spr_dropdown_panel_pos_out_y), 
						new Point(_layout.spr_dropdown_panel_pos_on_x, _layout.spr_dropdown_panel_pos_on_y), _layout.spr_dropdown_panel_velo);
					
					_executeState = STATE_EXECUTE_DROP_DOWN_APPEAR;
					//switchScreenState(this.STATE_EXECUTE_DROP_DOWN_APPEAR);
				}else{
					//switchScreenState(BasicScreenExtended.STATE_EXECUTE);
					//switchScreenState(STATE_EXECUTE_DROP_DOWN_EXECUTE);
				}
				//_executeState = STATE_EXECUTE_MODE_EXECUTE
			}
		}
		
		private function wait():void{
			// do nothing
		}
		
		private function setupFinalMovement():void{
			
			defineAnimatedMovement(ScreenObjectId.BTN_SHOW_BUTTON_PANEL, 
				new Point(_layout.btn_show_panel_pos_on_x, _layout.btn_show_panel_pos_on_y), 
				new Point(_layout.btn_show_panel_pos_out_x, _layout.btn_show_panel_pos_out_y), _layout.btn_show_panel_velo);
			
			defineAnimatedMovement(ScreenObjectId.BTN_MODE,
				new Point(_layout.btn_mode_pos_on_x, _layout.btn_mode_pos_on_y),
				new Point(_layout.btn_mode_pos_out_x, _layout.btn_mode_pos_out_y), _layout.btn_mode_velo);
			
			defineAnimatedMovement(ScreenObjectId.BTN_HELP, 
				new Point(_layout.btn_help_pos_on_x, _layout.btn_help_pos_on_y), 
				new Point(_layout.btn_help_pos_out_x, _layout.btn_help_pos_out_y), _layout.btn_help_velo);
			
			defineAnimatedMovement(ScreenObjectId.BTN_HOME, 
				new Point(_layout.btn_home_pos_on_x, _layout.btn_home_pos_on_y), 
				new Point(_layout.btn_home_pos_out_x, _layout.btn_home_pos_out_y), _layout.btn_home_velo);
			
			defineAnimatedMovement(ScreenObjectId.IMG_DIAMOND_SMALL, 
				new Point(_layout.img_diamond_small_pos_on_x, _layout.img_diamond_small_pos_on_y), 
				new Point(_layout.img_diamond_small_pos_out_x, _layout.img_diamond_small_pos_out_y), _layout.img_diamond_small_velo);
			
			defineAnimatedSolvence(ScreenObjectId.IMG_MAIN_MENU_NAME, _layout.img_main_menu_name_transparency_end, 
				_layout.img_main_menu_name_transparency_start, -(_layout.img_main_menu_name_transparency_step));
		}
		
		private function setupStartMovement():void{
			
			defineAnimatedMovement(ScreenObjectId.BTN_SHOW_BUTTON_PANEL, 
				new Point(_layout.btn_show_panel_pos_out_x, _layout.btn_show_panel_pos_out_y), 
				new Point(_layout.btn_show_panel_pos_on_x, _layout.btn_show_panel_pos_on_y), _layout.btn_show_panel_velo);
			
			defineAnimatedMovement(ScreenObjectId.BTN_MODE,
				new Point(_layout.btn_mode_pos_out_x, _layout.btn_mode_pos_out_y),
				new Point(_layout.btn_mode_pos_on_x, _layout.btn_mode_pos_on_y), _layout.btn_mode_velo);
			
			defineAnimatedMovement(ScreenObjectId.BTN_HELP, 
				new Point(_layout.btn_help_pos_out_x, _layout.btn_help_pos_out_y), 
				new Point(_layout.btn_help_pos_on_x, _layout.btn_help_pos_on_y), _layout.btn_help_velo);
			
			defineAnimatedMovement(ScreenObjectId.BTN_HOME, 
				new Point(_layout.btn_home_pos_out_x, _layout.btn_home_pos_out_y), 
				new Point(_layout.btn_home_pos_on_x, _layout.btn_home_pos_on_y), _layout.btn_home_velo);
			
			defineAnimatedMovement(ScreenObjectId.IMG_DIAMOND_SMALL, 
				new Point(_layout.img_diamond_small_pos_out_x, _layout.img_diamond_small_pos_out_y), 
				new Point(_layout.img_diamond_small_pos_on_x, _layout.img_diamond_small_pos_on_y), _layout.img_diamond_small_velo);
			
			defineAnimatedSolvence(ScreenObjectId.IMG_MAIN_MENU_NAME, _layout.img_main_menu_name_transparency_start, 
				_layout.img_main_menu_name_transparency_end, _layout.img_main_menu_name_transparency_step);
		}
		
		private function highlightStrictModeButton():void{
			var strictButton:SimpleButton = this.getButtonById(ScreenObjectId.BTN_MODE_STRICT);
			/*
			var zenButton:SimpleButton = this.getButtonById(ScreenObjectId.BTN_MODE_ZEN);
			
			strictButton.filter = BlurFilter.createGlow();
			zenButton.filter = null;
			*/
			var hl:Image = this.getImageById(ScreenObjectId.BTN_HL);
			hl.x = _layout.btn_strict_mode_pos_on_x - hl.width / 2;
			hl.y = _layout.btn_strict_mode_pos_on_y - hl.height / 2;
			
			if(!hl.parent){
				strictButton.parent.addChildAt(hl, 0);
			}
		}
		
		private function highlightZenModeButton():void{
			//var strictButton:SimpleButton = this.getButtonById(ScreenObjectId.BTN_MODE_STRICT);
			var zenButton:SimpleButton = this.getButtonById(ScreenObjectId.BTN_MODE_ZEN);
			/*
			strictButton.filter = null;
			zenButton.filter = BlurFilter.createGlow();
			*/
			var hl:Image = this.getImageById(ScreenObjectId.BTN_HL);
			hl.x = _layout.btn_zen_mode_pos_on_x - hl.width / 2;
			hl.y = _layout.btn_zen_mode_pos_on_y - hl.height / 2;
			
			if(!hl.parent){
				zenButton.parent.addChildAt(hl, 0);
			}
		}
	}
}