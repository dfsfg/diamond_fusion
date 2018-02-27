package classes.levels
{
	/**
	 * <h1>Ограничение уровня</h1>
	 * <p>Определяет длительность уровня, независимо от того, достигнуты ли цели или нет.
	 * Ограничение может быть как по времени игры, так и по количеству ходов.</p>
	 * <p>Содержит следующие переменные:
	 * <ul>
	 * <li><b><i>_type</i></b> - определяет тип ограничения - по времени или по количеству ходов;</li>
	 * <li><b><i>_value</i></b> - значение ограничения;</li>
	 * </ul>
	 * ... и методы доступа к ним:
	 * <ul>
	 * <li><b><i>get type()</i></b> - возвращает тип ограничения;</li>
	 * <li><b><i>get value()</i></b> - возвращает значение ограничения.</li>
	 * </ul>
	 * </p>
	 * <p>Значения переменных устанавливаются при создании экземпляра класса и не могут быть изменены в дальнейшем.</p>
	 * */
	public class LevelLimitations
	{
		private var _type:int;
		private var _value:int;
		
		public function LevelLimitations(pt:int, pv:int)
		{
			init(pt, pv);
		}
		
		private function init(pt:int, pv:int):void{
			_type = pt;
			_value = pv;
		}
		
		/** возвращает тип ограничения уровня */
		public function get type():int{
			return _type;
		}
		
		/** возвращает значение ограничения уровня */
		public function get value():int{
			return _value;
		}
		
		/** возвращает новый объект с аттрибутами, равными аттрибутам текущего объекта */
		public function clone():LevelLimitations{
			return new LevelLimitations(_type, _value);
		}
	}
}