package cc.wgd.framework_on_starling
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFormat;
	import starling.textures.Texture;
	
	/**
	 * <h1>Graphic Element of Scoreboard</h1>
	 * <p>Элемент служит для визуального представления прогресса выполнения единичного задания текущего уровня.
	 * Содержит следующие переменные:
	 * <ul>
	 * <li><b><i>_taskImage</i></b> - графическое представление текущего единичного задания;</li>
	 * <li><b><i>_completedImage</i></b> - значок выполнения текущего единичного задания;</li>
	 * <li><b><i>_failedImage</i></b> - значок невыполнения текущего единичного задания;</li>
	 * <li><b><i>_content</i></b> - текстовое представление прогресса выполнения текущего единичного задания.</li>
	 * </ul>
	 * </p>
	 * <p></p>
	 * */
	public class GraphicsElement extends Sprite
	{
		// identifier
		private var _labelId:String;
		
		// graphics
		private var _taskImage:Image;
		private var _completedImage:Image;
		private var _failedImage:Image;
		
		// text content
		private var _content:TextField;
		
		public function GraphicsElement(xPos:Number, yPos:Number, labelId:String,
									   taskTexture:Texture, completedTexture:Texture, failedTexture:Texture, bufferWidth:Number,
									   contentText:String, contentWidth:Number, contentHeight:Number,
									   fontName:String = "Verdana", fontSize:int = 14, fontColor:int = 0x000000)
		{
			super();
			init(xPos, yPos, labelId, taskTexture, completedTexture, failedTexture, bufferWidth, contentText,
				contentWidth, contentHeight, fontName, fontSize, fontColor);
		}
		
		private function init(xPos:Number, yPos:Number, labelId:String,
							  taskTexture:Texture, completedTexture:Texture, failedTexture:Texture, bufferWidth:Number,
							  contentText:String, contentWidth:Number, contentHeight:Number,
							  fontName:String = "Verdana", fontSize:int = 14, fontColor:int = 0x000000):void{
			// изображение текущего задания
			_taskImage = new Image(taskTexture);
			addChild(_taskImage);
			
			// изображение выполнения задания
			_completedImage = new Image(completedTexture);
			//_completedImage.x = _taskImage.width / 2 - _completedImage.width / 2;
			_completedImage.x = _taskImage.width + contentWidth + bufferWidth;
			_completedImage.y = _taskImage.height / 2 - _completedImage.height / 2;
			
			// изображение проваленного задания
			_failedImage = new Image(failedTexture);
			//_failedImage.x = _taskImage.width / 2 - _failedImage.width / 2;
			_failedImage.x = _taskImage.width + contentWidth + bufferWidth;
			_failedImage.y = _taskImage.height / 2 - _failedImage.height / 2;
			
			_labelId = labelId;
			
			var format:TextFormat = new TextFormat(fontName, fontSize, fontColor);
			_content = new TextField(contentWidth, contentHeight, contentText, format);
			_content.x = _taskImage.width + bufferWidth;
			_content.y = (_taskImage.height - contentHeight) / 2;
			_content.text = contentText;
			addChild(_content);
			
			this.x = xPos;
			this.y = yPos;
			
		}
		
		/** отмечает выполнение текущего задания */
		public function completeTask():void{
			addChild(_completedImage);
		}
		
		/** отмечает невыполнение текущего задания */
		public function failTask():void{
			addChild(_failedImage);
		}
		
		/** обновляет текстовую информацию о текущем состоянии хода выполнения задания */
		public function setContentText(str:String):void{
			_content.text = str;
		}
		
		/**
		 * возвращает идентификатор элемента при необходимости обновления
		 * */
		public function get label():String{
			return _labelId;
		}
		
		public function clearify():void{
			removeChild(_content);
			removeChild(_taskImage);
			if(_completedImage.parent) removeChild(_completedImage);
			if(_failedImage.parent) removeChild(_failedImage);
			
			_content.dispose();
			_taskImage.dispose();
			_completedImage.dispose();
			_failedImage.dispose();
		}
	}
}