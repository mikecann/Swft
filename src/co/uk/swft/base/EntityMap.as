package co.uk.swft.base
{
	import co.uk.swft.core.IEntity;
	import co.uk.swft.core.IEntityMap;
	
	import org.robotlegs.core.IInjector;
	
	public class EntityMap implements IEntityMap
	{
		protected var _injector:IInjector;
		protected var _entities:Array;
		
		public function EntityMap(injector:IInjector)
		{
			_injector = injector;
			_entities = new Array();
		}
		
		public function createEntity(entityClass:Class):IEntity
		{
			var entity:IEntity = new entityClass();
			var entityInjector:IInjector = _injector.createChild();
			entity.injector = entityInjector;
			entity.mapComponents();
			entityInjector.mapValue(IEntity, entity);
			entityInjector.injectInto(entity);
			registerEntity(entity);
			return entity;
		}
		
		public function registerEntity(entity:IEntity):void
		{
			if (_entities.indexOf(entity) == -1)
			{
				_entities.push(entity);
				entity.onRegister();				
			}
		}
		
		public function removeEntity(entity:IEntity):void
		{
			var index:int = _entities.indexOf(entity);
			if (index > -1)
			{
				_entities.splice(index, 1);
				entity.onDestroy();  // First allow the entity to destroy any references it has
				entity.removeComponents(); // Then destroy all the components in this entity
			}
		}
		
		public function removeEntities():void
		{
			var entity:IEntity;
			while (entity = _entities.pop())
			{
				removeEntity(entity);
			}
		}
	}
}