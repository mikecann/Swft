package co.uk.swft.base
{
	import co.uk.swft.core.IEntity;
	
	import org.robotlegs.core.IInjector;

	public class EntityMap
	{
		// Protecteds
		protected var _injector : IInjector;
		
		public function EntityMap(injector:IInjector)
		{
			_injector = injector;
		}
		
		public function instantiateEntity(entityClass:Class) : IEntity
		{
			var entity : IEntity = new entityClass();
			entity.injector = _injector.createChild();
			entity.mapComponents();
			entity.injector.injectInto(entity);
			return entity;
		}
	}
}