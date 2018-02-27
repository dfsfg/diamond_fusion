package classes.levels
{
	/**
	 * <h1>Элементарное задание</h1>
	 * <p>Определяет тип задания и численное значение, необходимое для его выполнения.
	 * Так, для суперцели тип определяет необходимое количество очков, которое нужно набрать за время прохождения
	 * уровня, для главной цели - тип уничтожаемых препятствий, для дополнительной - тип некоторого элемента.</p>
	 * <p>
	 * Содержит следующие переменные:
	 * <ul>
	 * <li><b><i>_type</i></b> - тип задания;</li>
	 * <li><b><i>_needed</i></b> - значение, которое нужно достигнуть;</li>
	 * </ul>
	 * ...и методы доступа к ним:
	 * <ul>
	 * <li><b><i>get type()</i></b> - возвращает тип задания;</li>
	 * <li><b><i>get needed()</i></b> - и значение для достижения.</li>
	 * </ul> 
	 * </p>
	 * <p>Значения переменных устанавливаются при создании экземпляра класса и не могут быть изменены в дальнейшем.</p>
	 * */
	public class SingleGoalSpec
	{
		private var _type:int;
		private var _needed:int;
		
		public function SingleGoalSpec(pt:int, pn:int)
		{
			init(pt, pn);
		}
		
		private function init(pt:int, pn:int):void{
			_type = pt;
			_needed = pn;
		}
		
		/** возвращает тип единичного задания */
		public function get type():int{
			return _type;
		}
		
		/** возвращает значение, необходимое для выполнения текущего единичного задания */
		public function get needed():int{
			return _needed;
		}
		
		/** возвращает новый объект с аттрибутами, равными аттрибутам текущего объекта */
		public function clone():SingleGoalSpec{
			return new SingleGoalSpec(_type, _needed);
		}
	}
}