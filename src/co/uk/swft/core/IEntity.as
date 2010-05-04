package co.uk.swft.core
{
	import org.robotlegs.core.IInjector;
	
	public interface IEntity
	{
		function set injector(inj:IInjector):void;
		function get injector():IInjector;
		
		function mapComponents():void;
		function registerComponent(component:IEntityComponent):void;
		function unregisterComponent(component:IEntityComponent):void;
		function removeComponents():void;
		
		function onRegister():void;
		function onRemove():void;
	}
}