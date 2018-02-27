package classes.levels
{
	import classes.game.constants.Constants;
	import classes.game.constants.Mode;
	import classes.game.elements.ElementConstants;
	
	/**
	 * <h1>Создатель целей уровня</h1>
	 * <p>Класс предназначен для создания единственного 
	 * экземпляра класса <b><i>LevelConditions</i></b>
	 * и возвращения его классу GameFrame</p>
	 * <p></p>
	 * */
	public class LevelTaskFactory
	{
		private const GLASS:int = 1;
		private const STONE:int = 2;
		
		private var _levelObstacles:Vector.<LevelObstaclesLayout>;
		private var _mode:String;
		
		public function LevelTaskFactory(pobstacles:Vector.<LevelObstaclesLayout>)
		{
			_levelObstacles = pobstacles;
		}
		
		
		
		/** Создает и возвращает массив переменных, определяющих цели, результаты прохождений и ограничения каждого уровня игры */
		public function createLevelConditions(pmode:String = Mode.STRICT):Vector.<LevelConditions>{
			_mode = pmode;
			
			var conditions:Vector.<LevelConditions> = new Vector.<LevelConditions>;
			
			// начальный уровень
			var tempLevelConditions:LevelConditions = conditionsOfLevel_0();
			conditions.push(tempLevelConditions);
			
			// первый уровень
			tempLevelConditions = conditionsOfLevel_1();
			conditions.push(tempLevelConditions);
			
			// второй уровень
			tempLevelConditions = conditionsOfLevel_2();
			conditions.push(tempLevelConditions);
			
			// третий уровень
			tempLevelConditions = conditionsOfLevel_3();
			conditions.push(tempLevelConditions);
			
			// четвертый уровень
			tempLevelConditions = conditionsOfLevel_4();
			conditions.push(tempLevelConditions);
			
			// пятый уровень
			tempLevelConditions = conditionsOfLevel_5();
			conditions.push(tempLevelConditions);
			
			// шестой уровень
			tempLevelConditions = conditionsOfLevel_6();
			conditions.push(tempLevelConditions);
			
			// седьмой уровень
			tempLevelConditions = conditionsOfLevel_7();
			conditions.push(tempLevelConditions);
			
			// восьмой уровень
			tempLevelConditions = conditionsOfLevel_8();
			conditions.push(tempLevelConditions);
			
			// девятый уровень
			tempLevelConditions = conditionsOfLevel_9();
			conditions.push(tempLevelConditions);
			
			//-------------------------------------------
			
			// десятый уровень
			tempLevelConditions = conditionsOfLevel_10();
			conditions.push(tempLevelConditions);
			
			// одиннадцатый уровень
			tempLevelConditions = conditionsOfLevel_11();
			conditions.push(tempLevelConditions);
			
			// двенадцатый уровень
			tempLevelConditions = conditionsOfLevel_12();
			conditions.push(tempLevelConditions);
			
			// тринадцатый уровень
			tempLevelConditions = conditionsOfLevel_13();
			conditions.push(tempLevelConditions);
			
			// четырнадцатый уровень
			tempLevelConditions = conditionsOfLevel_14();
			conditions.push(tempLevelConditions);
			
			// пятнадцатый уровень
			tempLevelConditions = conditionsOfLevel_15();
			conditions.push(tempLevelConditions);
			
			// шестнадцатый уровень
			tempLevelConditions = conditionsOfLevel_16();
			conditions.push(tempLevelConditions);
			
			// семнадцатый уровень
			tempLevelConditions = conditionsOfLevel_17();
			conditions.push(tempLevelConditions);
			
			// восемнадцатый уровень
			tempLevelConditions = conditionsOfLevel_18();
			conditions.push(tempLevelConditions);
			
			// девятнадцатый уровень
			tempLevelConditions = conditionsOfLevel_19();
			conditions.push(tempLevelConditions);
			
			//-------------------------------------------
			// двадцатый уровень
			tempLevelConditions = conditionsOfLevel_20();
			conditions.push(tempLevelConditions);
			
			// двадцать первый уровень
			tempLevelConditions = conditionsOfLevel_21();
			conditions.push(tempLevelConditions);
			
			// двадцать второй уровень
			tempLevelConditions = conditionsOfLevel_22();
			conditions.push(tempLevelConditions);
			
			// двадцать третий уровень
			tempLevelConditions = conditionsOfLevel_23();
			conditions.push(tempLevelConditions);
			
			// двадцать четвертый уровень
			tempLevelConditions = conditionsOfLevel_24();
			conditions.push(tempLevelConditions);
			
			// двадцать пятый уровень
			tempLevelConditions = conditionsOfLevel_25();
			conditions.push(tempLevelConditions);
			
			// двадцать шестой уровень
			tempLevelConditions = conditionsOfLevel_26();
			conditions.push(tempLevelConditions);
			
			// двадцать седьмой уровень
			tempLevelConditions = conditionsOfLevel_27();
			conditions.push(tempLevelConditions);
			
			// двадцать восьмой уровень
			tempLevelConditions = conditionsOfLevel_28();
			conditions.push(tempLevelConditions);
			
			// двадцать девятый уровень
			tempLevelConditions = conditionsOfLevel_29();
			conditions.push(tempLevelConditions);
			
			return conditions;
		}
		
		private function findNumOfObstacles(levNum:int, type:int):int{
			//trace("levNum = " + levNum + ", type = " + type);
			//trace("levelObstacles.length = " + _levelObstacles.length);
			var res:int = 0;
			for(var i:int = 0; i < _levelObstacles.length; i++){
				//trace("_levelObstacles[" + i + "].levelNum = " + _levelObstacles[i].levelNum);
				if(levNum == _levelObstacles[i].levelNum){
					for(var j:int = 0; j < _levelObstacles[i].layout.length; j++){
						for(var k:int = 0; k < _levelObstacles[i].layout[j].length; k++){
							//trace("_levelObstacles[" + i + "].layout[j][k] = " + _levelObstacles[i].layout[j][k]);
							if(_levelObstacles[i].layout[j][k] == type){
								res++;
							}
						}
					}
					break;
				}
				
			}
			//trace("there are " + res + " goal elements of type " + type + " for level num " + levNum);
			return res;
		}
		
		////////////////////////////////////////////////////////////////////////////////////////
		///
		//		УРОВНИ 0 - 9
		///
		////////////////////////////////////////////////////////////////////////////////////////
		
		/** определяет цели, результаты прохождений и ограничения начального уровня */
		private function conditionsOfLevel_0():LevelConditions{
			// совокупность целей и результатов прохождений уровня
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 120 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 90);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 12 элементов типа TYPE_FIRST
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FIRST, 9);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 9 элементов типа TYPE_FIFTH
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FIFTH, 6);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 20);
				var pass:LevelPass = new LevelPass(limitations);
			}
			/*
			// ограничение - успеть за 10 ходов
			var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 10);
			var pass:LevelPass = new LevelPass(limitations);
			*/
			// цели и ограничения
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения первого уровня */
		private function conditionsOfLevel_1():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 160 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 150);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 15 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SECOND, 12);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 12 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_THIRD, 12);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 15 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 20);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения второго уровня */
		private function conditionsOfLevel_2():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 180 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 160);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 18 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FOURTH, 15);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 12 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SIXTH, 12);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 15 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 20);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения третьего уровня */
		private function conditionsOfLevel_3():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 240 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 230);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 20 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FIRST, 21);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 18 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SECOND, 15);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 20 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 25);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения четвертого уровня */
		private function conditionsOfLevel_4():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 2000 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 260);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 24 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_THIRD, 24);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 18 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FOURTH, 18);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 20 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 30);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения пятого уровня */
		private function conditionsOfLevel_5():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 300 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 300);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 30 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_ZERO, 24);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS - однослойных препятствий
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(5, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 35 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 40);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения шестого уровня */
		private function conditionsOfLevel_6():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 380 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 380);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 24 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SEVENTH, 24);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(6, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 20 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 50);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения седьмого уровня */
		private function conditionsOfLevel_7():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 200 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 200);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить указанное количество препятствий типа STONE - двуслойных препятствий
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_STONE, findNumOfObstacles(7, STONE));
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(7, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 30 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 30);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения восьмого уровня */
		private function conditionsOfLevel_8():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 300 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 270);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить указанное количество препятствий типа STONE - двуслойных препятствий
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_STONE, findNumOfObstacles(8, STONE));
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(8, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 35 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 35);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения девятого уровня */
		private function conditionsOfLevel_9():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 320 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 320);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить указанное количество препятствий типа STONE - двуслойных препятствий
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_STONE, findNumOfObstacles(9, STONE));
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(9, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 40 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 40);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		////////////////////////////////////////////////////////////////////////////////////////
		///
		//		УРОВНИ 10 - 19
		///
		////////////////////////////////////////////////////////////////////////////////////////
		
		/** определяет цели, результаты прохождений и ограничения начального уровня */
		private function conditionsOfLevel_10():LevelConditions{
			// совокупность целей и результатов прохождений уровня
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 200 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 200);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 12 элементов типа TYPE_FIRST
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_ZERO, 15);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 9 элементов типа TYPE_FIFTH
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FIFTH, 12);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 10 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 15);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			// цели и ограничения
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения первого уровня */
		private function conditionsOfLevel_11():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 160 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 270);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 15 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SECOND, 21);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 12 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FIRST, 15);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 15 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 20);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения второго уровня */
		private function conditionsOfLevel_12():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 180 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 300);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 18 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SEVENTH, 21);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 12 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SIXTH, 18);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 15 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 20);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения третьего уровня */
		private function conditionsOfLevel_13():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 240 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 370);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 20 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FIFTH, 27);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 18 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SIXTH, 21);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 20 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 25);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения четвертого уровня */
		private function conditionsOfLevel_14():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 2000 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 400);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 24 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SECOND, 30);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 18 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FOURTH, 24);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 20 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 30);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения пятого уровня */
		private function conditionsOfLevel_15():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 300 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 520);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 30 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SIXTH, 30);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS - однослойных препятствий
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(15, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 35 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 50);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения шестого уровня */
		private function conditionsOfLevel_16():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 380 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 650);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 24 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FOURTH, 30);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(16, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 20 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 60);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения седьмого уровня */
		private function conditionsOfLevel_17():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 200 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 450);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить указанное количество препятствий типа STONE - двуслойных препятствий
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_STONE, findNumOfObstacles(17, STONE));
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(17, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 30 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 50);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения восьмого уровня */
		private function conditionsOfLevel_18():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 300 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 500);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить указанное количество препятствий типа STONE - двуслойных препятствий
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_STONE, findNumOfObstacles(18, STONE));
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(18, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 35 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 55);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения девятого уровня */
		private function conditionsOfLevel_19():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 320 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 550);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить указанное количество препятствий типа STONE - двуслойных препятствий
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_STONE, findNumOfObstacles(19, STONE));
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(19, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 40 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 60);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		////////////////////////////////////////////////////////////////////////////////////////
		///
		//		УРОВНИ 20 - 29
		///
		////////////////////////////////////////////////////////////////////////////////////////
		
		/** определяет цели, результаты прохождений и ограничения начального уровня */
		private function conditionsOfLevel_20():LevelConditions{
			// совокупность целей и результатов прохождений уровня
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 120 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 400);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 12 элементов типа TYPE_FIRST
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FIRST, 27);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 9 элементов типа TYPE_FIFTH
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_ZERO, 18);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 10 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 25);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			// цели и ограничения
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения первого уровня */
		private function conditionsOfLevel_21():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 160 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 500);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 15 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SECOND, 33);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 12 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_THIRD, 24);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 15 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 30);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения второго уровня */
		private function conditionsOfLevel_22():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 180 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 500);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 18 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FOURTH, 33);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 12 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SEVENTH, 24);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 15 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 30);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения третьего уровня */
		private function conditionsOfLevel_23():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 240 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 600);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 20 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_THIRD, 40);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 18 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_SIXTH, 30);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 20 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 35);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения четвертого уровня */
		private function conditionsOfLevel_24():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 2000 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 450);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 24 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_THIRD, 30);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить 18 элементов типа TYPE_THIRD
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FOURTH, 24);
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 20 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 25);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения пятого уровня */
		private function conditionsOfLevel_25():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 300 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 650);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 30 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_ZERO, 30);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS - однослойных препятствий
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(25, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 35 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 50);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения шестого уровня */
		private function conditionsOfLevel_26():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 380 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 750);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить 24 элементов типа TYPE_SECOND
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_FOURTH, 30);
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(26, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 20 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 60);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения седьмого уровня */
		private function conditionsOfLevel_27():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 200 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 650);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить указанное количество препятствий типа STONE - двуслойных препятствий
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_STONE, findNumOfObstacles(27, STONE));
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(27, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 30 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 55);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения восьмого уровня */
		private function conditionsOfLevel_28():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 300 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 800);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить указанное количество препятствий типа STONE - двуслойных препятствий
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_STONE, findNumOfObstacles(28, STONE));
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(28, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 35 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 60);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}
		
		/** определяет цели, результаты прохождений и ограничения девятого уровня */
		private function conditionsOfLevel_29():LevelConditions{
			
			var progress:Vector.<SingleGoalProgress> = new Vector.<SingleGoalProgress>;
			
			// суперцель - набрать 320 очков
			var superGoal:SingleGoalSpec = new SingleGoalSpec(Constants.TYPE_SCORE, 900);
			var superGoalProgress:SingleGoalProgress = new SingleGoalProgress(superGoal);
			progress.push(superGoalProgress);
			
			// главная цель - уничтожить указанное количество препятствий типа STONE - двуслойных препятствий
			var primaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_STONE, findNumOfObstacles(29, STONE));
			var primaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(primaryGoal);
			progress.push(primaryGoalProgress);
			
			// дополнительная цель - уничтожить указанное количество препятствий типа GLASS
			var secondaryGoal:SingleGoalSpec = new SingleGoalSpec(ElementConstants.TYPE_GLASS, findNumOfObstacles(29, GLASS));
			var secondaryGoalProgress:SingleGoalProgress = new SingleGoalProgress(secondaryGoal);
			progress.push(secondaryGoalProgress);
			
			if(_mode == Mode.STRICT){
				// ограничение - успеть за 40 ходов
				var limitations:LevelLimitations = new LevelLimitations(Constants.LIMIT_STEPS, 65);
				var pass:LevelPass = new LevelPass(limitations);
			}
			
			
			var conditions:LevelConditions = new LevelConditions(progress, pass);
			return conditions;
		}

	}
}