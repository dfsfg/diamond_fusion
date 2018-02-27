package cc.wgd.physics.motion
{
	import cc.wgd.physics.math.Vector2D;
	import cc.wgd.physics.objects.Particle;
	
	public class MultiForcer extends Mover
	{
		private var _particles:Array;
		private var _force:Vector2D;
		private var _acc:Vector2D;	
		
		public function MultiForcer(pparticles:Array)
		{
			_particles = pparticles;
			super(null);
		}
		
		public function get force():Vector2D {
			return _force;
		}			
		
		public function set force(pforce:Vector2D):void {
			_force = pforce;
		}		
		
		override protected function moveObject():void{
			for (var i:uint=0; i<_particles.length; i++){
				var particle:Particle = _particles[i];
				particle.pos2D = particle.pos2D.addScaled(particle.velo2D,dt);							
				calcForce(particle);
				_acc = _force.multiply(1/particle.mass);				
				particle.velo2D = particle.velo2D.addScaled(_acc,dt);												
			}
		}
		
		protected function calcForce(pparticle:Particle):void{
			_force = Forces.zeroForce();
		}
	}
}