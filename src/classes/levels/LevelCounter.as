package classes.levels
{
	/**
	 * <h1>Счетчик уровней</h1>
	 * <p>
	 * Класс предназначен для хранения информации о текущем уровне игры
	 * и количестве пройденных уровней, чтобы пользователь имел возможность
	 * вернуться назад и переиграть ранее пройденные уровни.</p>
	 * <p>
	 * Конструктор принимает один обязательный параметр и два необязательных, чьи
	 * значения могут устанавливаться по умолчанию:<br />
	 * <ul>
	 * <li><b>levels</b> <i>(обязательный параметр)</i> - количество уровней в игре</li>
	 * <li><b>current</b> - текущий уровень</li>
	 * <li><b>completed</b> - последний ранее пройденный уровень</li>
	 * </ul>
	 * Необязательные параметры позволяют использовать данные о ранее пройденных уровнях,
	 * хранящихся вне игры (возможно, на удаленых серверах). При инициализации игры
	 * использование этой информации позволяет пользователю продолжить игру с последнего
	 * сохраненного уровня. </p>
	 * Значения необязательных параметров по умолчанию задают первоначальное прохождение игры.<br /> 
	 * <p>
	 * Экземпляр класса позволяет использовать следующие общедоступные методы:
	 * <ul>
	 * <li><b>set completedLevel(levelNum:int)</b> - обновляет значение пройденного уровня и инкрементирует текущий;</li>
	 * <li><b>get completedLevel()</b> - возвращает значение максимального пройденного уровня;</li>
	 * <li><b>set currentLevel(levelNum:int)</b></li> - обновляет значение текущего уровня;
	 * <li><b>get currentLevel()</b> - возвращает значение текущего уровня.</li>
	 * </ul>
	 * </p>
	 * */
	public class LevelCounter
	{
		// Номер последнего уровня в игре.
		// Этот параметр необходим для того, чтобы после самого последнего уровня
		// следовал начальный.
		private var _maxLevelNum:int;
		// текущий уровень
		private var _currentLevelNum:int;
		// последний пройденный уровень
		private var _completedLevelNum:int;
		
		// массив счета уровней
		private var _levelScores:Vector.<int>;
		

		public function LevelCounter(maxLevel:int, current:int = 0, completed:int = -1, levelScores:Vector.<int> = null)
		{
			init(maxLevel, current, completed, levelScores);
		}
		
		private function init(max:int, current:int = 0, completed:int = -1, levelScores:Vector.<int> = null):void{
			_maxLevelNum = max;
			_currentLevelNum = current;
			_completedLevelNum = completed;
			_levelScores = new Vector.<int>;
			if(levelScores == null){
				for(var i:int = 0; i <= max; i++){
					_levelScores.push(0);
				}
			}else{
				for(i = 0; i <= max; i++){
					_levelScores[i] = levelScores[i];
				}
			}
		}
		
		/**
		 * <h1>Установка значения последнего пройденного уровня</h1>
		 * <p>
		 * Метод проверяет, не был ли только что успешно завершенный уровень
		 * пройден ранее, и если нет, устанавливает новое значение последнего
		 * пройденного уровня. </p>
		 * <p>После этого метод устанавливает значение следующего уровня,
		 * причем для самого последнего уровня следующим уровнем буден начальный.</p>
		 * */
		public function set completedLevel(levelNum:int):void{
			// проверяем, не проходил ли пользователь этот уровень ранее
			if(levelNum > _completedLevelNum){
				_completedLevelNum = levelNum;
			}
			// инкрементируем значение текущего уровня.
			// Мы не используем конструкцию _currentLevelNum = _completedLevelNum + 1
			// по вышеуказанной причине. Эта конструкция могла бы использоваться только
			// для последовательного прохождения всех уровней, исключающего возвращение
			// к ранее пройденным уровням.
			_currentLevelNum++;
			// проверяем, не был ли только что завершенный уровень последним
			if(_currentLevelNum > _maxLevelNum){
				// если да, возвращаем игру в начало
				_currentLevelNum = 0;
			}
		}
		
		/**
		 * Метод возвращает значение максимального пройденного уровня.
		 * */
		public function get completedlevel():int{
			return _completedLevelNum;
		}
		
		/**
		 * Метод устанавливает значение следующего уровня
		 * */
		public function set currentLevel(levelNum:int):void{
			if(levelNum <= _completedLevelNum){
				_currentLevelNum = levelNum;
			}
		}
		
		/**
		 * Метод возвращает значение текущего уровня.
		 * */
		public function get currentLevel():int{
			return _currentLevelNum;
		}
		
		public function get maxLevelNum():int{
			return _maxLevelNum;
		}
		
		public function setLevelScore(level:int, score:int):void{
			_levelScores[level] = score;
		}
		
		public function getLevelScore(level:int):int{
			return _levelScores[level];
		}

	}
}