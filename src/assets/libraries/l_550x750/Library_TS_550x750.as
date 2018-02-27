package assets.libraries.l_550x750
{
	import assets.libraries.abstract.AbstractLibrary_TS;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	public class Library_TS_550x750 extends AbstractLibrary_TS
	{
		public function Library_TS_550x750(ps:Number)
		{
			super(ps);
		}
		
		override protected function init():void{
			// создаем текстуру для кнопки "Старт"
			var bitmapDataOriginal:BitmapData = (new Library.BtnStart as Bitmap).bitmapData;
			var bitmapDataScaled:BitmapData = super.scaleBitmapData(bitmapDataOriginal);
			_btnStartTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуру для бриллианта
			bitmapDataOriginal = (new Library.BlackDiamondBig as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_diamondTexture = Texture.fromBitmapData(bitmapDataScaled); 
			
			// создаем текстуру для названия
			bitmapDataOriginal = (new Library.NameDiamondFusion as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_nameTexture = Texture.fromBitmapData(bitmapDataScaled);
			
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
			
		}
	}
}