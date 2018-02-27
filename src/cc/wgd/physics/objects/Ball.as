package cc.wgd.physics.objects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.GradientType;
	import flash.geom.Matrix;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * <h1>Твердый недеформируемый шар</h1>
	 * <p>Предназначается для работы с фреймворком <b>Starling</b></p>
	 * <p>Класс является наследником класса Particle, предназначенного 
	 * для моделирования основных свойств, описывающих движение классической
	 * материальной точки. Движение точки может осуществляться под воздействием сил различной
	 * природы (гравитации, электростатических сил, и др.)</p>
	 * <p>В отличие от родительского класса, имеет определенные размеры и внешний вид.</p>
	 * <p>
	 * Класс Ball является практически полной копией класса Ball, представленноого в книге<br /> <b> Physics for Flash
	 * Games, Animation and Simulations</b> <i> by Dev Ramtal and Adrian Dobre</i>,<br />
	 * но имеет следующие отличия:<br />
	 * <ul>
	 * <li>наследует класс <b>starling.display.Sprite</b>, а не <b>flash.display.Sprite</b>;</li>
	 * <li>служит для описания движения на плоскости (2D), а не в пространстве (3D).</li>
	 * </ul>
	 * */
	public class Ball extends Particle
	{
		private var _radius:Number;
		private var _color:uint;
		private var _gradient:Boolean;		
		//private var _sprite:Sprite;
		private var _matrix:Matrix;
		
		private var _image:Image;
		
		public function Ball(ptexture:Texture, pradius:Number=20,pcolor:uint=0x0000ff,pmass:Number=1,pcharge:Number=0,pgradient:Boolean=true)
		{
			super();
			init(ptexture, pradius, pcolor, pmass, pcharge, pgradient);
		}
		
		private function init(ptexture:Texture, pradius:Number=20,pcolor:uint=0x0000ff,pmass:Number=1,pcharge:Number=0,pgradient:Boolean=true):void{
			this.mass = pmass;
			this.charge = pcharge;
			if(ptexture != null){
				initFromTexture(ptexture);
			}else{
				initFromBitmap(pradius, pcolor, pmass, pcharge, pgradient);
			}
		}
		
		private function initFromTexture(ptexture:Texture):void{
			_image = new Image(ptexture);
			_image.x = -_image.width / 2;
			_image.y = -_image.height / 2;
			addChild(_image);
		}
		
		private function initFromBitmap(pradius:Number,pcolor:uint,pmass:Number,pcharge:Number,pgradient:Boolean):void{
			_radius = pradius;
			_color = pcolor;
			_gradient = pgradient;
			var sprite:flash.display.Sprite = new flash.display.Sprite();

			with (sprite.graphics){	
				
				if (_gradient){
					//var matrix:Matrix = new Matrix();
					_matrix = new Matrix();
					//_matrix.createGradientBox(_radius, _radius,0,-_radius,-_radius/2);	
					_matrix.createGradientBox(_radius, _radius, 0, _radius / 8, _radius / 4);
					beginGradientFill(GradientType.RADIAL,[0xffffff,_color],[1,1],[0,255],_matrix);
					
				}else{
					beginFill(_color);
				}

				drawCircle(_radius,_radius,_radius);
				endFill();
			}
			
			var bitmapData:BitmapData = new BitmapData(sprite.width, sprite.height, true, pcolor);
			bitmapData.draw(sprite);
			
			var texture:Texture = Texture.fromBitmapData(bitmapData);
			_image = new Image(texture);
			_image.x = -_image.width / 2;
			_image.y = -_image.height / 2;
			addChild(_image);
			
			bitmapData.dispose();
			texture = null;
			sprite = null;
			
		}
	}
}