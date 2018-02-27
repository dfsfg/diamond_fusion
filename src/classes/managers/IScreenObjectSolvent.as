package classes.managers
{
	/**
	 * <h1>Управление прозрачностью объекта</h1>
	 * <p>Интерфейс определяет сигнатуры методов, используемых для управления прозрачностью
	 * объекта на экране.
	 * <ul>
	 * <li><b><i>defineSolution(psv:Number, pev:Number, pstep:Number):void</i></b> - задание параметров управления прозрачностью;
	 * <br /> принимает следующие параметры:
	 * <ul>
	 * <li><b><i>psv:Number</i></b> - начальное значение прозрачности объекта;</li>
	 * <li><b><i>pev:Number</i></b> - конечное значение прозрачности;</li>
	 * <li><b><i>pstep:Number</i></b> - шаг изменения прозрачности.</li>
	 * </ul>
	 * </li>
	 * <li><b><i>solve():void</i></b> - управление текущим состоянием растворения объекта;</li>
	 * <li><b><i>isSolving():Boolean</i></b> - определение текущего состояния.</li>
	 * </ul>
	 * </p>
	 * */
	public interface IScreenObjectSolvent
	{
		/**
		 * <h1>Установка параметров растворения</h1>
		 * <p>
		 * Метод задает параметры, управляющие растворением объекта на экране:
		 * <ul>
		 * <li><b><i>psv:Number</i></b> - начальное значение прозрачности объекта;</li>
		 * <li><b><i>pev:Number</i></b> - конечное значение прозрачности;</li>
		 * <li><b><i>pstep:Number</i></b> - шаг изменения прозрачности.</li>
		 * </ul>
		 * </p>
		 * */
		function defineSolution(psv:Number, pev:Number, pstep:Number):void;
		
		/**
		 * <h1>Управление растворением объекта на экране</h1>
		 * <p>Метод изменяет текущее состояние прозрачности объекта на экране</p>
		 * */
		function solve():void;
		
		/**
		 * <h1>Определене достижения конечного состояния</h1>
		 * <p>Возвращает значение, характеризующее состояние растворения - <i>true</i> (в процессе растворения) или <i>false</i> (процесс растворения завершен).</p>
		 * */
		function get isSolving():Boolean;
		
	}
}