package assets.libraries.abstract
{
	import starling.textures.Texture;
	
	/**
	 * <h1>Библиотека ресурсов LevelInScreen</h1>
	 * <p>Класс объявляет, но не создает переменные, необходимые для создания LevelInScreen, и методы доступа к этим переменным.</p>
	 * <p>Создание этих переменных осуществляется в одном из классов-наследников специально для конкретного разрешения экрана. </p>
	 * */
	public class AbstractLibrary_LIS extends AbstractLibraryScalable
	{
		/** текстура для изображения бриллианта 0 */
		protected var _diam_0_Texture:Texture;
		
		/** текстура для названия экрана */
		protected var _nameTexture:Texture;
		
		/** текстура для выпадающей панели */
		protected var _dropDownPanelTexture:Texture;
		
		/** текстура для иконки счета */
		protected var _scoreIconTexture:Texture;
		
		/** текстура для изображения бриллианта 1 */
		protected var _diam_1_Texture:Texture;
		
		/** текстура для изображения бриллианта 2 */
		protected var _diam_2_Texture:Texture;
		
		/** текстура для изображения бриллианта 3 */
		protected var _diam_3_Texture:Texture;
		
		/** текстура для изображения бриллианта 4 */
		protected var _diam_4_Texture:Texture;
		
		/** текстура для изображения бриллианта 5 */
		protected var _diam_5_Texture:Texture;
		
		/** текстура для изображения бриллианта 6 */
		protected var _diam_6_Texture:Texture;
		
		/** текстура для изображения бриллианта 7 */
		protected var _diam_7_Texture:Texture;
				
		/** текстура для создания препятствия */
		protected var _obstacle_Glass_Texture:Texture;
		
		/** текстура для создания препятствия */
		protected var _obstacle_Full_Texture:Texture;
		
		/** текстуры для создания эффекта сверкания кнопки */
		protected var _btnEffectTextures:Vector.<Texture>;
		
		public function AbstractLibrary_LIS(ps:Number)
		{
			super(ps);
			init();
		}
		
		protected function init():void{
			trace("*--------------------------ERROR!----------------------------------*");
			trace("Class AbstractLibraryLevelInScreen can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*------------------------------------------------------------------*");
		}
		
		/** возвращает текстуру для бриллианта 8 */
		public function get diam_0_Texture():Texture{
			return _diam_0_Texture;
		}
		
		/** возвращает текстуру для создания названия экрана */
		public function get nameTexture():Texture{
			return _nameTexture;
		}
		
		/** возвращает текстуру для создания выпадающей панели */
		public function get dropDownPanelTexture():Texture{
			return _dropDownPanelTexture;
		}
		
		/** возвращает текстуру для иконки счета */
		public function get scoreIconTexture():Texture{
			return _scoreIconTexture;
		}
		
		/** возвращает текстуру для бриллианта 1 */
		public function get diam_1_Texture():Texture{
			return _diam_1_Texture;
		}
		
		/** возвращает текстуру для бриллианта 2 */
		public function get diam_2_Texture():Texture{
			return _diam_2_Texture;
		}
		
		/** возвращает текстуру для бриллианта 3 */
		public function get diam_3_Texture():Texture{
			return _diam_3_Texture;
		}
		
		/** возвращает текстуру для бриллианта 4 */
		public function get diam_4_Texture():Texture{
			return _diam_4_Texture;
		}
		
		/** возвращает текстуру для бриллианта 5 */
		public function get diam_5_Texture():Texture{
			return _diam_5_Texture;
		}
		
		/** возвращает текстуру для бриллианта 6 */
		public function get diam_6_Texture():Texture{
			return _diam_6_Texture;
		}
		
		/** возвращает текстуру для бриллианта 7 */
		public function get diam_7_Texture():Texture{
			return _diam_7_Texture;
		}
				
		/** возвращает текстуру для создания препятствия */
		public function get obstacle_Glass_Texture():Texture{
			return _obstacle_Glass_Texture;
		}
		
		/** возвращает текстуру для создания препятствия */
		public function get obstacle_Full_Texture():Texture{
			return _obstacle_Full_Texture;
		}
		
		/** возвращает текстуры для создания эффекта сверкания кнопки */
		public function get btnEffectTextures():Vector.<Texture>{
			return _btnEffectTextures;
		}
		
		//////////////////////////////////////////////////////////////////////////////////
		///
		//	ПЕРЕГРУЗКА МЕТОДА БАЗОВОГО КЛАССА ДЛЯ ОЧИСТКИ ПАМЯТИ
		///
		//////////////////////////////////////////////////////////////////////////////////
		override public function clearify():void{
			_nameTexture.dispose();
			_nameTexture = null;
			
			_dropDownPanelTexture.dispose();
			_dropDownPanelTexture = null;
			
			_scoreIconTexture.dispose();
			_scoreIconTexture = null;
			
			_diam_0_Texture.dispose();
			_diam_0_Texture = null;
			
			_diam_1_Texture.dispose();
			_diam_1_Texture = null;
			
			_diam_2_Texture.dispose();
			_diam_2_Texture = null;
			
			_diam_3_Texture.dispose();
			_diam_3_Texture = null;
			
			_diam_4_Texture.dispose();
			_diam_4_Texture = null;
			
			_diam_5_Texture.dispose();
			_diam_5_Texture = null;
			
			_diam_6_Texture.dispose();
			_diam_6_Texture = null;
			
			_diam_7_Texture.dispose();
			_diam_7_Texture = null;
			
			_obstacle_Glass_Texture.dispose();
			_obstacle_Glass_Texture = null;
			
			_obstacle_Full_Texture.dispose();
			_obstacle_Full_Texture = null;
			
			for(var i:int = _btnEffectTextures.length - 1; i >= 0; i--){
				_btnEffectTextures[i].dispose();
				_btnEffectTextures.splice(i, 1);
			}
			_btnEffectTextures = null;
		}
		
	}
}