package classes.screens
{
	import classes.factories.ScreenObjectId;
	import assets.layout.abstract.AbstractLayout_TS;
	
	import flash.geom.Point;
	
	import starling.events.Event;

	/**
	 * <h1>Главный экран игры</h1>
	 * <p>Главный экран игры, появляющийся при ее загрузке. Демонстрирует логотип и название игры,
	 * логотип разработчика и т.д. Является своего рода "начальной точкой входа" в игру. Должен содержать
	 * хотя бы одну кнопку - кнопку входа в игру, но может содержать и другие - кнопки соцсетей, "more games" и т.д.</p>
	 * */
	public class TitleScreenAnimated extends AnimatedScreen
	{
		private const STATE_DIAMOND_APPEAR:int = 0;
		private const STATE_NAME_AND_BUTTON_APPEAR:int = 1;
		private const STATE_READY_APPEAR:int = 3;
		
		private const STATE_DIAMOND_DISAPPEAR:int = 4;
		private const STATE__NAME_AND_BUTTON_DISAPPEAR:int = 5;
		private const STATE_READY_DISAPPEAR:int = 7;
		
		// элементы появляются на экране и исчезают не одновременно. 
		// Переменная показывает, чья очередь появиться или исчезнуть.
		private var _state:int;
		
		//
		private var _layout:AbstractLayout_TS;
		
		public function TitleScreenAnimated()
		{
			super();
			init();
		}
		
		public function set layout(playout:AbstractLayout_TS):void{
			_layout = playout;
		}
		
		private function init():void{
			_state = this.STATE_DIAMOND_APPEAR;
		}
		
		override protected function buttonClickListener(e:Event):void{
			super.buttonClickListener(e);
		}
		
		override protected function prepareScreen():void{
			switch(_state){
				case STATE_DIAMOND_APPEAR:
					appearDiamond();
					break;
				case STATE_NAME_AND_BUTTON_APPEAR:
					appearNameAndButton();
					break;
				case STATE_READY_APPEAR:
					appearReady();
					super.prepareScreen();
					break;
			}
		}

		override protected function executeScreen():void{
			super.executeScreen();
		}
		
		override protected function finalizeScreen():void{
			switch(_state){
				case STATE_DIAMOND_DISAPPEAR:
					disappearDiamond();
					break;
				case STATE__NAME_AND_BUTTON_DISAPPEAR:
					disappearNameAndButton();
					break;
				case STATE_READY_DISAPPEAR:
					disappearReady();
					super.finalizeScreen();
					break;
			}
		}
		
		
		/////////////////////////////////////////////////////////////////////
		//
		//		ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ prepareScreen()
		//
		/////////////////////////////////////////////////////////////////////
		
		private function appearDiamond():void{
			// управляем прозрачностью бриллианта
			var done:Boolean = true;
			for(var i:int = 0; i < _solvents.length; i++){
				_solvents[i].solve();
				if(_solvents[i].isSolving) done = false;
			}
			// когда бриллиант появится полностью, запускаем движение кнопок
			if(done){
				// задаем движение кнопки перехода в гланвое меню
				this.defineAnimatedMovement(ScreenObjectId.BTN_MAIN_MENU, 
					new Point(_layout.btn_main_menu_pos_out_x, _layout.btn_main_menu_pos_out_y), 
					new Point(_layout.btn_main_menu_pos_on_x, _layout.btn_main_menu_pos_on_y), _layout.btn_main_menu_velo);
				// задаем движение названия экнана
				this.defineAnimatedMovement(ScreenObjectId.IMG_TITLE_NAME, 
					new Point(_layout.img_ts_name_pos_out_x, _layout.img_ts_name_pos_out_y), 
					new Point(_layout.img_ts_name_pos_on_x, _layout.img_ts_name_pos_on_y), _layout.img_ts_name_velo);
				// переключаемся в состояние появления кнопок
				_state = this.STATE_NAME_AND_BUTTON_APPEAR;
			}
		}
		
		private function appearNameAndButton():void{
			// управляем движением кнопки и названия экрана
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			// если движение завершено, переключаемся в состояние завершенного движения
			if(done){
				_state = this.STATE_READY_APPEAR;
			}
			
		}
		
		private function appearReady():void{
			// задаем начальные установки исчезновения кнопки и названия
			// задаем движение кнопки перехода в гланвое меню
			this.defineAnimatedMovement(ScreenObjectId.BTN_MAIN_MENU, 
				new Point(_layout.btn_main_menu_pos_on_x, _layout.btn_main_menu_pos_on_y), 
				new Point(_layout.btn_main_menu_pos_out_x, _layout.btn_main_menu_pos_out_y), _layout.btn_main_menu_velo);
			// задаем движение названия экнана
			this.defineAnimatedMovement(ScreenObjectId.IMG_TITLE_NAME, 
				new Point(_layout.img_ts_name_pos_on_x, _layout.img_ts_name_pos_on_y), 
				new Point(_layout.img_ts_name_pos_out_x, _layout.img_ts_name_pos_out_y), _layout.img_ts_name_velo);
			// переключаемся в состояние появления кнопок
			_state = this.STATE__NAME_AND_BUTTON_DISAPPEAR;
		}
		
		//////////////////////////////////////////////////////////////////////////////
		//
		//		ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ finaliseScreen()
		//
		//////////////////////////////////////////////////////////////////////////////
		
		private function disappearDiamond():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _solvents.length; i++){
				_solvents[i].solve();
				if(_solvents[i].isSolving) done = false;
			}
			
			if(done){
				_state = this.STATE_READY_DISAPPEAR;
			}
		}
		
		private function disappearNameAndButton():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false; 
			}
			
			if(done){
				this.defineAnimatedSolvence(ScreenObjectId.IMG_DIAMOND_BIG, _layout.img_diamond_big_transparency_end, 
					_layout.img_diamond_big_transparency_start, -3 * (_layout.img_diamond_big_transparency_step));
				_state = this.STATE_DIAMOND_DISAPPEAR;
			}
		}
		
		private function disappearReady():void{
			this.defineAnimatedSolvence(ScreenObjectId.IMG_DIAMOND_BIG, _layout.img_diamond_big_transparency_start, 
				_layout.img_diamond_big_transparency_end, _layout.img_diamond_big_transparency_step);
			_state = this.STATE_DIAMOND_APPEAR;
		}
	}
}