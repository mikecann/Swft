package co.uk.swft.base
{
	import co.uk.swft.core.IGameManager;
	
	import org.robotlegs.mvcs.Actor;

	public class GameManager extends Actor implements IGameManager
	{
		public function GameManager()
		{
		}
		
		public function onGameStartup() : void
		{
			// HOOK: Override this
		}
		
		public function onNextLevel() : void
		{
			// HOOK: Override this
		}
		
		public function onGameShutdown() : void
		{
			// HOOK: Override this
		}
		
		public function get priority() : int { return 0; } // Default priority
	}
}