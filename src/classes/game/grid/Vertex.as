package classes.game.grid
{
	import classes.game.elements.VertexId;
	/**
	 * <h1>Размещение на сцене элемента матрицы</h1>
	 * Класс определяет соответствие между уникальным идентификатором элемента
	 * и его физическими координатами на сцене в состоянии покоя.
	 * */
	public class Vertex
	{
		private var _vertexId:VertexId;
		private var _xpos:Number;
		private var _ypos:Number;
		
		public function Vertex(pVertId:VertexId, px:Number, py:Number)
		{
			init(pVertId, px, py);
		}
		
		private function init(pVertId:VertexId, px:Number, py:Number):void{
			_vertexId = new VertexId(pVertId.num_of_row, pVertId.num_in_row);
			_xpos = px;
			_ypos = py;
		}
		
		/**
		 * возвращает уникальный идентификатор вершины гексагона
		 * */
		public function get vertexId():VertexId{
			return _vertexId;
		}
		
		/**
		 * возвращает X-координату вершины гексагона
		 * */
		public function get xpos():Number{
			return _xpos;
		}
		
		/**
		 * возвращает Y-координату вершины гексагона
		 * */
		public function get ypos():Number{
			return _ypos;
		}
	}
}