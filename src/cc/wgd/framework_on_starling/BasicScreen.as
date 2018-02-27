package cc.wgd.framework_on_starling
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	import starling.textures.Texture;
	
	/**
	 * <h1>Parent class for all the screens used in the game.</h1>
	 * This class declares basic variables and methods which must be used in every screen which should be an instance of the BasicScreen child class.
	 * For example, variable <i>titleScreen</i> should be an instance of the <i>TitleScreen</i> class, variable <i>mainMenuScreen</i> - instance
	 * of the <i>MainMenuScreen</i> class, both of which are childs of BasicScreen class. 
	 * <h2>Variables:</h2>
	 * <ul>
	 * 	<li><b><i>_backgroundImage</i></b> - background image of the screen created by default;</li>
	 * 	<li><b><i>_buttons</i></b> - vector of SimpleButton class instances;<br />This variable is used to hold all the buttons presented on the screen;</li>
	 * 	<li><b><i>_images</i></b> - vector of Starling Image class instances;<br />This variable is used to hold all the images presented on the screen;</li>
	 * 	<li><b><i>_texts</i></b> - vector of Starling TextField class instances;<br /> This variable is used to hold all te texts presented on the screen.</li>
	 * </ul>
	 * <h2>Methods:</h2>
	 * <ul>
	 * 	<li><b><i>createDefaultBackground</i></b> - initialises default background of the game. </li>
	 * 	<li><b><i>createButton</i></b> - creates an instance of SimpleButton class and pushes it into <i>_buttons</i> vector;</li>
	 * 	<li><b><i>createImage</i></b> - creates an instance of Starling Image class and pushes it into <i>_images</i> vector;
	 * 		<b><i> has not been defined yet...</i></b></li>
	 * 	<li><b><i>createDisplayText</i></b> - creates an instance of Starling TextField class and pushes it into <i>_texts</i> vector;</li>
	 * 	<li><b><i>buttonClickListener</i></b> - waits for any button on the screen to be clicked 
	 * 		and dispatches an Starling Event class instance, passing clicked button identifier <i>(e.target as SimpleButton).id</i> into it;</li>
	 * 	<li><b><i>runScreen</i></b> - stub method to override in any child class to run animation on the screen.</li>
	 * </ul>
	 * */
	public class BasicScreen extends Sprite
	{
		// фон экрана, созадваемый по умолчанию при инициализации
		private var _backgroundImage:Image;
		
		/**
		 * массив содержит все кнопки, размещенные на экране
		 * */
		private var _buttons:Vector.<SimpleButton>;
		
		/**
		 * массив картинок, размещенных на экране
		 * */
		private var _images:Vector.<Image>;
		
		/**
		 * текстовые поля, размещенные на экране
		 * */
		private var _texts:Vector.<TextField>;
		
		public function BasicScreen()
		{
			super();
			init();
		}
		
		// инициализация массивов объектов, размещенных на экране
		private function init():void{
			_buttons = new Vector.<SimpleButton>;
			_images = new Vector.<Image>;
			_texts = new Vector.<TextField>;
		}
		
		/**
		 * инициализация фона экрана, используемого по умолчанию; удобно для тестирования альфа-версии игры
		 * */
		public function createDefaultBackground(width:Number, height:Number, isTransparent:Boolean, color:uint):void{
			var bitmapData:BitmapData = new BitmapData(width, height, isTransparent, color);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			var texture:Texture = Texture.fromBitmap(bitmap);
			
			_backgroundImage = new Image(texture);
			this.addChild(_backgroundImage);
		}
		
		/**
		 * Creates an instance of SimpleButton class and pushes it into <i>_buttons</i> vector.
		 * */
		public function createButton(id:int, xPos:int, yPos:int, upState:Texture, text:String="", downState:Texture=null):void{
			var tempButton:SimpleButton = new SimpleButton(id, upState, text, downState);
			tempButton.x = xPos - tempButton.width / 2;
			tempButton.y = yPos - tempButton.height / 2;
			tempButton.addEventListener(Event.TRIGGERED, buttonClickListener);
			_buttons.push(tempButton);
			this.addChild(tempButton);
		}
		
		/**
		 * Creates an instance of Starling Image class and pushes it into <i>_images</i> vector;
		 * */
		public function createImage(xPos:int, yPos:int, texture:Texture):void{
			trace("The createImage method has not been defined yet...");
			var tempImage:Image = new Image(texture);
			tempImage.x = xPos;
			tempImage.y = yPos;
			_images.push(tempImage);
			addChild(tempImage);
		}
		
		/**
		 * Removes from display list the image which was added last.<br />
		 * It is useful when necessary to update levelOverScreen.
		 * */
		public function removeLastImage():void{
			removeChild(_images[_images.length - 1]);
			_images.splice(_images.length - 1, 1);
		}
		
		/**
		 * Creates an instance of Starling TextField class and pushes it into <i>_texts</i> vector.
		 * */
		public function createDisplayText(xPos:int, yPos:int, width:Number, height:Number, text:String, fontName:String = "Verdana", fontSize:int = 12):void {
			var textField:TextField = new TextField(width, height, text, fontName, fontSize);
			textField.x = xPos;
			textField.y = yPos;
			addChild(textField);
			_texts.push(textField);
		}
		
		/**
		 * Waits for any button on the screen to be clicked 
	 * 		and dispatches an Starling Event class instance, passing clicked button identifier <i>(e.target as SimpleButton).id</i> into it.
		 * */
		protected function buttonClickListener(e:Event):void {
			dispatchEvent(new Event(EventType.BUTTON_CLICKED, false, (e.target as SimpleButton).id));
			trace("Attempt to dispatch an event...");
		}
		
		/**
		 * Stub method to override in any child class to run animation on the screen.
		 * */
		public function runScreen():void{
			trace("running...");
		}
	}
}