package classes.managers
{
	import flash.geom.Point;
	
	//import starling.display.DisplayObject;

	public interface IScreenObjectMover
	{
		/**
		 * <h1>Установка параметров движения</h1>
		 * <p>
		 * Метод задает параметры движения объекта на экране
		 * <ul>
		 * <li><b><i>psp:Point</i></b> - начальное положение объекта (<i>parameter start point</i>);</li>
		 * <li><b><i>pep:Point</i></b> - конечное положение объекта (<i>parameter end point</i>).</li>
		 * <li><b><i>pv:Number</i></b> - скорость движения объекта (<i>parameter velocity</i>).</li>
		 * </ul>
		 * </p>
		 * */
		function defineMovement(psp:Point, pep:Point, pv:Number):void;
		
		/**
		 * <h1>Управление движением объекта</h1>
		 * <p>Метод управляет движением объекта на экране.</p>
		 * */
		function move():void;
		
		/**
		 * <h1>Состояние движения</h1>
		 * <p>Возвращает значение, характеризующее состояние движения - <i>true</i> (движется) или <i>false</i> (не движется).</p>
		 * */
		function get isMoving():Boolean;
	}
}