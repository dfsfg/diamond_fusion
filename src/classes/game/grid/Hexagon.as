package classes.game.grid
{
	import classes.game.elements.VertexId;
	
	/**
	 * <h1>Гексагональная решетка элементов</h1>
	 * Класс предназначен для инициализаци переменной вида
	 * <ul><li><b>hexagon:Vector.&lt; Vector.&lt; Vector.&lt; VertexId&gt;&gt;&gt;</b></li></ul>
	 * Экземпляр этого класса используется однократно на этапе инициализации игры,
	 * затем после того, как переменная инициализирована, он должен быть уничтожен.<br /> 
	 * Класс устанавливает соответствие между элементами матрицы, однозначно идентифицирующими
	 * взаимное расположение элементов, и рядами гексагональной решетки, по которым производится
	 * проверка "3 в ряд".<br />
	 * <b>NB!</b> Класс не хранит данные о <i>физическом</i> расположении элементов на сцене - для этой
	 * цели используется класс <b>Graph</b>.<br />
	 * Поля класса:
	 * <ul>
	 * <li><b>_hexagon</b> - массив всех рядов гексагона; результат работы экземпляра класса;</li>
	 * <li><b>_columns</b> - вертикальные ряды, по которым движутся элементы во время игры;<br />
	 * нулевой элемент массива <b>_hexagon</b></li>
	 * <li><b>_risingRows</b> - наклонные ряды, идущие снизу вверх;<br />
	 * первый элемент массива <b>_hexagon</b></li>
	 * <li><b>_slopRows</b> - наклонные ряды, идущие сверху вниз;<br /> второй элемент массива <b>_hexagon</b></li>
	 * </ul>
	 * */
	public class Hexagon
	{
		/**
		 * Массив содержит массивы рядов:
		 * <ul>
		 * <li><b>_columns</b> - массив вертикальных рядов как нулевой элемент массива;</li>
		 * <li><b>_slopRows</b> - массив нисходящих рядов как первый элемент массива.</li>
		 * <li><b>_risingRows</b> - массив восходящих рядов как второй элемент массива;</li>
		 * </ul>
		 * */
		private var _rows:Vector.<Vector.<Vector.<VertexId>>>;
		
		private var _columns:Vector.<Vector.<VertexId>>;
		private var _risingRows:Vector.<Vector.<VertexId>>;
		private var _slopRows:Vector.<Vector.<VertexId>>;
		
		public function Hexagon(_matrixGraph:Matrix4Hexagon)
		{
			init(_matrixGraph);
		}
		
		private function init(_matrixGraph:Matrix4Hexagon):void{
			_rows = new Vector.<Vector.<Vector.<VertexId>>>;
			initColumns(_matrixGraph);
			_rows.push(_columns);
			
			initSlopRows(_matrixGraph);
			_rows.push(_slopRows);
			
			initRisingRows(_matrixGraph);
			_rows.push(_risingRows);
			
			//initHexCoords();
			
			//checkHexagon1();

			/*
			checkHexagon();
			checkColumns();
			checkSlopRows();
			checkRisingRows();
			*/
		}
		
		/**
		 * <h1>Инициализация вертикальных рядов гексагона</h1>
		 * Вертикальные ряды гексагона инициализируются на основе столбцов матрицы.
		 * */
		private function initColumns(matrixGraph:Matrix4Hexagon):void{
			_columns = new Vector.<Vector.<VertexId>>;
			for(var i:int = 0; i < matrixGraph.matrix.length; i++){
				var tempColumn:Vector.<VertexId> = new Vector.<VertexId>;
				for(var j:int = 0; j < matrixGraph.matrix[i].length; j++){
					if(matrixGraph.matrix[i][j] == 1){
						var tempVertexId:VertexId = new VertexId(i, j);
						tempColumn.push(tempVertexId);
					}
				}
				_columns.push(tempColumn);
			}
		}
		
		/**
		 * <h1>Инициализация восходящих рядов</h1>
		 * Восходящие ряды инициализируются на основе восходящих диагоналей матрицы.
		 * Поэтому код выглядит немного сложнее, чем код инициализации столбцов.
		 * */
		private function initRisingRows(matrixGraph:Matrix4Hexagon):void{
			_risingRows = new Vector.<Vector.<VertexId>>;
			// колонка матрицы, в которой начинается текущая диагональ;
			// инициализируется номером начального столбца матрицы
			var startColumn:int = 0;
			// ряд матрицы, в котором начинается текущая диагональ;
			// инициализируется номером среднего ряда матрицы, где начинается первая ненулевая диагональ
			var startRow:int = (matrixGraph.matrix.length - 1) / 2;
			
			for(var i:int = 0; i < matrixGraph.matrix.length; i++){
				// ищем нужную диагональ
				var tempColumn:int = startColumn;
				var tempRow:int = startRow;
				// движемся по текущей диагонали вправо и вверх
				var tempRisingRow:Vector.<VertexId> = new Vector.<VertexId>;
				do{
					var tempVertexId:VertexId = new VertexId(tempColumn, tempRow);
					tempRisingRow.push(tempVertexId);
					tempColumn++;
					tempRow--;
				}while((tempColumn < matrixGraph.matrix.length) && (tempRow >= 0));
				// когда диагональ пройдена до конца, запоминаем ее в массиве диагоналей
				_risingRows.push(tempRisingRow);
				
				// и переходим к началу следующей диагонали
				if(startColumn == 0){
					// если диагональ начинается в нулевом столбце, переходим к следующему ряду
					startRow++;
					if(startRow == matrixGraph.matrix.length){
						// если на данном шаге получили значения номера ряда за пределами матрицы,
						// возвращаемся на ряд назад и переходим к следующему столбцу
						startRow--;
						startColumn++;
					}
				}else{
					// если диагональ начинается в любом столбце, кроме начального, каждая следующая
					// диагональ начинается в следующем столбце
					startColumn++;
				}

			}
			
		}
		
		/**
		 * <h1>Инициализация нисходящих рядов гексагона.</h1>
		 * Нисходящие ряды гексагона инициализируются на основе рядов матрицы.
		 * Поскольку матрица симметрична, инициализация этих рядов происходит анаологично
		 * инициализации столбцов, но с транспонированием (заменой номеров строк на номера
		 * столбцов). <br />
		 * <i>(Вообще-то этот метод можно было бы объединить с методом <b>initColumns</b>,
		 * но лучше все же оставить два различных метода, а то потом разбирайся, почему написал код
		 * так, а не иначе...)</i>
		 * */
		private function initSlopRows(matrixGraph:Matrix4Hexagon):void{
			_slopRows = new Vector.<Vector.<VertexId>>;
			for(var i:int = 0; i < matrixGraph.matrix.length; i++){
				var tempColumn:Vector.<VertexId> = new Vector.<VertexId>;
				for(var j:int = 0; j < matrixGraph.matrix[i].length; j++){
					if(matrixGraph.matrix[i][j] == 1){
						var tempVertexId:VertexId = new VertexId(j, i);
						tempColumn.push(tempVertexId);
					}
				}
				_slopRows.push(tempColumn);
			}
		}
		
		/**
		 * <h1>Инициализация гексагональных координат</h1>
		 * <p>Метод устанавливает соответствие между идентификатором вершины и ее
		 * координатами в гексагоне</p>
		 * */
		/*
		private function initHexCoords():void{
			for(var i:int = 0; i < _rows.length; i++){
				for(var j:int = 0; j < _rows[i].length; j++){
					for(var k:int = 0; k < _rows[i][j].length; k++){
						_rows[i][j][k].hexCoords[i][0] = j;
						_rows[i][j][k].hexCoords[i][1] = k;
						//trace("_rows[i][j][k].hexCoords[i][0] = " + _rows[i][j][k].hexCoords[i][0]);
						//trace("_rows[i][j][k].hexCoords[i][1] = " + _rows[i][j][k].hexCoords[i][1]);
					}
				}
			}
		}
		*/
		
		/**
		 * <h1>Массив массивов рядов гексагона</h1>
		 * Возвращает массив, содержащий массивы рядов:
		 * <ul>
		 * <li><b>_columns</b> - вертикальные ряды, по которым движутся элементы во время игры;<br />
		 * нулевой элемент массива <b>_hexagon</b></li>
		 * <li><b>_risingRows</b> - наклонные ряды, идущие снизу вверх;<br />
		 * первый элемент массива <b>_hexagon</b></li>
		 * <li><b>_slopRows</b> - наклонные ряды, идущие сверху вниз;<br /> второй элемент массива <b>_hexagon</b></li>
		 * </ul>
		 * */
		public function get hexagon():Vector.<Vector.<Vector.<VertexId>>>{
			return _rows;
		}
		
		/*
		private function checkHexagon1():void{
			for(var i:int = 0; i < _rows.length; i++){
				for (var j:int = 0; j < _rows[i].length; j++){
					for(var k:int = 0; k < _rows[i][j].length; k++){
						var res:String = "group = " + i + "; hexRow = " + j + "; hexPos = " + k + "; id.column = " + _rows[i][j][k].column + ", id.row = " + _rows[i][j][k].row;
						trace(res);
						//trace("i = " + i + "; j = " + j + "; k = " + k + ": id.column = " + _rows[i][j][k].column + ", id.row = " + _rows[i][j][k].row);
						for(var l:int = 0; l < _rows[i][j][k].hexCoords.length; l++){
							var str1:String = "group = " + l + ", hexRow = " + _rows[i][j][k].hexCoords[l][0] + ", hexPos = " + _rows[i][j][k].hexCoords[l][1];
							trace(str1);
							if(i == l){
								trace("finding errors...");
								if(j == _rows[i][j][k].hexCoords[l][0]){
									if(k == _rows[i][j][k].hexCoords[l][1]){
										trace("there is no error.");
									}else if(k != _rows[i][j][k].hexCoords[l][1]){
										trace("A!!! -----------------------------------------------------   Error! hexRows are not equal!");
									}

									trace("hexagon row = " + j + ", hexRow = " +  _rows[i][j][k].hexCoords[l][0] + ", hexagon num = " + k + ", hexNum = " + _rows[i][j][k].hexCoords[l][1]);
								}
							}
						}
						trace("");
						

					}
				}
			}
		}
		*/
		/*
		
		private function checkHexagon():void{
			trace("_hexagon.length = " + _hexagon.length);
			for(var i:int = 0; i < _hexagon.length; i++){
				trace("_hexagon[" + i + "].length = " + _hexagon[i].length);
				for(var j:int = 0; j < _hexagon[i].length; j++){
					trace("_hexagon[" + i + "][" + j + "].length = " + _hexagon[i][j].length);
				}
			}
		}
		
		
		private function checkColumns():void{
			trace("checking columns...");
			for(var i:int = 0; i < _columns.length; i++){
				var str:String = "";
				for(var j:int = 0; j < _columns[i].length; j++){
					str += _columns[i][j].column;
					str += " ";
					str += _columns[i][j].row;
					str += "; ";
				}
				trace(str);
			}
		}
		
		private function checkSlopRows():void{
			trace("checking slop rows...");
			for(var i:int = 0; i < _slopRows.length; i++){
				var str:String = "";
				for(var j:int = 0; j < _slopRows[i].length; j++){
					str += _slopRows[i][j].column;
					str += " ";
					str += _slopRows[i][j].row;
					str += "; ";
				}
				trace(str);
			}
		}
		
		private function checkRisingRows():void{
			trace("checking rising rows...");
			for(var i:int = 0; i < _risingRows.length; i++){
				var str:String = "";
				for(var j:int = 0; j < _risingRows[i].length; j++){
					str += _risingRows[i][j].column;
					str += " ";
					str += _risingRows[i][j].row;
					str += "; ";
				}
				trace(str);
			}
		}
		*/
	}
}