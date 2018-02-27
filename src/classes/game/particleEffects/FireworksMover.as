package classes.game.particleEffects
{	
	import cc.wgd.physics.math.Vector2D;
	import cc.wgd.physics.motion.Forces;
	import cc.wgd.physics.motion.MultiForcer;
	import cc.wgd.physics.objects.Ball;
	import cc.wgd.physics.objects.Particle;
	
	import starling.display.Sprite;
	
	public class FireworksMover extends MultiForcer
	{
		private var _sprite:Sprite;
		private var _particles:Array = new Array();
		private var _maxParticles:uint = 200;
		private var _g:Number = 10;
		private var _k:Number = 0.005;
		private var _vx:Number = 4;
		private var _vy:Number = -2;
		
		// number of sparks per explosion
		private var _numSparks:uint = 10;
		// minimum and maximum lifetime of sparks in seconds
		private var _minLife:Number = 2;
		private var _maxLife:Number = 4;
		// maximum duration of fireworks in seconds
		private var _duration:Number = 5;
		
		private var _isCompleted:Boolean = false;
		
		public function FireworksMover(psprite:Sprite, px0:Number = 0, py0:Number = 0)
		{
			_sprite = psprite;
			var x0:Number = px0;	// _sprite.stage.stageWidth / 2;
			var y0:Number = py0;	//_sprite.stage.stageHeight / 2;
			super(_particles);
			createNewParticles(new Vector2D(x0, y0), 0xffff00);
			//trace("_particles.lenght = " + _particles.length);
		}
		
		override protected function calcForce(pparticle:Particle):void{
			var gravity:Vector2D = Forces.constantGravity(pparticle.mass, _g);
			var drag:Vector2D = Forces.drag(_k, pparticle.velo2D);
			force = Forces.add([gravity, drag]);
		}
		
		override protected function moveObject():void{
			//super.moveObject();
			for (var i:uint=0; i<_particles.length; i++){
				var particle:Particle = _particles[i];
				particle.pos2D = particle.pos2D.add(particle.velo2D);							
				//calcForce(particle);
				//_acc = _force.multiply(1/particle.mass);				
				//particle.velo2D = particle.velo2D.addScaled(_acc,dt);												
			}
			limitParticles();
			ageParticles();
			checkCompleted();
		}
		
		private function createNewParticles(ppos:Vector2D, pcol:uint):void{
			for(var i:uint = 0; i < _numSparks; i++){
				var rc:Number = Math.random();
				var newBall:Ball = new Ball(null, 3, pcol * rc, 1, 0, false);
				newBall.pos2D = ppos;
				newBall.velo2D = new Vector2D((Math.random() - 0.5) * _vx, (Math.random() - 0.5) * _vy);
				newBall.lifetime = _minLife + (_maxLife - _minLife) * Math.random();
				_sprite.addChild(newBall);
				_particles.push(newBall);
			}
		}
		
		private function limitParticles():void{
			if(_particles.length > _maxParticles){
				_sprite.removeChild(_particles[0]);
				_particles.shift();
			}
		}
		
		private function ageParticles():void{
			for(var i:uint = 0; i < _particles.length; i++){
				var particle:Ball= _particles[i];
				particle.age += dt;
				particle.alpha += -0.005;
				if(particle.age > particle.lifetime){
					if(time < _duration){
						explode(particle);
					}
					removeParticle(particle, i);
				}
			}
		}
		
		private function explode(pparticle:Particle):void{
			createNewParticles(pparticle.pos2D, 0x00ff00);
		}
		
		private function checkCompleted():void{
			if(time > _duration){
				
				_isCompleted = true;
			}
		}
		
		private function removeParticle(pparticle:Particle, pnum:uint):void{
			_sprite.removeChild(pparticle);
			_particles.splice(pnum, 1);
		}
		
		public function get completed():Boolean{
			return _isCompleted;
		}
		
		
		public function runFirework():void{
			moveObject();
		}
		
		override protected function spinObject():void{
			// do nothing
		}
		

	}
}