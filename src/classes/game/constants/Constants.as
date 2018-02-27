package classes.game.constants
{
	public class Constants
	{
		public static const STAGE_WIDTH:int = 550;
		public static const STAGE_HEIGHT:int = 750;
		// custom scoreboard elements
		public static const SCORE_BOARD_TIME:String = "Time: ";
		public static const SCORE_BOARD_SCORE:String = "Score: ";
		public static const SCORE_BOARD_STEPS:String = "Steps: ";
		public static const SCORE_BOARD_PROGRESS_BAR:String = "Score_board_progress_bar";
		
		public static const SCORE_BOARD_SUPER:String = "super_goal";
		public static const SCORE_BOARD_PRIMARY:String = "primary_goal";
		public static const SCORE_BOARD_SECONDARY:String = "secondary_goal";
		
		/** отношение заданных размеров экрана (1080 х 1920) к размерам экрана,
		 * для которого созданы графические ресурсы (540 х 960 */
		public static const SCALE_RATE:Number = 2;
		
		/** коэффициент, на который умножаются все баллы, полученные после достижения суперцели */
		public static const SCORE_RATE_SUPER:int = 2;
		
		/** баллы за уничтожение объекта, указанного в главной цели */
		public static const SCORE_MARK_PRIMARY:int = 5;
		
		/** баллы за уничтожение объета, указанного в дополнительной цели */
		public static const SCORE_MARK_SECONDARY:int = 3;
		
		/** баллы за уничтожение любого объекта, кроме тех, что указаны в главной
		 * и дополнительной целях */
		public static const SCORE_MARK_ORDINARY:int = 1;
		
		//public static const TASK_LEVEL_0:String = "task_level_0";
		//public static const TASK_LEVEL_1:String = "task_level_1";
		//public static const TASK_LEVEL_2:String = "task_level_2";
		
		/** константа, определяющая тип ограничения "время"<br />
		 * <b>NB!</b> значение этой константы не должно совпадать ни с одним значением типа элемента */
		public static const LIMIT_TIME:int = -1;
		
		/** константа, определяющая тип ограничения "перестановки"<br />
		 * <b>NB!</b> значение этой константы не должно совпадать ни с одним значением типа элемента */
		public static const LIMIT_STEPS:int = -2;
		
		/** константа, определяющая тип суперцели "счет"<br />
		 * <b>NB!</b> значение этой константы не должно совпадать ни с одним значением типа элемента */
		public static const TYPE_SCORE:int = -3;
		
		/**
		 * размерность гексагона - определяется как количество кругов вокруг центального элемента
		 * */
		public static const HEXAGON_SIZE:int = 5;
		
		/**
		 * сторона элемента гексагональной решетки
		 * */
		public static const ELEMENT_SIDE:Number = 27;
		
		/**
		 * скорость падения элемента
		 * */
		public static const FALLING_VELOCITY:Number = 60;
		
		/**
		 * скорость разлета частей элементов-препятствий
		 * */
		public static const EXPLOSION_VELOCITY:Number = 10;
		
		/**
		 * скорость движения элемента на освободившиееся место
		 * */
		public static const MOVING_VELOCITY:Number = 10;
		
		/**
		 * скорость распространения взрывной волны бонусного элемента
		 * */
		public static const WAVE_VELOCITY:int = 20;
		
		/**
		 * предел точности вычисления позиции элемента при движении
		 * */
		public static const EPSILON:Number = 20;
		
		/**
		 * величина погрешности при вычислении координат вершин решетки
		 * */
		public static const DIST_INACCURACY:Number = 6;
		
		/**
		 * время создания бонуса - время, за которое элементы уничтожаемой группы (дерева)
		 * смещаются к бонусному элементу
		 * */
		public static const BONUS_CREATION_TIME:int = 10;
		
		/**
		 * 
		 * */
		public static const BONUS_DIST_INACCURACY:int = 10;
		
		/**
		 * время между подсказками возможного хода
		 * */
		public static const DELAY_TO_SHOW_ADVICE:int = 300;
		
		/**
		 * звук, запускаемый при взрыве бриллианта
		 * */
		//public static const SOUND_DIAMOND:String = "sound_diamond_exploded";
		
		/**
		 * звук победных фейерверков
		 * */
		//public static const SOUND_FIREWORKS:String = "sound_fireworks";
		
		/**
		 * музыка во время игры
		 * */
		//public static const SOUND_GAME_PLAY:String = "sound_game_play";
		
		/**
		 * звук уничтожения Черного Бриллианта
		 * */
		//public static const SOUND_DIAMOND_CRASH:String = "sound_diamond_crash";
	}
}