package classes.managers
{
	import starling.display.DisplayObject;
	
	
	public class SteadyScaler implements IScreenObjectScaler
	{
		private const FRAMES_TO_SKIP:int = 1;
		
		private var _isScaling:Boolean;
		private var _do:DisplayObject;
		private var _startScale:Number;
		private var _endScale:Number;
		private var _stepScale:Number;
		private var _currentScale:Number;
		
		/** количество пропускаемых кадров при перерисовке элемента для демонстрации "взрыва" */
		private var _explosionStep:int;
				
		public function SteadyScaler(pdo:DisplayObject)
		{
			init(pdo);
		}
		
		private function init(pdo:DisplayObject):void{
			this._do = pdo;
			
		}
		
		public function defineScaling(pss:Number, pes:Number, pstep:Number):void
		{
			_startScale = pss;
			_endScale = pes;
			_stepScale = pstep;
			
			if(pss > pes) _stepScale *= (-1);
			
			_isScaling = true;
			
			_explosionStep = 0;
		}
		
		public function scale():void
		{
			_currentScale = _startScale + _stepScale;
			if(_stepScale > 0){
				if(_currentScale > _endScale){
					_currentScale = _endScale;
					_isScaling = false;
				}
			}else{
				if(_currentScale < _endScale){
					_currentScale = _endScale;
					_isScaling = false;
				}
			}
			
			
			if(_explosionStep == FRAMES_TO_SKIP){
				_do.scaleX = _currentScale;
				_do.scaleY = _currentScale;
				
				_explosionStep = 0;
			}else{
				_explosionStep++;
			}
		}
		
		public function isScaling():Boolean
		{
			return _isScaling;
		}
	}
}