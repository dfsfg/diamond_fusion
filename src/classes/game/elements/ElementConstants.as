package classes.game.elements
{
	public class ElementConstants
	{
		// черный бриллиант
		//public static const TYPE_POST:int = 0;
		// бриллианты обыкновенные
		public static const TYPE_ZERO:int = 0;
		public static const TYPE_FIRST:int = 1;
		public static const TYPE_SECOND:int = 2;
		public static const TYPE_THIRD:int = 3;
		public static const TYPE_FOURTH:int = 4;
		public static const TYPE_FIFTH:int = 5;
		public static const TYPE_SIXTH:int = 6;
		public static const TYPE_SEVENTH:int = 7;
		
		/*
		public static const TYPE_EIGHTH:int = 8;
		public static const TYPE_NINETH:int = 9;
		public static const TYPE_TENTH:int = 10;
		public static const TYPE_ELEVENTH:int = 11;
		public static const TYPE_TWELVETH:int = 12;
		*/
		// элементы-препятствия
		public static const TYPE_GLASS:int = 8;
		public static const TYPE_STONE:int = 9;
		public static const TYPE_CAGE:int = 102;
		public static const TYPE_SLEEPING:int = 103;

		// основные состояния, в которых может быть элемент
		public static const STATUS_WAITED:int = 20;
		public static const STATUS_CREATED:int = 21;
		public static const STATUS_ALIVE:int = 22;
		public static const STATUS_EXPLODING:int = 23;
		public static const STATUS_DEAD:int = 24;
		public static const STATUS_MOVED:int = 25;
		public static const STATUS_SWITCHED:int = 26;
		public static const STATUS_ACTIVATED:int = 27;
		
		// состояние между STATUS_MUST_DIE и STATUS_DEAD, в котором находится элемент,
		// не просто находящийся в какой-то "группе по 3", а группе определенного типа,
		// порождающей тот или иной бонусный элемент
		public static const STATUS_ADDED_TO_GROUP:int = 27;
	}
}