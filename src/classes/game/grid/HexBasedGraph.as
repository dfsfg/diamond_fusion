package classes.game.grid
{
	//import classes.game.Constants;
	import classes.game.elements.VertexId;
	
	import flash.geom.Point;

	/**
	 * <h1>Расположение элементов на сцене</h1>
	 * Класс задает расположение вершин, в которых находятся элементы, на сцене в виде
	 * двумерного массива, в котором внутренний массив задает расположение вершин
	 * в ветрикальных рядах гексагона, а внешний - сами ряды.
	 * */
	public class HexBasedGraph
	{
		/**
		 * <h1>Массив вершин графа</h1>
		 * Внешний массив содержит столбцы графа, внутренний - элементы
		 * в столбцах.
		 * */
		private var _vertexes:Vector.<Vector.<Vertex>>;
		
		public function HexBasedGraph(pHexagon:Vector.<Vector.<Vector.<VertexId>>>, centerPoint:Point, elementSide:Number)
		{
			init(pHexagon, centerPoint, elementSide);
		}
		
		private function init(pHexagon:Vector.<Vector.<Vector.<VertexId>>>, centerPoint:Point, elementSide:Number):void{
			_vertexes = new Vector.<Vector.<Vertex>>;
			// массив вертикальных рядов гексагона
			var columns:Vector.<Vector.<VertexId>> = pHexagon[0];
			var numCircles:int = (columns.length - 1) / 2;
			// расстояние от центра гексагона до центра угловой вершины
			var d:Number = Math.sqrt(3) * elementSide * numCircles;
			// расстояние от центра гексагона до вертикальной линии, проходящей
			// через центр левой угловой вершины
			var l:Number = 3 * elementSide * numCircles / 2;
			// расстояние от центра гексагона до горизонтальной линии, проходящей
			// через центр верхней левой угловой вершины
			var h:Number = Math.sqrt(3) * elementSide * numCircles / 2;
			
			// координаты нижнего левого элемента
			var xTop:Number = centerPoint.x - l;
			var yTop:Number = centerPoint.y + h;
			// проходим по всем вертикальным рядам
			for(var i:int = 0; i < columns.length; i++){
				// находим начало ряда
				var x0:Number = xTop + 3 * elementSide * i / 2;
				var y0:Number;
				if(i <= (columns.length - 1) / 2){
					//y0 = yTop - Math.sqrt(3) * elementSide * i / 2;
					y0 = yTop + Math.sqrt(3) * elementSide * i / 2;
				}
				else{
					//y0 = yTop - Math.sqrt(3) * elementSide * (columns.length - 1 - i) / 2;
					y0 = yTop + Math.sqrt(3) * elementSide * (columns.length - 1 - i) / 2;
				}
				
				// создаем временный массив вершин
				var tempVerts:Vector.<Vertex> = new Vector.<Vertex>;
				// проходим по всем вершинам текущего вертикального ряда
				for(var j:int = 0; j < columns[i].length; j++){
					// определяем Y-координату текущей вершины
					var yCurrent:Number;
					//yCurrent = y0 + Math.sqrt(3) * elementSide * j;
					yCurrent = y0 - Math.sqrt(3) * elementSide * j;
					
					//trace("new vertex added. x = " + x0 + ", y = " + yCurrent);
					var tempVertId:VertexId = new VertexId(columns[i][j].num_of_row, columns[i][j].num_in_row);
					var tempVertex:Vertex = new Vertex(tempVertId, x0, yCurrent);
					tempVerts.push(tempVertex);
				}
				_vertexes.push(tempVerts);
			}
		}
		
		/**
		 * возвращает массив вершин вертикальных рядов гексагона
		 * */
		public function get vertexes():Vector.<Vector.<Vertex>>{
			return _vertexes;
		}
	}
}