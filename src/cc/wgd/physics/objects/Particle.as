package cc.wgd.physics.objects
{
	import starling.display.Sprite;
	import flash.geom.Vector3D;
	import cc.wgd.physics.math.Vector2D;
	
	/**
	 * <h1>Материальная точка</h1>
	 * <p>Предназначается для работы с фреймворком <b>Starling</b></p>
	 * <p>
	 * Класс служит для моделирования основных свойств, описывающих движение классической
	 * материальной точки. Движение точки может осуществляться под воздействием сил различной
	 * природы (гравитации, электростатических сил, и др.)</p>
	 * <p>
	 * Класс Particle является практически полной копией класса Particle, представленноого в книге<br /> <b> Physics for Flash
	 * Games, Animation and Simulations</b> <i> by Dev Ramtal and Adrian Dobre</i>,<br />
	 * но имеет следующие отличия:<br />
	 * <ul>
	 * <li>наследует класс <b>starling.display.Sprite</b>, а не <b>flash.display.Sprite</b>;</li>
	 * <li>служит для описания движения на плоскости (2D), а не в пространстве (3D).</li>
	 * </ul> .
	 * */
	public class Particle extends Sprite
	{
		// position: Particle inherits properties x, y, z from Sprite
		// size: Particle inherits properties width, height from Sprite
		
		// position components defined to Number precision
		private var _x:Number;
		private var _y:Number;
		//private var _z:Number;
		// velocity components
		private var _vx:Number=0;
		private var _vy:Number=0;
		//private var _vz:Number=0;
		// position vector
		private var _pos:Vector3D;
		private var _pos2D:Vector2D;		
		// velocity vector
		private var _velo:Vector3D;
		private var _velo2D:Vector2D;		
		// mass
		private var _mass:Number;
		// charge
		private var _charge:Number;	
		//angular displacement in radians
		private var _theta:Number=0;		
		// angular velocity in radians per second
		private var _omega:Number=0;		
		// lifetime and age
		private var _lifetime:Number=1e10;
		private var _age:Number=0;
		// for motion
		
		public function Particle()
		{
			super();
		}
		
		public function get mass():Number{
			return _mass;
		}
		public function set mass(pmass:Number):void{
			_mass = pmass;
		}	
		public function get charge():Number{
			return _charge;
		}
		public function set charge(pcharge:Number):void{
			_charge = pcharge;
		}		
		public function get xpos():Number{
			return _x;
		}
		public function set xpos(px:Number):void{
			_x = px;
			x = _x;
		}		
		public function get ypos():Number{
			return _y;
		}
		public function set ypos(py:Number):void{
			_y = py;
			y = _y;
		}
		
		/*
		public function get zpos():Number{
			return _z;
		}
		public function set zpos(pz:Number):void{
			_z = pz;
			z = _z;
		}
		*/
		public function get vx():Number{
			return _vx;
		}
		public function set vx(pvx:Number):void{
			_vx = pvx;
		}
		public function get vy():Number{
			return _vy;
		}
		public function set vy(pvy:Number):void{
			_vy = pvy;
		}
		/*
		public function get vz():Number{
			return _vz;
		}
		public function set vz(pvz:Number):void{
			_vz = pvz;
		}
		*/
		public function get angDispl():Number{
			return _theta;
		}
		public function set angDispl(ptheta:Number):void{
			_theta = ptheta;
			this.rotation = ptheta*180/Math.PI;
		}			
		public function get angVelo():Number{
			return _omega;
		}
		public function set angVelo(pomega:Number):void{
			_omega = pomega;
		}			
		
		public function get lifetime():Number{
			return _lifetime;
		}
		public function set lifetime(plifetime:Number):void{
			_lifetime = plifetime;
		}		
		public function get age():Number{
			return _age;
		}
		public function set age(page:Number):void{
			_age = page;
		}		
		
		//		public function clone():Particle {
		//			return new Particle(_mass,_charge);
		//		}
		
		/*
		public function get pos():Vector3D{
			return new Vector3D(_x,_y,_z);
		}
		public function set pos(ppos:Vector3D):void{			
			_x = ppos.x;
			_y = ppos.y;
			_z = ppos.z;
			x = _x;
			y = _y;				
			z = _z;
		}
		*/
		public function get pos2D():Vector2D{
			return new Vector2D(_x,_y);
		}
		public function set pos2D(ppos:Vector2D):void{
			_x = ppos.x;
			_y = ppos.y;
			x = _x;
			y = _y;				
		}	
		/*
		public function get velo():Vector3D{
			return new Vector3D(_vx,_vy,_vz);
		}
		public function set velo(pvelo:Vector3D):void{
			_vx = pvelo.x;
			_vy = pvelo.y;
			_vz = pvelo.z;			
		}
		*/
		public function get velo2D():Vector2D{
			return new Vector2D(_vx,_vy);
		}
		public function set velo2D(pvelo2D:Vector2D):void{
			_vx = pvelo2D.x;
			_vy = pvelo2D.y;
		}		
		
		/*
		public function move(ptimestep:Number=20,psteps:Number=0):void{		
			_mover = new Mover(this);
			_mover.startTime(ptimestep,psteps);			
		}
		public function pause():void{
			if (_mover){
				_mover.stopTime();
			}
		}		
		public function resume():void{
			if (_mover){			
				_mover.startTime();
			}
		}		
		public function stop():void{
			if (_mover){
				_mover.killTime();
				_mover = null;
			}
		}
		*/
	}
}