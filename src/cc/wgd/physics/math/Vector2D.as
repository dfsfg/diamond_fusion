package cc.wgd.physics.math
{
	import starling.display.Sprite;
	
	public class Vector2D
	{
		private var _x:Number;
		private var _y:Number;		
		public function Vector2D(px:Number,py:Number):void {
			_x = px;
			_y = py;
		}
		public function get x():Number{
			return _x;
		}
		public function set x(px:Number):void{
			_x = px;
		}		
		public function get y():Number{
			return _y;
		}
		public function set y(py:Number):void{
			_y = py;
		}		
		public function get length():Number{
			return Math.sqrt(lengthSquared);
		}
		public function get lengthSquared():Number{
			return _x*_x + _y*_y;
		}	
		public function get angle():Number{
			return Math.atan2(_y,_x);
		}		
		public function clone():Vector2D {
			return new Vector2D(_x,_y);
		}
		public function negate(vec:Vector2D):void {
			_x = - _x;
			_y = - _y;
		}
		public function unit():Vector2D {
			if (length > 0) {
				return new Vector2D(_x/length,_y/length);
			}else{
				return new Vector2D(0,0);
			}
		}		
		public function normalize():Number {
			if (length > 0) {
				_x /= length;
				_y /= length;
			}
			return length;
		}
		public function add(vec:Vector2D):Vector2D {
			return new Vector2D(_x + vec.x,_y + vec.y);
		}
		public function incrementBy(vec:Vector2D):void {
			_x += vec.x;
			_y += vec.y;
		}		
		public function subtract(vec:Vector2D):Vector2D {
			return new Vector2D(_x - vec.x,_y - vec.y);
		}
		public function decrementBy(vec:Vector2D):void {
			_x -= vec.x;
			_y -= vec.y;
		}		
		public function multiply(k:Number):Vector2D {
			return new Vector2D(_x*k,_y*k);
		}		
		public function addScaled(vec:Vector2D,k:Number):Vector2D {
			return new Vector2D(_x + k*vec.x,_y + k*vec.y);
		}		
		public function scaleBy(k:Number):void {
			_x *= k;
			_y *= k;
		}
		public function dotProduct(vec:Vector2D):Number {
			return _x*vec.x + _y*vec.y;
		}
		public function crossProduct(vec:Vector2D):Number {
			return _x*vec.y - _y*vec.x;
		}		
		public function projection(vec:Vector2D):Number {
			var proj:Number;
			if( (length == 0) || ( vec.length == 0) ){
				proj = 0;
			}
			else {
				proj = (_x*vec.x + _y*vec.y)/vec.length;
			}
			return proj;
		}	
		public function project(vec:Vector2D):Vector2D {
			return vec.para(this.projection(vec));
		}			
		public function para(u:Number,positive:Boolean=true):Vector2D{
			var vec:Vector2D = new Vector2D(_x, _y);
			if (positive){
				vec.scaleBy(u/length);
			}else{
				vec.scaleBy(-u/length);				
			}
			return vec;
		}
		public function perp(u:Number,anticlockwise:Boolean=true):Vector2D{
			var vec:Vector2D = new Vector2D(_y, -_x);
			if (length > 0) {
				if (anticlockwise){
					vec.scaleBy(u/length);
				}else{
					vec.scaleBy(-u/length);				
				}
			}else{
				vec=new Vector2D(0,0);
			}	
			return vec;
		}		
		public function rotate(angle:Number):Vector2D{
			return new Vector2D(_x*Math.cos(angle)-_y*Math.sin(angle),_x*Math.sin(angle)+_y*Math.cos(angle));
		}
		
		/*
		public function draw(mc:Sprite,x0:Number=0,y0:Number=0,scale:Number=1,color:uint=0x000000):void{
			var arrow:Arrow = new Arrow(x0,y0,length*scale,angle,color);
			mc.addChild(arrow);
		}
		*/
		static public function distance(vec1:Vector2D,vec2:Vector2D):Number{
			return (vec1.subtract(vec2)).length; 
		}
		static public function angleBetween(vec1:Vector2D,vec2:Vector2D):Number{
			return Math.acos(vec1.dotProduct(vec2)/(vec1.length*vec2.length));
		}
		static public function scale(vec:Vector2D,sca:Number):void{
			vec.x *= sca;
			vec.y *= sca;
		}
		static public function vector2D(mag:Number,angle:Number,clockwise:Boolean=true):Vector2D{
			var vec:Vector2D = new Vector2D(0,0);
			vec.x = mag*Math.cos(angle);
			vec.y = mag*Math.sin(angle);
			if (!clockwise){
				vec.y *= -1;
			}
			return vec;
		}
	}
}