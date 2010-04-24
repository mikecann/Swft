package co.uk.swft.base
{
	import co.uk.swft.core.IEntity;
	
	import org.robotlegs.core.IInjector;

	public class Entity implements IEntity
	{
		protected var _injector : IInjector;
		
		public function set injector(value:IInjector) : void
		{
			_injector = value;
		}
		
		public function get injector() : IInjector
		{
			return _injector;
		}
		
		public function mapComponents() : void
		{
			// Injector is ready, map injections here
		}
	}
}