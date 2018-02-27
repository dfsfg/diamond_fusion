package cc.wgd.framework_on_starling
{
	import starling.display.Sprite;
	
	public class ScoreBoard extends Sprite
	{
		protected var _scoreElements:Vector.<ScoreElement>;
		protected var _graphicElements:Vector.<GraphicsElement>;
		
		public function ScoreBoard()
		{
			super();
			init();
		}
		
		private function init():void{
			_scoreElements = new Vector.<ScoreElement>;
			_graphicElements = new Vector.<GraphicsElement>;
		}
		
		/**
		 * Adds newly created score element to the score board.
		 * */
		public function addScoreElement(element:ScoreElement):void{
			_scoreElements.push(element);
			this.addChild(element);
		}
		
		/**
		 * Adds newly created graphic element to the score board.
		 * */
		public function addGraphicElement(element:GraphicsElement):void{
			_graphicElements.push(element);
			this.addChild(element);
		}
		
		/**
		 * Updates current value shown by the scoreElement which label is equal to <i>key</i>.
		 * */
		public function update(key:String, value:String):void{
			for(var i:int = 0; i < _scoreElements.length; i++){
				if(_scoreElements[i].label == key){
					_scoreElements[i].setContentText(value);
					break;
				}
			}
			
			for(i = 0; i <_graphicElements.length; i++){
				if(_graphicElements[i].label == key){
					_graphicElements[i].setContentText(value);
					break;
				}
			}
		}
		
		public function runScoreBoard():void{
			// stub to override
		}
		
		public function newLevel():void{
			// stub to override
		}
	}
}