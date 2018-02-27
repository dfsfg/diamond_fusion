package assets.libraries.l_550x750
{
	import assets.libraries.abstract.AbstractLibrary_SB;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	public class Library_SB_550x750 extends AbstractLibrary_SB
	{
		public function Library_SB_550x750(ps:Number)
		{
			super(ps);
		}
		
		override protected function init():void{
			// создаем текстуру фона табло
			var bitmapDataOriginal:BitmapData = (new Library.ScoreBoardBg as Bitmap).bitmapData;
			var bitmapDataScaled:BitmapData = super.scaleBitmapData(bitmapDataOriginal);
			_bgTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуры для кнопок управления звуком
			bitmapDataOriginal = (new Library.BtnMusicOn as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnMusicOnTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new Library.BtnMusicOff as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnMusicOffTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new Library.BtnSound as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_btnSoundVolumeTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуры для элементов
			_elTextures = new Vector.<Texture>;
			
			bitmapDataOriginal = (new Library.El_0 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			var tempTexture:Texture = Texture.fromBitmapData(bitmapDataScaled);
			_elTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.El_1 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_elTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.El_2 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_elTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.El_3 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_elTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.El_4 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_elTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.El_5 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_elTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.El_6 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_elTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.El_7 as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_elTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.ObstacleGlassSB as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_elTextures.push(tempTexture);
			
			bitmapDataOriginal = (new Library.ObstacleFullSB as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			tempTexture = Texture.fromBitmapData(bitmapDataScaled);
			_elTextures.push(tempTexture);
			
			bitmapDataOriginal = (new assets.libraries.l_550x750.Library.ObstacleFull as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_obstacle_Texture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем изображения выполненного и невыполненного задания			
			bitmapDataOriginal = (new Library.TaskCompleted as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_taskCompletedTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new Library.TaskFailed as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_taskFailedTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем изображение иконки счета			
			bitmapDataOriginal = (new Library.ScoreIcon as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_scoreTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			// создаем текстуры полосы прогресса
			bitmapDataOriginal = (new Library.ProgressBarViewer as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_progressBarViewerTexture = Texture.fromBitmapData(bitmapDataScaled);
			
			bitmapDataOriginal = (new Library.ProgressBarCover as Bitmap).bitmapData;
			bitmapDataScaled = super.scaleBitmapData(bitmapDataOriginal);
			_progressBarCoverTexture = Texture.fromBitmapData(bitmapDataScaled);
			
		}
	}
}