package classes.levels.obstacles
{
	import classes.levels.LevelObstaclesLayout;

	public class ObstacleLayoutFactory
	{
		protected var _obstaclesOfLevel:IObstaclesOfLevel;
		
		public function ObstacleLayoutFactory()
		{
		}
		
		public function createLayout():Vector.<LevelObstaclesLayout>{
			var obstacles:Vector.<LevelObstaclesLayout> = new Vector.<LevelObstaclesLayout>;
			var levelObstacles:LevelObstaclesLayout;
			
			
			
			_obstaclesOfLevel = new ObstaclesOfLevel_5();
			levelObstacles = new LevelObstaclesLayout(5, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_6();
			levelObstacles = new LevelObstaclesLayout(6, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_7();
			levelObstacles = new LevelObstaclesLayout(7, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_8();
			levelObstacles = new LevelObstaclesLayout(8, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_9();
			levelObstacles = new LevelObstaclesLayout(9, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_15();
			levelObstacles = new LevelObstaclesLayout(15, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_16();
			levelObstacles = new LevelObstaclesLayout(16, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_17();
			levelObstacles = new LevelObstaclesLayout(17, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_18();
			levelObstacles = new LevelObstaclesLayout(18, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_19();
			levelObstacles = new LevelObstaclesLayout(19, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_25();
			levelObstacles = new LevelObstaclesLayout(25, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_26();
			levelObstacles = new LevelObstaclesLayout(26, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_27();
			levelObstacles = new LevelObstaclesLayout(27, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_28();
			levelObstacles = new LevelObstaclesLayout(28, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			_obstaclesOfLevel = new ObstaclesOfLevel_29();
			levelObstacles = new LevelObstaclesLayout(29, _obstaclesOfLevel.layout);
			obstacles.push(levelObstacles);
			
			
			//trace("obstacles.length = " + obstacles.length);
			
			return obstacles;
		}
	}
}