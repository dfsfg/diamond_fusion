package assets.libraries.l_550x750
{
	
	import assets.libraries.abstract.AbstractLibrary_LOS;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	public class Library_LOS_550x750 extends AbstractLibrary_LOS
	{
		public function Library_LOS_550x750(ps:Number)
		{
			super(ps);
		}
		
		override protected function init():void{
			// создаем текстуру для изображения названия экрана
			var bitmapDataOriginal:BitmapData = (new assets.libraries.l_550x750.Library.NameLcs as Bitmap).bitmapData;
			var bitmapDataScaled:BitmapData = super.scaleBitmapData(bitmapDataOriginal);
			_nameCompletedTexture = Texture.fromBitmapData(bitmapDataScaled);			
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.NameLps as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_namePassedTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.NameLfs as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_nameFailedTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуру для изображения выпадающей панели
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.DdpLos as Bitmap).bitmapData;
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
			
			// cups
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.CupGold as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_cupGoldTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.CupSilver as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_cupSilverTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.CupBronze as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_cupBronzeTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.CupFailed2 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_cupFailedTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnNext as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnContinueTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnRetry as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnRetryTexture = Texture.fromBitmapData(bitmapDataScaled);
			
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
			
		}
	}
}