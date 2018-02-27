package classes.levels.saved {
	
	import classes.game.constants.Constants;
	import classes.levels.LevelCounter;
	
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	
	public class GameData {
		
		private const TAG_GAMEDATA:String = "gamedata";
		private const TAG_LEVEL:String = "level";
		private const TAG_LEVEL_NUM:String = "levelnum";
		private const TAG_BEST:String = "best";
		private const TAG_SUPER:String = "super";
		private const TAG_PRIMARY:String = "primary";
		private const TAG_SECONDARY:String = "secondary";
		
		private var _sharedObject:SharedObject;
		
		private var _savedContent:String;
		private var _currentContent:String;
		
		// пользовательские данные, в которых сохраняется текущий прогресс игры
		private var _userData:XML;

		public function GameData(pfolder:String, pfile:String) {
			// constructor code
			init(pfolder, pfile);
		}
		
		private function init(pfolder:String, pfile:String):void{
			_sharedObject = SharedObject.getLocal(pfile);
			_currentContent = _sharedObject.data._savedContent;
			
			trace("_content = " + _currentContent);
			
			if(_currentContent){
				trace("previous state file found...");
				_userData = new XML(_currentContent);
				
			}else{
				trace("there is no previous state file... It must be created...");
				createUserData();
			}
		}
		
		public function get levelCounter():LevelCounter{
			var maxLevel:int;
			var currentLevel:int = 0;
			var completedLevel:int = -1;
			
			maxLevel = _userData.children().length() - 1;
			trace("there must be " + maxLevel + " levels in the game");
			for(var i:int = 0; i <= maxLevel; i++){
				var level:XML = _userData.*[i];
				if(level.child(this.TAG_BEST) == 0){
					trace("проверка наилучшего прохождения уровня проведена успешно...");
					
					trace("currentLevel = " + currentLevel);
					trace("completed level num = " + completedLevel);
					break;
				}else{
					currentLevel++;
					completedLevel++;
					trace("уровень " + i + " считается пройденным...");
				}
			}
			// если вся игра пройдена, устанавливаем текущий уровень равным нулю
			if(currentLevel > maxLevel) currentLevel = 0;
			
			var counter:LevelCounter = new LevelCounter(maxLevel, currentLevel, completedLevel);
			return counter;
		}
		
		public function updateData(plevnum:int, psuper:int, pprim:int, psec:int):void{
			// переменная для хранения лучшего счета
			var pbest:int;
			
			for(var i:int = 0; i < _userData.children().length(); i++){
				var level:XML = _userData.*[i];
				//trace("checking level...");
				//trace("level = " + level);
				if(level.child(this.TAG_LEVEL_NUM) == plevnum){
					// проверяем предыдущий лучший результат
					pbest = level.child(this.TAG_BEST);
					if(pbest < psuper) pbest = psuper;
					// записываем новые данные
					level.replace(this.TAG_BEST, <{this.TAG_BEST}>{pbest}</{this.TAG_BEST}>);
					level.replace(this.TAG_SUPER, <{this.TAG_SUPER}>{psuper}</{this.TAG_SUPER}>);
					level.replace(this.TAG_PRIMARY, <{this.TAG_PRIMARY}>{pprim}</{this.TAG_PRIMARY}>);
					level.replace(this.TAG_SECONDARY, <{this.TAG_SECONDARY}>{psec}</{this.TAG_SECONDARY}>);
					
					//trace("found.............................................................");
					break;
				}
			}
			//delete _sharedObject.data;
			_currentContent = _userData.toString();
			_sharedObject.data._savedContent = _currentContent;
			_sharedObject.flush();
			
			var flushStatus:String = null;
			try {
				flushStatus = _sharedObject.flush(10000);
			} catch (error:Error) {
				trace("Error...Could not write SharedObject to disk\n");
			}
			if (flushStatus != null) {
				switch (flushStatus) {
					case SharedObjectFlushStatus.PENDING:
						trace("Requesting permission to save object...\n");
						break;
					case SharedObjectFlushStatus.FLUSHED:
						trace("Value flushed to disk.\n");
						break;
				}
			}
		}
		
		private function createUserData():void{
			_userData = <{this.TAG_GAMEDATA} />;
			for(var i:int = 0; i < 30; i++){
				var best:int = 0;
				//if(i < 20) best = 2;
				_userData.appendChild(<{this.TAG_LEVEL}>
										<{this.TAG_LEVEL_NUM}>{i}</{this.TAG_LEVEL_NUM}>
										<{this.TAG_BEST}>{best}</{this.TAG_BEST}>
										<{this.TAG_SUPER}>0</{this.TAG_SUPER}>
										<{this.TAG_PRIMARY}>0</{this.TAG_PRIMARY}>
										<{this.TAG_SECONDARY}>0</{this.TAG_SECONDARY}>
									</{this.TAG_LEVEL}>);
			}
		}


	}
	
}
