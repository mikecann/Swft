package co.uk.swft.core
{
	import org.robotlegs.core.IInjector;

	public interface IEntity
	{
		function set injector(inj:IInjector) : void;
		function get injector() : IInjector;
		function mapComponents() : void;
	}
}