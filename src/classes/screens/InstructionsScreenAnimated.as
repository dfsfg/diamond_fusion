package classes.screens
{
	import cc.wgd.framework_on_starling.BasicScreenExtended;
	
	import classes.factories.ScreenObjectId;
	import assets.layout.abstract.AbstractLayout_IS;
	
	import flash.geom.Point;

	public class InstructionsScreenAnimated extends AnimatedScreen
	{
		private var _layout:AbstractLayout_IS;
		
		public function InstructionsScreenAnimated()
		{
			super();
		}
		
		public function set layout(playout:AbstractLayout_IS):void{
			_layout = playout;
		}
		
		override protected function prepareScreen():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			if(done){
				defineDisappearMovement();
				switchScreenState(BasicScreenExtended.STATE_EXECUTE);
			}
		}
		
		override protected function finalizeScreen():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			if(done){
				defineAppearMovement();
				super.finalizeScreen();
			}
		}
		
		private function defineAppearMovement():void{
			this.defineAnimatedMovement(ScreenObjectId.IMG_IS_NAME, 
				new Point(_layout.img_is_name_pos_out_x, _layout.img_is_name_pos_out_y),
				new Point(_layout.img_is_name_pos_on_x, _layout.img_is_name_pos_on_y), _layout.img_is_name_velo);
			
			this.defineAnimatedMovement(ScreenObjectId.IMG_IS_DDP,
				new Point(_layout.img_is_ddp_pos_out_x, _layout.img_is_ddp_pos_out_y),
				new Point(_layout.img_is_ddp_pos_on_x, _layout.img_is_ddp_pos_on_y), _layout.img_is_ddp_velo);
			
			this.defineAnimatedMovement(ScreenObjectId.BTN_MAIN_MENU,
				new Point(_layout.btn_main_menu_pos_out_x, _layout.btn_main_menu_pos_out_y),
				new Point(_layout.btn_main_menu_pos_on_x, _layout.btn_main_menu_pos_on_y), _layout.btn_main_menu_velo);
		}
		
		private function defineDisappearMovement():void{
			this.defineAnimatedMovement(ScreenObjectId.IMG_IS_NAME, 
				new Point(_layout.img_is_name_pos_on_x, _layout.img_is_name_pos_on_y),
				new Point(_layout.img_is_name_pos_out_x, _layout.img_is_name_pos_out_y), _layout.img_is_name_velo);
			
			this.defineAnimatedMovement(ScreenObjectId.IMG_IS_DDP,
				new Point(_layout.img_is_ddp_pos_on_x, _layout.img_is_ddp_pos_on_y),
				new Point(_layout.img_is_ddp_pos_out_x, _layout.img_is_ddp_pos_out_y), _layout.img_is_ddp_velo);
			
			this.defineAnimatedMovement(ScreenObjectId.BTN_MAIN_MENU,
				new Point(_layout.btn_main_menu_pos_on_x, _layout.btn_main_menu_pos_on_y),
				new Point(_layout.btn_main_menu_pos_out_x, _layout.btn_main_menu_pos_out_y), _layout.btn_main_menu_velo);
		}
	}
}