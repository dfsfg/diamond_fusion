package classes.game.elements
{
	/**
	 * <h1>Элемент в связанном списке с древовидной структурой.</h1>
	 * <p>Используется для представления групп удаляемых элементов и позволяет определить бонусный элемент.
	 * Экземпляр класса содержит следующие переменные:
	 * <ul>
	 * <li><i>_current:Element</i> - ссылка на текущий элемент-бриллиант;</li>
	 * <li><i>_previous:TreeNode</i> - ссылка на предыдущий узел в списке-дереве;</li>
	 * <li><i>_nexts:Vector.<TreeNode></i> - ссылка на массив следующих узлов в списке-дереве, которых может быть несколько
	 * по причине древовидной структуры.</li>
	 * </ul>
	 * </p>
	 * <p>Такая структура обладает тем преимуществом перед линейным массивом, что позволяет создать группу, состоящую из нескольких
	 * пересекающихся линейных групп. При этом элемент, находящийся на пересечении линейных групп,
	 * становится бонусным, причем степень бонусности определяет количество непосредственно следующих за ним узлов дерева (_nexts.length).</p>
	 * <p><b>NB!</b> Необходимо отметить, что среди элементов в простейшей 3-элементной группе первые два так же имеют по одному следующему
	 * за ними узлу, однако для них степень бонусности равна 0. <i>(Что делать, таковы правила игры!)</i> Исключением из этого правила является линейная группа,
	 * содержащая 4 или 5 элементов. Для 3-го элемента такой группы степень бонусности равна 1. <i>(И снова - таковы правила! :))</i></p>
	 * */
	public class TreeNode
	{
		private var _current:Element;
		private var _previous:TreeNode;
		private var _nexts:Vector.<TreeNode>;
		
		public function TreeNode(el:Element)
		{
			init(el);
		}
		
		private function init(el:Element):void{
			_current = el;
			_previous = null;
			_nexts = new Vector.<TreeNode>;
		}
		
		public function createNextNode(el:Element):void{
			var nextNode:TreeNode = new TreeNode(el);
			nextNode.previous = this;
			this.nexts.push(nextNode);
		}
		
		public function get current():Element{
			return _current;
		}
		
		public function get previous():TreeNode{
			return _previous;
		}
		
		public function set previous(pnode:TreeNode):void{
			_previous = pnode;
		}
		
		public function get nexts():Vector.<TreeNode>{
			return _nexts;
		}
		
		public function dispose():void{
			for(var i:int = this._nexts.length - 1; i >= 0; i--){
				this._nexts.splice(i, 1);
			}
			this._nexts = null;
			this._previous = null;
			this._current = null;
		}
	}
}