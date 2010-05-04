package co.uk.swft.base
{
	import co.uk.swft.core.IEntity;
	import co.uk.swft.core.IEntityComponent;
	import co.uk.swft.core.IEntityMap;
	
	import org.robotlegs.core.IInjector;
	
	public class Entity implements IEntity
	{
		[Inject]
		public var entityMap:IEntityMap;
		
		protected var _injector:IInjector;
		protected var _components:Array;
		
		public function Entity()
		{
			_components = new Array();
		}
		
		public function set injector(value:IInjector):void
		{
			_injector = value;
		}
		
		public function get injector():IInjector
		{
			return _injector;
		}
		
		public function registerComponent(component:IEntityComponent):void
		{
			if (_components.indexOf(component) == -1)
			{
				_components.push(component);
				component.onRegister();
			}
		}
		
		public function unregisterComponent(component:IEntityComponent):void
		{
			var index:int = _components.indexOf(component);
			if (index > -1)
			{
				_components.splice(index, 1);
				component.onRemove();
			}
		}
		
		public function removeComponents():void
		{
			var component:IEntityComponent;
			while (component = _components.pop())
				component.onRemove();
		}
		
		public function mapComponents():void
		{
			// HOOK: override
		}
		
		public function onRegister():void
		{
			// HOOK: override
		}
		
		public function onRemove():void
		{
			// HOOK: override
			removeComponents();
		}
	}
}