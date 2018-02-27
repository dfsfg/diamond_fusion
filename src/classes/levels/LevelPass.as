package classes.levels
{
	/**
	 * <h1>Прохождение уровня в соответствии с ограничениями</h1>
	 * <p>Содержит следующие закрытые переменные:
	 * <ul>
	 * <li><b><i>_limits</i></b> - ограничения уровня;</li>
	 * <li><b><i>_current</i></b> - текущее состояние ограничений;</li>
	 * <li><b><i>_isOver</i></b> - завершение уровня в связи с ограничениями.</li>
	 * </ul>
	 * ... и открытые методы:
	 * <ul>
	 * <li><b><i>update()</i></b> - обновляет текущее состояние ограничения;</li>
	 * <li><b><i>get isOver()</i></b> - возвращает текущее состояние ограничения;</li>
	 * <li><b><i>reset()</i></b> - устанавливает начальное состояние ограничений, позволяя проходить уровень несколько раз.</li>
	 * </ul>
	 * </p>
	 * <p></p>
	 * */
	public class LevelPass
	{
		private var _limits:LevelLimitations;
		private var _current:int;
		private var _isOver:Boolean;
		
		public function LevelPass(pl:LevelLimitations)
		{
			init(pl);
		}
		
		private function init(pl:LevelLimitations):void{
			_limits = pl;
			resume();
		}
		
		public function get limits():LevelLimitations{
			return _limits;
		}
		
		/** обновляет текущее состояние ограничения */
		public function update():void{
			_current++;
			if(_current >= _limits.value){
				_isOver = true;
			}
		}
		
		/** возвращает текущее состояние ограничения */
		public function get isOver():Boolean{
			return _isOver;
		}
		
		/** устанавливает начальное состояние ограничений, позволяя проходить уровень несколько раз. */
		public function resume():void{
			_current = 0;
			_isOver = false;
		}
	}
}