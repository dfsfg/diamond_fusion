package assets.libraries.l_550x750
{
	
	import assets.libraries.abstract.AbstractLibrary_IS;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	public class Library_IS_550x750 extends AbstractLibrary_IS
	{
		public function Library_IS_550x750(ps:Number)
		{
			super(ps);
		}
		
		override protected function init():void{
			// создаем название экрана
			var bitmapDataOriginal:BitmapData = (new assets.libraries.l_550x750.Library.NameInstructions as Bitmap).bitmapData;
			var bitmapDataScaled:BitmapData = super.scaleBitmapData(bitmapDataOriginal);
			_nameTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем изображение выпадающей панели
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.InstructionsPanel as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_dropDownPanelTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем кнопку главного меню
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnMainMenu as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnMainMenuTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуры эффекта сияния кнопки
			_btnEffectTextures = new Vector.<Texture>;
			var tempTexture:Texture;
			
			bitmapDataOriginal = (new Library.BtnGlow0 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_btnEffectTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.BtnGlow1 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_btnEffectTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.BtnGlow2 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_btnEffectTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.BtnGlow3 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_btnEffectTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.BtnGlow4 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_btnEffectTextures.push(tempTexture);
			
			bitmapDataOriginal.dispose();
		}
	}
}