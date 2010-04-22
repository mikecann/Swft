package co.uk.swft.base
{
	import org.robotlegs.core.IInjector;

	public class EntityMap
	{
		// Protecteds
		protected var _injector : IInjector;
		
		public function EntityMap(injector:IInjector)
		{
			_injector = injector;
		}
		
		public function instantiateEntity(entityClass:Class) : Entity
		{
			var entity : Entity = new entityClass();
			entity.injector = _injector.createChild();
			return entity;
		}
	}
}