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
	 * 	<li><b><i>createDisplayText</i></b> - creates an instance of Starling TextField class and pushes it into <i>_texts</i> vector;</li>
	 * 	<li><b><i>buttonClickListener</i></b> - waits for any button on the screen to be clicked 
	 * 		and dispatches an Starling Event class instance, passing clicked button identifier <i>(e.target as SimpleButton).id</i> into it;</li>
	 * 	<li><b><i>runScreen</i></b> - stub method to override in any child class to run animation on the screen.</li>
	 * </ul>
	 * */	
	public class BasicScreenMod extends Sprite
	{
		// фон экрана, созадваемый по умолчанию при инициализации
		private var _backgroundImage:Image;
		
		/**
		 * массив содержит все кнопки, размещенные на экране
		 * */
		protected var _buttons:Vector.<SimpleButton>;
		
		/**
		 * массив картинок, размещенных на экране
		 * */
		protected var _images:Vector.<Image>;
		
		/**
		 * текстовые поля, размещенные на экране
		 * */
		protected var _texts:Vector.<TextField>;
		
		public function BasicScreenMod()
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
			_buttons.push(tempButton);
		}
		
		/**
		 * Adds specified button to the display list
		 * */
		public function addButtonToDisplayList(num:int):void{
			if((num >= 0) && (num < _buttons.length)){
				_buttons[num].addEventListener(Event.TRIGGERED, buttonClickListener);
				this.addChild(_buttons[num]);
			}else{
				trace("there is no such button in _buttons.<Vectror>...");
			}
		}
		
		/**
		 * Removes specified button from display list
		 * */
		public function removeButtonFromDisplayList(num:int):void{
			if((num >= 0) && (num < _buttons.length)){
				_buttons[num].removeEventListener(Event.TRIGGERED, buttonClickListener);
				this.removeChild(_buttons[num]);
				trace("button number " + num + " was removed...");
			}else{
				trace("there is no such button in _buttons.<Vectror>...");
			}
		}
		
		/**
		 * Returns number of buttons in _buttons.<Vector>
		 * */
		public function numOfButtons():int{
			return _buttons.length;
		}
		
		/**
		 * Creates an instance of Starling Image class and pushes it into <i>_images</i> vector;
		 * */
		public function createImage(xPos:int, yPos:int, texture:Texture):void{
			var tempImage:Image = new Image(texture);
			tempImage.x = xPos;
			tempImage.y = yPos;
			_images.push(tempImage);
		}
		
		/**
		 * Adds specified image to display list
		 * */		
		public function addImageToDisplayList(num:int):void{
			if((num >= 0) && (num < _images.length)){
				this.addChild(_images[num]);
			}else{
				trace("There is no such image in _images.<Vector>....");
			}
		}
		
		/**
		 * Removes specified image from display list
		 * */
		public function removeImageFromDisplayList(num:int):void{
			if((num >= 0) && (num < _images.length)){
				this.removeChild(_images[num]);
				trace("the image number " + num + " was removed...");
			}else{
				trace("There is no such image in _images.<Vector>....");
			}
		}
		
		/**
		 * Returns number of images in _images.<Vector>
		 * */
		public function numOfImages():int{
			return _images.length;
		}
		
		/**
		 * Creates an instance of Starling TextField class and pushes it into <i>_texts</i> vector.
		 * */
		public function createDisplayText(xPos:int, yPos:int, width:Number, height:Number, text:String, fontName:String = "Verdana", fontSize:int = 12, color:uint = 0x000000, bold:Boolean = false):void {
			var textField:TextField = new TextField(width, height, text, fontName, fontSize, color, bold);
			textField.x = xPos;
			textField.y = yPos;
			addChild(textField);
			_texts.push(textField);
		}
		
		/**
		 * Adds specified text to display list
		 * */
		public function addTextToDispalayList(num:int):void{
			if((num >= 0) && (num < _texts.length)){
				this.addChild(_texts[num]);
			}else{
				trace("There is no such text in _texts.<Vector>...");
			}
		}
		
		/**
		 * Removes specified text from display list
		 * */
		public function removeTextFromDisplayList(num:int):void{
			if((num >= 0) && (num < _texts.length)){
				this.removeChild(_texts[num]);
			}else{
				trace("There is no such text in _texts.<Vector>...");
			}
		}
		
		/**
		 * Changes the content of specified text
		 * */
		public function changeText(num:int, textContent:String):void{
			if((num >= 0) && (num < _texts.length)){
				this._texts[num].text = textContent;
			}
		}
		
		/**
		 * Returns number of text elements in _texts.<Vector>
		 * */
		public function numOfTexts():int{
			return _texts.length;
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