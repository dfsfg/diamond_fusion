package cc.wgd.framework_on_starling
{
	import flash.display.Bitmap;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFormat;
	import starling.textures.Texture;
	
	/**
	 * <h1>Element of ScoreBoard</h1>
	 * The ScoreElement class instance is used to display current player's score.<br />
	 * It consists of two elements:
	 * <ul>
	 * 	<li><b><i>_label</i></b> - Starling TextField class instance showing text definition of score value;</li>
	 * 	<li><b><i>_content</i></b> - Starling TextField class instance showing current score value.</li>
	 * </ul>
	 * <h2>Construction of the class takes the following parameters:</h2>
	 * <ul>
	 * 	<li><b><i>xPos</i></b> - X-position of the top left corner of the element;</li>
	 * 	<li><b><i>yPos</i></b> - Y-position of the top left corner of the element;</li>
	 * 	<li><b><i>labelText </i></b> - text definition of score value;</li>
	 * 	<li><b><i>labelWidth </i></b> - width of the label showing text definition;</li>
	 * 	<li><b><i>labelHeight </i></b> - height of the element;</li>
	 * 	<li><b><i>bufferWidth </i></b> - gap width between text definition of score and its value;</li>
	 * 	<li><b><i>contentText </i></b> - score value converted to string;</li>
	 * 	<li><b><i>contentWidth </i></b> - width of score value string;</li>
	 * 	<li><b><i>imageBitmap </i></b> - bitmap used as the whole element background; default value is NULL;</li>
	 * 	<li><b><i>fontName </i></b> - font name; default value is "Verdana";</li>
	 * 	<li><b><i>fontSize </i></b> - font size; default value is 14;</li>
	 * 	<li><b><i>fontColor </i></b> - font color; default value is 0x000000 (black);</li>
	 * </ul>
	 * */
	public class ScoreElement extends Sprite
	{
		private var _label:TextField;
		private var _content:TextField;
		private var _image:Image;
		
		public function ScoreElement(xPos:Number, yPos:Number,
									 labelText:String, labelWidth:Number, labelHeight:Number, bufferWidth:Number,
									 contentText:String, contentWidth:Number,
									 imageBitmap:Bitmap = null,
									 fontName:String = "Verdana", fontSize:int = 14, fontColor:int = 0x000000)
		{
			super();
			init(xPos, yPos, labelText, labelWidth, labelHeight, bufferWidth, contentText, contentWidth, imageBitmap, fontName, fontSize, fontColor);
		}
		
		private function init(xPos:Number, yPos:Number,
							  labelText:String, labelWidth:Number, labelHeight:Number, bufferWidth:Number,
							  contentText:String, contentWidth:Number,
							  imageBitmap:Bitmap, fontName:String, fontSize:int, fontColor:int):void{
			
			if(imageBitmap != null){
				var texture:Texture = Texture.fromBitmap(imageBitmap);
				_image = new Image(texture);
				this.addChild(_image);
			}
			var format:TextFormat = new TextFormat(fontName, fontSize, fontColor);
			_label = new TextField(labelWidth, labelHeight, labelText, format);
			_content = new TextField(contentWidth, labelHeight, contentText, format);
			_content.x = labelWidth + bufferWidth;
			this.addChild(_label);
			this.addChild(_content);
			this.x = xPos;
			this.y = yPos;
		}
		
		public function setLabelText(str:String):void{
			_label.text = str;
		}
		
		public function setContentText(str:String):void{
			_content.text = str;
		}
		
		public function get label():String{
			return this._label.text;
		}
	}
}