package classes.managers
{
	import starling.display.DisplayObject;

	public class SteadySolvent implements IScreenObjectSolvent
	{
		private const FRAMES_TO_SKIP:int = 1;
		
		private var _do:DisplayObject;
		// start transparency
		private var _st:Number;
		// end transparency
		private var _et:Number;
		// step transparency
		private var _s:Number;
		// 
		private var _isSolving:Boolean;
		
		
		/** количество пропускаемых кадров при перерисовке элемента для демонстрации "взрыва" */
		private var _explosionStep:int;
		
		public function SteadySolvent(pdo:DisplayObject)
		{
			init(pdo);
		}
		
		private function init(pdo:DisplayObject):void{
			_do = pdo;
			
		}
		
		public function defineSolution(psv:Number, pev:Number, pstep:Number):void
		{
			_st = psv;
			_et = pev;
			_s = pstep;
			_isSolving = true;
			
			_explosionStep = 1;
		}
		
		public function solve():void
		{
			_st += _s;
			if(Math.abs(_st - _et) < Math.abs(_s)){
				_st = _et;
				_isSolving = false;
			}
			
			if(_explosionStep == FRAMES_TO_SKIP){
				_do.alpha = _st / 100;
				_explosionStep = 0;
			}else{
				_explosionStep++;
			}
			
			
		}
		
		public function get isSolving():Boolean
		{
			return _isSolving;
		}
	}
}