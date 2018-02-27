package classes.levels
{
	/**
	 * <h1>Условия для прохождения уровня</h1>
	 * <p>Определяет цели, достижение которых нужно для прохождения уровня, и ограничения на время
	 * его прохождения.</p>
	 * <p>
	 * Содержит следующие переменные:
	 * <ul>
	 * <li><b><i>_levelGoalProgress</i></b> - определяет цели уровня и их достижение;</li>
	 * <li><b><i>_levelPass</i></b> определяет и отслеживает  одно из двух возможных ограничений - по времени или по количеству ходов;</li>
	 * </ul>
	 * ... и методы доступа к ним:
	 * <ul>
	 * <li><b><i>get levelGoalProgress()</i></b> - возвращает цели и достижения уровня;</li>
	 * <li><b><i>get levelPass()</i></b> - возвращает ограничения уровня.</li>
	 * </ul>
	 * </p>
	 * <p>Значения переменных устанавливаются при создании экземпляра класса и не могут быть изменены в дальнейшем.</p>
	 * */
	public class LevelConditions
	{
		private var _levelGoalProgress:Vector.<SingleGoalProgress>;
		private var _levelPass:LevelPass;
		
		public function LevelConditions(pp:Vector.<SingleGoalProgress>, pl:LevelPass)
		{
			init(pp, pl);
		}
		
		private function init(pp:Vector.<SingleGoalProgress>, pl:LevelPass):void{
			_levelGoalProgress = pp;
			_levelPass = pl;
		}
		
		/** возвращает спецификации заданий уровня */
		public function get levelGoalProgress():Vector.<SingleGoalProgress>{
			return _levelGoalProgress;
		}
		
		/** возвращает ограничения, накладываемые на продолжительность уровня */
		public function get levelPass():LevelPass{
			return _levelPass;
		}
	}
}