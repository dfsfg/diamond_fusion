package classes.levels
{	
	public class LevelObstaclesLayout
	{
		private var _levelNum:int;
		private var _obstacleLayout:Vector.<Vector.<int>>;
		
		public function LevelObstaclesLayout(pnum:int, playout:Vector.<Vector.<int>>)
		{
			init(pnum, playout);
		}
		
		private function init(pnum:int, playout:Vector.<Vector.<int>>):void{
			_levelNum = pnum;
			_obstacleLayout = playout;
		}
		
		public function get levelNum():int{
			return _levelNum;
		}
		
		public function get layout():Vector.<Vector.<int>>{
			return _obstacleLayout;
		}
	}
}