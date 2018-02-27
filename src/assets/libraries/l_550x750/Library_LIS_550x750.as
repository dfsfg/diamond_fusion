package assets.libraries.l_550x750
{
	
	import assets.libraries.abstract.AbstractLibrary_LIS;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	public class Library_LIS_550x750 extends AbstractLibrary_LIS
	{
		public function Library_LIS_550x750(ps:Number)
		{
			super(ps);
		}
		
		override protected function init():void{
			// создаем текстуру для изображения названия экрана
			var bitmapDataOriginal:BitmapData = (new assets.libraries.l_550x750.Library.NameLis as Bitmap).bitmapData;
			var bitmapDataScaled:BitmapData = super.scaleBitmapData(bitmapDataOriginal);
			_nameTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуру для изображения выпадающей панели
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.DdpLis as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_dropDownPanelTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем изображение иконки счета
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.El_0 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_diam_0_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.ScoreIcon as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_scoreIconTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.El_1 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_diam_1_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.El_2 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_diam_2_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.El_3 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_diam_3_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.El_4 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_diam_4_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.El_5 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_diam_5_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.El_6 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_diam_6_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.El_7 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_diam_7_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.ObstacleGlass as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_obstacle_Glass_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.ObstacleFull as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_obstacle_Full_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
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