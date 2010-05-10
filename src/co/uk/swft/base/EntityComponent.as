package co.uk.swft.base
{
	import co.uk.swft.core.IEntity;
	import co.uk.swft.core.IEntityComponent;

	public class EntityComponent implements IEntityComponent
	{		
		// Protecteds
		protected var _entity : IEntity;
		
		[PostConstruct]
		public function init():void
		{
			entity.registerComponent(this);
		}
		
		public function onRegister():void
		{
			// HOOK: override
		}
		
		public function onRemove():void
		{
			// HOOK: override
		}
		
		[Inject]
		public function set entity(value:IEntity) : void { _entity=value;  }
		public function get entity() : IEntity { return _entity; }
	}
}