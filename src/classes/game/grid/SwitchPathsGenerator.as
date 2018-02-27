package classes.game.grid
{
	import flash.geom.Point;

	public class SwitchPathsGenerator
	{
		private var _paths:Vector.<Vector.<Point>>;
		
		private var _side:Number;
		private var _gap:Number;
		private var _dist:Number;
		private var _rad:Number;
		private var _startAngles:Vector.<Number>;
		private var _currentAngle:Number;
		private var _deltaAngle:Number;
		private var _startPoint:Point;
		private var _endPoints:Vector.<Point>;
		private var _centerPoints:Vector.<Point>;
		
		public function SwitchPathsGenerator(side:Number, gap:Number)
		{
			init(side, gap);
		}
		
		private function init(side:Number, gap:Number):void{
			calcEndPoints(side, gap);
			calcPaths();
		}
		
		private function calcEndPoints(side:Number, gap:Number):void{
			_side = side;
			_gap = gap;
			_endPoints = new Vector.<Point>;
			_centerPoints = new Vector.<Point>;
			_startAngles = new Vector.<Number>;
			_dist = side * Math.sqrt(3) + gap;
			_rad = _dist / 2;
			var x:Number = Math.sqrt(_dist * _dist - _rad * _rad);
			
			// правая верхняя точка
			var tempPoint1:Point = new Point(x, -_rad);
			_endPoints.push(tempPoint1);
			
			// правая нижняя точка
			var tempPoint2:Point = new Point(x, _rad);
			_endPoints.push(tempPoint2);
			
			// нижняя точка
			var tempPoint3:Point = new Point(0, _dist);
			_endPoints.push(tempPoint3);
			
			// левая нижняя точка
			var tempPoint4:Point = new Point(-x, _rad);
			_endPoints.push(tempPoint4);
			
			// левая верхняя точка
			var tempPoint5:Point = new Point(-x, -_rad);
			_endPoints.push(tempPoint5);
			
			// верхняя точка
			var tempPoint6:Point = new Point(0, -_dist);
			_endPoints.push(tempPoint6);
			
			for(var i:int = 0; i < _endPoints.length; i++){
				_centerPoints.push(new Point(_endPoints[i].x / 2, _endPoints[i].y / 2));
			}
			
			_startAngles.push(-Math.PI / 6);
			_startAngles.push(Math.PI / 6);
			_startAngles.push(Math.PI / 2);
			_startAngles.push(Math.PI * 5 / 6);
			_startAngles.push(Math.PI * 7 / 6);
			_startAngles.push(Math.PI * 3 / 2);
		}
		
		
		private function calcPaths():void{
			var dist:Number = _side * Math.sqrt(3) + _gap;
			var rad:Number = dist / 2;
			var startPos:Point = new Point(0, 0);
			var endPos:Point = new Point(0, dist);
			var centerPos:Point = new Point(0, rad);
			
			_startPoint = new Point(0, 0);
			_paths = new Vector.<Vector.<Point>>;

			var numOfSteps:int = 20;
			
			var deltaAngle:Number = Math.PI / numOfSteps;
			
			for(var j:int = 0; j < _startAngles.length; j++){
				var angle:Number = _startAngles[j];
				var tempPath:Vector.<Point> = new Vector.<Point>;
				tempPath.push(_startPoint);
				for(var i:int = 0; i < numOfSteps - 1; i++){
					var x:Number = _centerPoints[j].x - _rad * Math.cos(angle);
					var y:Number = _centerPoints[j].y - _rad * Math.sin(angle);
					tempPath.push(new Point(x, y));
					angle += deltaAngle;
				}
				tempPath.push(_endPoints[j]);
				_paths.push(tempPath);
			}			
		}
		
		public function get paths():Vector.<Vector.<Point>>{
			return _paths;
		}
	}
}