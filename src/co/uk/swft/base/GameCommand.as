package co.uk.swft.base
{
	import co.uk.swft.core.IEntityMap;
	
	import org.robotlegs.core.ISignalCommandMap;

	public class GameCommand
	{
		[Inject] public var signalCommandMap : ISignalCommandMap;
		[Inject] public var entityMap : IEntityMap;
		
		public function execute() : void 
		{
		}
	}
}