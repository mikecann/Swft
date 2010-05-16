package co.uk.swft.base
{
	import co.uk.swft.core.IEntity;
	import co.uk.swft.core.IEntityComponent;
	
	import org.osflash.signals.Signal;

	public class EntityComponent implements IEntityComponent
	{		
		// Protecteds
		protected var _entity : IEntity;
		protected var _signals : Array;
		
		[PostConstruct]
		public function init():void
		{
			entity.registerComponent(this);
		}
	
		public function registerSignal(signal:Signal) : Signal
		{
			if (!_signals){ _signals=[]; }
			_signals.push(signal);
			return signal;
		}
		
		public function removeSignals() : void
		{
			for each (var signal : Signal in _signals)
			{
				signal.removeAll();
				signal = null;
			}
		}
		
		public function onRegister():void
		{
			// HOOK: override
		}
		
		public function onRemove():void
		{
			// HOOK: override
			removeSignals();
		}
		
		[Inject]
		public function set entity(value:IEntity) : void { _entity=value;  }
		public function get entity() : IEntity { return _entity; }
	}
}