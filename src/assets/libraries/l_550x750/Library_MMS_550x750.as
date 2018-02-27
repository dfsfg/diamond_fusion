package assets.libraries.l_550x750
{
	
	import assets.libraries.abstract.AbstractLibrary_MMS;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	public class Library_MMS_550x750 extends AbstractLibrary_MMS
	{
		public function Library_MMS_550x750(ps:Number)
		{
			super(ps);
		}
		
		override protected function init():void{
			// создаем текстуру для кнопии Play, вызывающую выпадающую панель
			var bitmapDataOriginal:BitmapData = (new assets.libraries.l_550x750.Library.BtnPlay as Bitmap).bitmapData;
			var bitmapDataScaled:BitmapData = super.scaleBitmapData(bitmapDataOriginal);
			_btnPlayTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnHelp as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnHelpTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуру для кнопки Home
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnHome as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnHomeTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем бриллиант, опускающийся сверху
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BlackDiamondMedium as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_diamondTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем название экрана, плавно появляющееся до полной непрозрачности
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.NameMainMenu as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_nameTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуру для рисунка dropDownPanel
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.MainMenuDropDownPanel as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_dropDownPanelTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуру для кнопки возврата
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnBack as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnBackTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуру для кнопки уровней
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnLevelEmpty as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnLevelTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуры для кнопок установки режима игры
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnMode as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnModeTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnModeStrict as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnStrictModeTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnModeZen as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnZenModeTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.BtnHL as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnHighlightTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.MainMenuDDPMode as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_modePanelTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуры для создания значков выполнения заданий на кнопках уровней
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.CupGoldBtn as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_cupGoldBtnTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.CupSilverBtn as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_cupSilverBtnTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.CupBronzeBtn as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_cupBronzeBtnTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.CupFailedBtn as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_cupFailedBtnTexture = Texture.fromBitmapData(bitmapDataScaled);
			
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