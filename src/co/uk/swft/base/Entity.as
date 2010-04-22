package co.uk.swft.base
{
	import org.robotlegs.core.IInjector;

	public class Entity
	{
		// protecteds
		protected var _injector : IInjector;
		protected var _components : Vector.<EntityComponent>;				
		
		protected function mapComponent(whenAskedFor:Class) : EntityComponent
		{			
			// Make the instnace
			var component : EntityComponent = new whenAskedFor();
			
			// Map it
			_injector.mapValue(whenAskedFor,component);		
			
			// Store it
			_components.push(component);
			
			// Return it
			return component;
		}		
		
		public function set injector(value:IInjector) : void
		{
			// Set the injector and inject ourselfs first
			_injector =  value;
			_injector.injectInto(this);
			
			// Now tell sub-classes to map any components they are going to use
			_components = new Vector.<EntityComponent>();			
			onMapComponents();	
			
			// Finally inject into those components and tell them to init
			injectIntoComponents();
			initComponents();	
		} 
		
		protected function onMapComponents() : void 
		{
			// Extend and map components here
		}	
		
		protected function injectIntoComponents() : void
		{
			// Inject into all componenets
			for each ( var component : EntityComponent in _components )
			{			
				_injector.injectInto(component);
			}
		}
		
		protected function initComponents() : void
		{
			// Init all componenets
			for each ( var component : EntityComponent in _components )
			{			
				component.onInit();
			}
		}
		
	}
}