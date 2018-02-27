package assets.layout.abstract
{
	public class AbstractLayout_BG extends AbstractLayoutScalable
	{
		protected var _pos_x:Number;
		
		protected var _pos_y:Number;
		
		public function AbstractLayout_BG()
		{
			super();
		}
		
		public function get pos_x():Number{
			return super.scale_short_displacement_x(_pos_x);
		}
		
		public function get pos_y():Number{
			return super.scale_short_displacement_y(_pos_y);
		}
	}
}