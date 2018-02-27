package cc.wgd.framework_on_starling
{
	import starling.display.Sprite;
	
	public class Game extends Sprite
	{
		//Create constants for simple custom events
		public static const GAME_OVER:String = "game over";
		public static const NEW_LEVEL:String = "new level";
		// added by me
		public static const LEVEL_FAILED:String = "level failed";
		public static const LEVEL_COMPLETED:String = "level completed";
		
		public function Game()
		{
			super();
		}

		public function setRendering(profiledRate:int, framerate:int):void {
			
		}
		
		public function newGame():void {
			
		}
		
		
		public function newLevel():void {
			
		}
		
		
		public function runGame():void {
			
		}
		
		public function levelCompleted():void{
			
		}
		
		public function levelFailed():void{
			
		}
		
		//***************************************************************************
		public function onSetTitleScreen():void{
			
		}
		
		public function onSetMainMenuScreen():void{
			
		}
		
		public function onSetLevelInScreen():void{
			
		}
		
		public function onSetInstructionsScreen():void{
			
		}
		
		public function onSetLevelFailed():void{
			
		}
		
		public function onSetLevelPassed():void{
			
		}
		
		//****************************************************************************
		public function runGameTimeBased(paused:Boolean=false,timeDifference:Number=1):void {
			
		}
		
		public function startNewLevel():void{
			
		}
		
		public function tryAgainLevel():void{
			
		}
		
		public function definedLevel(numOfLevel:int):void{
			
		}
		
		public function getLevelNum():int{
			return 0;
		}
		
		public function getNumOfLevelsCompleted():int{
			return 0;
		}
		
		public function getLevelTime(levelNum:int):int{
			return 0;	
		}
		
		public function setLevelNum(levelNum:int):void{
			
		}
		
		public function setNumOfLevelCompleted(levelNum:int):void{
			
		}
		
		public function getTotalScore():int{
			return 0;
		}
	}
}