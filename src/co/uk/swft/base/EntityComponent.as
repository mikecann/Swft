package co.uk.swft.base
{
	import co.uk.swft.core.IEntity;
	import co.uk.swft.core.IEntityComponent;

	public class EntityComponent implements IEntityComponent
	{
		[Inject]
		public var entity:IEntity;
		
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
	}
}