package assets.layout.l_550x750
{
	import assets.layout.abstract.AbstractLayout_BG;
	
	public class Layout_BG_540x960 extends AbstractLayout_BG
	{
		public function Layout_BG_540x960()
		{
			super();
		}
		
		override protected function init():void{
			_layout_width = this.MEDIUM_WIDTH;
			_layout_height = this.MEDIUM_HEIGHT;
			
			_pos_x = 0;
			_pos_y = 0;
		}
	}
}