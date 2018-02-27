package assets.libraries.abstract
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	
	import starling.textures.ConcreteTexture;
	import starling.textures.Texture;

	/**
	 * <h1>Абстрактный базовый класс для всех библиотек ресурсов</h1>
	 * <p>Класс предназначен для масштабирования графических ресурсов в соответствии
	 * с разрешением экрана.</p>
	 * <p>Содержит одну переменную:
	 * <ul><li><i>_scale:Number</i> - масштаб ресурса.</li></ul></p>
	 * <p>... и один метод:
	 * <ul><li><i>scaleBitmapData(pbitmap:BitmapData):BitmapData</i> - осуществляет масштабирование ресурса на стадии его создания.</li></ul>
	 * </p>
	 * <p>
	 * Данный метод используется в классе-наследнике, <i>реализующем</i> создание графических ресурсов. Одним из таких классов
	 * является, например, класс <i>Library_TS_550x750</i> - прямой наследник класса <i>AbstractLibrary_TS</i> - непосредственного
	 * наследника данного класса <i>AbstractLibraryScalable</i>
	 * <p>
	 * */
	public class AbstractLibraryScalable
	{
		/** масштаб */
		protected var _scaleFactor:Number;
		
		public function AbstractLibraryScalable(ps:Number)
		{
			initScale(ps);
		}
		
		private function initScale(ps:Number):void{
			_scaleFactor = ps;
		}
		
		/** создание масштабированного объекта <i>BitmapData</i>, как возвращаемого библиотекой,
		 * так и используемого библиотекой при создании других ресурсов. */
		protected function scaleBitmapData(pbd:BitmapData):BitmapData{
			// возвращаемый объект
			var bitmapData:BitmapData;
			// размеры возвращаемого объекта
			var bitmapDataWidth:Number = pbd.width * _scaleFactor;
			var bitmapDataHeight:Number = pbd.height * _scaleFactor;
			// создаем новый объект BitmapData с новыми размерами и сторой прозрачностью
			bitmapData = new BitmapData(bitmapDataWidth, bitmapDataHeight, true, 0x000000);
			// Создаем матрицу преобразований, с помощью которой будет происходить
			// масштабирование растрового изображения
			var matrix:Matrix = new Matrix();
			matrix.scale(_scaleFactor, _scaleFactor);
			// переносим масштабированное растровое изображение в новый объект BitmapData
			bitmapData.draw(pbd, matrix, null, null, null, true);
			// возвращаем созданное масштабированное растровое изображение
			return bitmapData;
		}
		
		/** освобождение памяти, занятой ресурсами библиотеки */
		public function clearify():void{
			// stub to override
		}
		
	}
}