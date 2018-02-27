package classes.managers
{
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	
	public class SteadyMover implements IScreenObjectMover
	{
		private var _isMoving:Boolean;
		private var _do:DisplayObject;
		private var _x:Number;
		private var _y:Number;
		private var _xend:Number;
		private var _yend:Number;
		private var _dx:Number;
		private var _dy:Number;
		private var _vx:Number;
		private var _vy:Number;
		
		public function SteadyMover(pdo:DisplayObject)
		{
			init(pdo);
		}
		
		private function init(pdo:DisplayObject):void{
			this._do = pdo;
		}
		
		public function defineMovement(psp:Point, pep:Point, pv:Number):void
		{
			// определяем проходимое расстояние
			var dist:Number = Math.sqrt((pep.x - psp.x) * (pep.x - psp.x) + (pep.y - psp.y) * (pep.y - psp.y));
			// определяем компоненты скорости движения
			_vx = (pep.x - psp.x) * pv / dist;
			_vy = (pep.y - psp.y) * pv / dist;
			// задаем начальное положение
			_x = psp.x;
			_y = psp.y;
			_dx = _do.x - _x;
			_dy = _do.y - _y;
			// задаем конечное положение
			_xend = pep.x;
			_yend = pep.y;
			// начинаем движение
			_isMoving = true;
			
		}
		
		public function move():void
		{
			if(_isMoving){
				// эти переменные определяют достижение конечных точек
				var xfin:Boolean = false;
				var yfin:Boolean = false;
				_x += _vx;
				_y += _vy;
				// проверяем, достигнута ли конечная X-координата
				if(Math.abs(_x - _xend) <= Math.abs(_vx)){
					_x = _xend;
					xfin = true;
				}
				// проверяем, достигнута ли конечная Y-координата
				if(Math.abs(_y - _yend) <= Math.abs(_vy)){
					_y = _yend;
					yfin = true;
				}
				_do.x = _x + _dx;
				_do.y = _y + _dy;
				// если обе координаты X и Y достигнуты, останавливаемся
				if(xfin && yfin){
					_isMoving = false;
				}
			}

		}
		
		public function get isMoving():Boolean{
			return _isMoving;
		}
	}
}