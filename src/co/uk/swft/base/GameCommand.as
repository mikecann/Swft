package co.uk.swft.base
{
	import org.robotlegs.core.ISignalCommandMap;

	public class GameCommand
	{
		[Inject] public var signalCommandMap : ISignalCommandMap;
		[Inject] public var entityMap : EntityMap;
		
		public function execute() : void 
		{
		}
	}
}