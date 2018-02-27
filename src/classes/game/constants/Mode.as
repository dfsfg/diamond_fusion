package classes.game.constants
{
	/**
	 * <h1>Режим игры</h1>
	 * <p>Класс определяет константы, характеризующие режим игры:
	 * <ul>
	 * <li><i>UNDEFINED</i> - режим игры еще не определен;</li>
	 * <li><i>STRICT</i> - режим с ограниченным числом ходов для каждого уровня;</li>
	 * <li><i>ZEN</i> - режим с неограниченным числом ходов для каждого уровня.</li>
	 * </ul>
	 * </p>
	 * */
	public class Mode
	{
		public static const UNDEFINED:String = "undefined";
		public static const STRICT:String = "strict";
		public static const ZEN:String = "zen";
	}
}