package classes.game.elements
{
	import classes.game.constants.Constants;
	

	/**
	 * <h1>Уникальный идентификатор вершины гексагона</h1>
	 * <p>
	 * Класс задает уникальный идентификатор вершины гексагона на основе
	 * квадратной матрицы. Не смотря на то, что решетка
	 * является гексагональной, а не квадратной, расположение отдельного элемента
	 * в подобной решетке можно задать с помощью квадратной матрицы следующим образом:
	 * <ul>
	 * <li>вертикальные ряды гексагона задаются с помощью элементов в столбцах матрицы;</li>
	 * <li>нисходящие ряды гексагона задаются с помощью элементов в строках матрицы;</li>
	 * <li>восходящие ряды гексагона задаются с помощью элементов в восходящих диагоналях матрицы.</li>
	 * </ul>
	 * </p>
	 * <p>
	 * Таким образом, задание <i>двух</i> чисел позволяет однозначно идентифицировать
	 * взаимное расположение элементов в гексагональной решетке c <i>тремя</i> направлениями
	 * и абстрагировать проверку условия "3 в ряд" от физического размещения элементов
	 * на сцене.</p>
	 * Поля класса:
	 * <ul>
	 * <li><b>_column</b> - столбец в матрице</li>
	 * <li><b>_row</b> - ряд в матрице</li>
	 * </ul>
	 * <p>
	 * Ниже приведен пример матрицы 7 х 7, моделирущей гексагон, состоящий из трех рядов вокруг центрального элемента:<br />
	 * 0 0 0 1 1 1 1 <br />
	 * 0 0 1 1 1 1 1 <br />
	 * 0 1 1 1 1 1 1 <br />
	 * 1 1 1 1 1 1 1 <br />
	 * 1 1 1 1 1 1 0 <br />
	 * 1 1 1 1 1 0 0 <br />
	 * 1 1 1 1 0 0 0 <br />
	 * Как видно, единичные элементы матрицы формируют шестиугольник, похожий на искаженный гексагон, в котором, тем не менее,
	 * можно выделить три вышеупомянутых направления.
	 * </p>
	 * */
	public class VertexId
	{
		private var _num_of_row:int;
		private var _num_in_row:int;
		
		private var _hexCoords:Vector.<Vector.<int>>;
		
		public function VertexId(pcol:int, prow:int)
		{
			init(pcol, prow);
		}
		
		private function init(pcol:int, prow:int):void{
			_num_of_row = pcol;
			_num_in_row = prow;
			
			//trace("vertexId: _column = " + _column + ", _row = " + _row);
			_hexCoords = new Vector.<Vector.<int>>;
			
			// инициализируем вертикальные ряды
			var hexVertRows:Vector.<int> = new Vector.<int>;
			
			var hexRow:int = _num_of_row;
			var hexNum:int;
			if(_num_of_row <= Constants.HEXAGON_SIZE){
				hexNum = _num_in_row + _num_of_row - Constants.HEXAGON_SIZE;
			}else{
				hexNum = _num_in_row;
			}
			//trace("group = " + 0 + ", hexRow = " + hexRow + ", hexNum = " + hexNum);
			hexVertRows.push(hexRow);
			hexVertRows.push(hexNum);
			_hexCoords.push(hexVertRows);
			
			// инициализируем нисходящие ряды
			var hexSlopRows:Vector.<int> = new Vector.<int>;
			hexRow = _num_in_row;
			if(_num_in_row <= Constants.HEXAGON_SIZE){
				hexNum = _num_of_row + _num_in_row - Constants.HEXAGON_SIZE;
			}else{
				hexNum = _num_of_row;
			}
			/*
			if(_row <= Constants.HEXAGON_SIZE){
				hexRow = _column + _row - Constants.HEXAGON_SIZE;
			}else{
				hexRow = _column;
			}
			hexNum = _row;
			*/
			//trace("group = " + 1 + ", hexRow = " + hexRow + ", hexNum = " + hexNum);
			hexSlopRows.push(hexRow);
			hexSlopRows.push(hexNum);
			_hexCoords.push(hexSlopRows);
			
			var hexRisingRows:Vector.<int> = new Vector.<int>;
			hexRow = _num_of_row + _num_in_row - Constants.HEXAGON_SIZE;
			
			
			//----------------------------------------------------------------------
			// возможно, здесь ошибка - этот участок кода содержит неверное условие
			
			if(hexRow <= Constants.HEXAGON_SIZE){
				hexNum = _num_of_row;
			}else{
				hexNum = _num_of_row - (hexRow - Constants.HEXAGON_SIZE);
			}
			
			// изменим его следующим образом
			/*
			if(_num_of_row + _num_in_row < 2 * Constants.HEXAGON_SIZE - 1){
				hexNum = _num_of_row;
			}else{
				hexNum = _num_of_row - (hexRow - Constants.HEXAGON_SIZE);
			}
			*/
			//trace("vertexId: _column = " + _column + ", _row = " + _row + ", group = " + 2 + ", hexRow = " + hexRow + ", hexNum = " + hexNum);
			hexRisingRows.push(hexRow);
			hexRisingRows.push(hexNum);
			_hexCoords.push(hexRisingRows);
		}

		/*
		public function set column(pcol:int):void{
			_column = pcol;
		}
		
		public function set row(prow:int):void{
			_row = prow;
		}
		*/
		public function get num_of_row():int{
			return _num_of_row;
		}
		
		public function get num_in_row():int{
			return _num_in_row;
		}
		
		/** возвращает массив гексагональных координат идентификатора вершины,
		 * определяющих ее положение в гексагональной решетке. */
		public function get hexCoords():Vector.<Vector.<int>>{
			return _hexCoords;			
		}
		
		/**
		 * Копирует значения переменных заданного экземпляра, присваивая их переменным текущего экземпляра.
		 * */
		public function copyValues(pvid:VertexId):void{
			this._num_of_row = pvid.num_of_row;
			this._num_in_row = pvid.num_in_row;
			for(var i:int = 0; i < pvid.hexCoords.length; i++){
				for(var j:int = 0; j < pvid.hexCoords[i].length; j++){
					this._hexCoords[i][j] = pvid.hexCoords[i][j];
				}
			}
		}

		/**
		 * <h1>Проверка на равенство</h1>
		 * <p>Метод сравнивает поля <b><i>_column</i></b> и <b><i>_row</i></b> текущего экземпляра класса с полями другого экземпляра
		 * и возвращает <i>true</i>, если соответствующие поля равны, или <i>false</i> в противном случае.</p>
		 * */
		public function isEqual(comparedId:VertexId):Boolean{
			var res:Boolean;
			if((this._num_of_row == comparedId.num_of_row) && (this._num_in_row == comparedId.num_in_row)){
				res = true;
			}else{
				res = false;
			}
			return res;
		}
		
		public function toString():String{
			return new String("_num_of_row = " + _num_of_row + ", _num_in_row = " + _num_in_row);
		}

	}
}