package classes.board
{
	import assets.libraries.l_550x750.Library;
	
	import cc.wgd.framework_on_starling.EventType;
	import cc.wgd.framework_on_starling.GraphicsElement;
	import cc.wgd.framework_on_starling.ScoreBoard;
	import cc.wgd.framework_on_starling.SoundEventData;
	
	import assets.layout.abstract.AbstractLayout_SB;
	import classes.game.constants.Constants;
	import classes.game.constants.SoundNames;
	import classes.SoundManagerModHF;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class ControlPanel extends ScoreBoard
	{
		public static const STATE_SCORE_BOARD_HIDE:int = 0;
		public static const STATE_SCORE_BOARD_SHOW:int = 1;
		public static const STATE_SCORE_BOARD_WAIT:int = 2;
		public static const STATE_SCORE_BOARD_UPDATE:int = 3;
		
		private const SOUND_VOLUME:Number = 1;
		
		private var _button_left_position:Number;
		private var _button_right_position:Number;
		
		private var _posOnScreen:Point;
		private var _posOutScreen:Point;
		
		private var _velocity:Number;
		private var _posCurY:Number;
		
		private var systemFunction:Function;
		
		private var _state:int;
		
		private var _currentScore:int;
		private var _reachedScore:int;
		private var _scoreStep:int;
		private var _image:Image;
		private var _elTextures:Vector.<Texture>;
		private var _scoreTexture:Texture;
		private var _taskCompletedTexture:Texture;
		private var _taskFailedTexture:Texture;
		
		private var _btnSound:Button;
		private var _btnMusicOn:Button;
		private var _btnMusicOff:Button;
		private var _deltaX:Number;
		private var _deltaY:Number;
		
		private var _isMusicPlayed:Boolean;
		private var _soundVolume:Number;
		private var _buttonSoundVolume:Number;
		private var _progressBar:ProgressBarLine;
		
		private var _layout:AbstractLayout_SB;
		
		public function ControlPanel(playout:AbstractLayout_SB)
		{
			super();
			init(playout);
		}
		
		private function init(playout:AbstractLayout_SB):void{
			_layout = playout;
			_velocity = _layout.score_board_velo;
			
			_currentScore = 0;
			_scoreStep = 1;
						
			systemFunction = systemWait;
		}
		public function createBgImage(pt:Texture):void{
			_image = new Image(pt);
			addChild(_image);
		}
		
		/** создает кнопку включения звука */
		public function createBtnMusicOn(pt:Texture, px:Number, py:Number):void{
			_btnMusicOn = new Button(pt);
			
			_btnMusicOn.x = px;
			_btnMusicOn.y = py;
			
			_isMusicPlayed = true;
			_btnMusicOn.addEventListener(Event.TRIGGERED, onBtnMusicOnTriggered);
			addChild(_btnMusicOn);
		}
		
		/** создает кнопку выключения звука */
		public function createBtnMusicOff(pt:Texture, px:Number, py:Number):void{
			_btnMusicOff = new Button(pt);
			_btnMusicOff.x = px;
			_btnMusicOff.y = py;
			
			//_btnMusicOff.addEventListener(Event.TRIGGERED, onBtnMusicOffTriggered);
			
			//addChild(_btnMusicOff);
		}
		
		/** создает кнопку громкости звука */
		public function createBtnSound(pt:Texture, px:Number, py:Number, pLeftX:Number, pRightX:Number):void{
			_btnSound = new Button(pt);
			
			_button_left_position = pLeftX;
			_button_right_position = pRightX;
			
			_btnSound.x = px;
			_btnSound.y = py;
			
			_btnSound.addEventListener(TouchEvent.TOUCH, onTouchEvent);
			
			addChild(_btnSound);
		}
		
		/** Создание текстур для графических элементов */
		public function createTextures(pElTextures:Vector.<Texture>, pTaskCompletedTexture:Texture, pTaskFailedTexture:Texture, pScoreTexture:Texture):void{
			_elTextures = pElTextures;
			_taskCompletedTexture = pTaskCompletedTexture;
			_taskFailedTexture = pTaskFailedTexture;
			_scoreTexture = pScoreTexture;
		}
		
		public function createProgressBar(pbt:Texture, pct:Texture, pbx:Number, pby:Number):void{
			_progressBar = new ProgressBarLine(pbt, pct);
			_progressBar.x = pbx;
			_progressBar.y = pby;
			addChild(_progressBar);
		}
		
		override public function runScoreBoard():void{
			systemFunction();
		}
		
		//---------------------------------------------------------------------------------
		//	УПРАВЛЕНИЕ ОБНОВЛЕНИЕМ ИНФОРМАЦИИ, ОТОБРАЖАЕМОЙ НА ТАБЛО
		//---------------------------------------------------------------------------------
		
		override public function update(key:String, value:String):void{
			//trace("key = " + key);
			for(var i:int = 0; i < _scoreElements.length; i++){
				if(_scoreElements[i].label == key){
					switch(key){
						case Constants.SCORE_BOARD_SCORE:
							// если обновить счет - запускаем обновление
							_reachedScore = int(value);
							switchState(STATE_SCORE_BOARD_UPDATE);
							break;
						default:
							// в остальных случаях - обновляем сразу
							_scoreElements[i].setContentText(value);
							break;
					}
				}
			}
			
			
			for(i = 0; i <_graphicElements.length; i++){
				if(_graphicElements[i].label == key){
					_graphicElements[i].setContentText(value);
					break;
				}
			}
			
			if(key == Constants.SCORE_BOARD_PROGRESS_BAR){
				updateProgressBar(value);
			}
		}
		
		// помечает выполнение единичного задания
		public function completeTask(key:String):void{
			for(var i:int = 0; i < _graphicElements.length; i++){
				if(_graphicElements[i].label == key){
					_graphicElements[i].completeTask();
					break;
				}
			}
		}
		
		// помечает невыполнение единичного задания
		public function failTask(key:String):void{
			for(var i:int = 0; i < _graphicElements.length; i++){
				if(_graphicElements[i].label == key){
					_graphicElements[i].failTask();
					break;
				}
			}
		}
		
		public function defineProgressBarMaxValue(mv:int):void{
			_progressBar.maxValue = mv;
		}
		
		private function updateProgressBar(pv:String):void{
			var v:int = new int(pv);
			_progressBar.update(v);
		}
		
		/** 
		 * <h1>Установка бегунка полосы прогресса в начальное положение</h1>
		 * <p>Используется перед началом уровня в режиме Zen</p>
		 *  */
		public function resetProgressBar():void{
			defineProgressBarMaxValue(1);
			_progressBar.update(0);
			
		}
		
		//-----------------------------------------------------------------------------------------
		//	МЕТОДЫ, УПРАВЛЯЮЩИЕ ДВИЖЕНИЕМ ТАБЛО В НАЧАЛЕ И КОНЦЕ УРОВНЯ
		//-----------------------------------------------------------------------------------------
		
		/**
		 * Задаем координаты точек, между которыми перемещается табло,
		 * появляясь на экране, или удаляясь с экрана
		 * */
		public function setEndPoints(pxe:Number, pye:Number, px0:Number = 0, py0:Number = 0):void{
			_posOutScreen = new Point(this.x, this.y);
			_posOnScreen = new Point(px0, py0);
			_posOutScreen = new Point(pxe, pye);
			_posCurY = pye;
			this.x = pxe;
			this.y = pye;
		}
		
		/**
		 * метод, вызываемый из внешнего класса и инициирующий движение вверх
		 * */
		public function hide():void{
			if(_isMusicPlayed){
				_soundVolume = SOUND_VOLUME * (_btnSound.x - _button_left_position) / (_button_right_position - _button_left_position);
				var soundData:SoundEventData = new SoundEventData(SoundNames.MUSIC_3_GAME_PLAY, true, 1000, 0, _soundVolume * SoundManagerModHF.GAME_PLAY_VOLUME_RATE);
				dispatchEvent(new Event(EventType.STOP_SOUND, false, soundData));
			}
			switchState(STATE_SCORE_BOARD_HIDE);
		}
		
		/**
		 * метод, вызываемый из внешнего класса и инициирующий движение вниз
		 * */
		public function show():void{
			if(_isMusicPlayed){
				_soundVolume = SOUND_VOLUME * (_btnSound.x - _button_left_position) / (_button_right_position - _button_left_position);
				var soundData:SoundEventData = new SoundEventData(SoundNames.MUSIC_3_GAME_PLAY, true, 1000, 0, _soundVolume * SoundManagerModHF.GAME_PLAY_VOLUME_RATE);
				dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundData));
			}
			switchState(STATE_SCORE_BOARD_SHOW);
		}
		
		private function switchState(stateVal:int):void{
			switch(stateVal){
				case STATE_SCORE_BOARD_HIDE:
					systemFunction = systemMoveUp;
					break;
				case STATE_SCORE_BOARD_SHOW:
					systemFunction = systemMoveDown;
					break;
				case STATE_SCORE_BOARD_WAIT:
					systemFunction = systemWait;
					break;
				case STATE_SCORE_BOARD_UPDATE:
					systemFunction = systemUpdate;
					break;
			}
		}
		
		/**
		 * метод, осуществляющий движение вверх
		 * */
		private function systemMoveUp():void{
			_posCurY -= _velocity;
			if(_posCurY < _posOutScreen.y){
				_posCurY = _posOutScreen.y;
				switchState(STATE_SCORE_BOARD_WAIT);
			}
			this.y = _posCurY;
		}
		
		/**
		 * метод, осуществляющий движение вверх
		 * */
		private function systemMoveDown():void{
			_posCurY += _velocity;
			if(_posCurY > _posOnScreen.y){
				_posCurY = _posOnScreen.y;
				switchState(STATE_SCORE_BOARD_WAIT);
			}
			this.y = _posCurY;
		}
		
		/**
		 * метод, осуществляющий состояние ожидания
		 * */
		private function systemWait():void{
			// do nothing
		}

		
		/**
		 * Метод обновляет счет от текущего до необходимого не сразу, а постепенно,
		 * на каждом вхождении кадра увеличивая счет на некоторую величину до тех пор,
		 * пока он не достигнет заданного значения.
		 * */
		private function systemUpdate():void{
			if(_currentScore <= _reachedScore){
				for(var i:int = 0; i < _scoreElements.length; i++){
					/*
					// ищем элемент score, чтобы обновить его значение
					if(_scoreElements[i].label == Constants.SCORE_BOARD_SCORE){
						_scoreElements[i].setContentText(_currentScore.toString());
						break;
					}
					*/
					// ищем элемент super_goal, чтобы обновить его значение
					if(_graphicElements[i].label == Constants.SCORE_BOARD_SUPER){
						_graphicElements[i].setContentText(_currentScore.toString());
						break;
					}
				}
				_currentScore += _scoreStep;
			}else{
				switchState(STATE_SCORE_BOARD_WAIT);
			}
		}
		
		/**
		 * В начале каждого уровня обнуляем текущее значение счета
		 * */
		override public function newLevel():void{
			_currentScore = 0;
		}
		
		//-------------------------------------------------------------------------------------
		//	УПРАВЛЕНИЕ ВСПОМОГАТЕЛЬНОЙ ПАНЕЛЬЮ ЗАДАНИЙ ТЕКУЩЕГО УРОВНЯ
		//-------------------------------------------------------------------------------------
		
		/** уничтожает графические элементы, отображающие задания текущего уровня,
		 * в конце каждого уровня перед подготовкой к следующему */
		public function removeGraphicElements():void{
			for(var i:int = _graphicElements.length - 1; i >= 0; i--){
				removeChild(_graphicElements[i]);
				_graphicElements[i].clearify();
				_graphicElements.splice(i, 1);
			}
		}
		
		//--------------------------------------------------------------------------------------
		//	МЕТОДЫ СОЗДАНИЯ ГРАФИЧЕСКИХ ЭЛЕМЕНТОВ ДЛЯ ТЕКУЩЕГО УРОВНЯ ИГРЫ
		//--------------------------------------------------------------------------------------
		
		/**  */
		public function createGraphicElementSuperGoal():void{
			var graphicElementSuper:GraphicsElement = new GraphicsElement(_layout.el_goal_super_pos_x, _layout.el_goal_super_pos_y, 
				Constants.SCORE_BOARD_SUPER, _scoreTexture, _taskCompletedTexture, _taskFailedTexture, 
				_layout.el_goal_super_buffer_width, "111", _layout.el_goal_super_content_width, _layout.el_goal_super_content_height, "Verdana", 14, 0x000000);
			
			this.addGraphicElement(graphicElementSuper);
		}
		
		public function createGraphicElementPrimaryGoal(primaryGoalType:int):void{
			var graphicElementPrimary:GraphicsElement = new GraphicsElement(_layout.el_goal_primary_pos_x, _layout.el_goal_primary_pos_y, 
				Constants.SCORE_BOARD_PRIMARY, _elTextures[primaryGoalType], _taskCompletedTexture, _taskFailedTexture, 
				_layout.el_goal_primary_buffer_width, "000", _layout.el_goal_primary_content_width, _layout.el_goal_primary_content_height, "Verdana", 14, 0x000000);
			this.addGraphicElement(graphicElementPrimary);
		}
		
		public function createGraphicElementSecondaryGoal(secondaryGoalType:int):void{
			var graphicElementSecondary:GraphicsElement = new GraphicsElement(_layout.el_goal_secondary_pos_x, _layout.el_goal_secondary_pos_y, 
				Constants.SCORE_BOARD_SECONDARY, _elTextures[secondaryGoalType], _taskCompletedTexture, _taskFailedTexture, 
				_layout.el_goal_secondary_buffer_width, "000", _layout.el_goal_secondary_content_width, _layout.el_goal_secondary_content_height, "Verdana", 14, 0x000000);
			this.addGraphicElement(graphicElementSecondary);
		}
		
		//--------------------------------------------------------------------------------------
		//	МЕТОДЫ УПРАВЛЕНИЯ ГРОМКОСТЬЮ ЗВУКА
		//--------------------------------------------------------------------------------------
		
		private function onTouchEvent(event:TouchEvent):void{
			//trace("touched...");
			var touch:Touch = event.getTouch(stage);
			
			if(touch)
			{
				if(touch.phase == TouchPhase.BEGAN)
				{
					_deltaX = touch.globalX - _btnSound.x;
				}
					
				else if(touch.phase == TouchPhase.ENDED)
				{
					
				}
					
				else if(touch.phase == TouchPhase.MOVED)
				{
					trace("moved...");
					if(touch.globalX - _deltaX < _button_left_position) _btnSound.x = _button_left_position;
					else if(touch.globalX - _deltaX > _button_right_position) _btnSound.x = _button_right_position;
					else _btnSound.x = touch.globalX - _deltaX;
					_soundVolume = SOUND_VOLUME * (_btnSound.x - _button_left_position) / (_button_right_position - _button_left_position);
					dispatchEvent(new Event(EventType.ADJUST_VOLUME, false, _soundVolume.toString()));
				}
			}
			
		}
		
		private function onBtnMusicOnTriggered(event:Event):void{
			_soundVolume = SOUND_VOLUME * (_btnSound.x - _button_left_position) / (_button_right_position - _button_left_position);
			var soundData:SoundEventData = new SoundEventData(SoundNames.MUSIC_3_GAME_PLAY, true, 20, 0, _soundVolume * SoundManagerModHF.GAME_PLAY_VOLUME_RATE);
			dispatchEvent(new Event(EventType.STOP_SOUND, false, soundData));
			_btnMusicOn.removeEventListener(Event.TRIGGERED, onBtnMusicOnTriggered);
			removeChild(_btnMusicOn);
			_btnMusicOff.addEventListener(Event.TRIGGERED, onBtnMusicOffTriggered);
			addChild(_btnMusicOff);
			_isMusicPlayed = false;
		}
		
		private function onBtnMusicOffTriggered(event:Event):void{
			_soundVolume = SOUND_VOLUME * (_btnSound.x - _button_left_position) / (_button_right_position - _button_left_position);
			var soundData:SoundEventData = new SoundEventData(SoundNames.MUSIC_3_GAME_PLAY, true, 20, 0, _soundVolume * SoundManagerModHF.GAME_PLAY_VOLUME_RATE);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundData));
			_btnMusicOff.removeEventListener(Event.TRIGGERED, onBtnMusicOffTriggered);
			removeChild(_btnMusicOff);
			_btnMusicOn.addEventListener(Event.TRIGGERED, onBtnMusicOnTriggered);
			addChild(_btnMusicOn);
			_isMusicPlayed = true;
		}
			
	}
}