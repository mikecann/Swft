package co.uk.swft.base
{
	import co.uk.swft.core.IGameManager;
	import co.uk.swft.core.IGameManagerMap;
	
	import org.robotlegs.core.IInjector;

	public class GameManagerMap implements IGameManagerMap
	{
		protected var _injector:IInjector;
		protected var _managers:Array;
		
		public function GameManagerMap(injector:IInjector)
		{
			_injector = injector;
			_managers = new Array();
		}
		
		public function mapManager(managerClazz:Class) : void
		{
			var manager : IGameManager = new managerClazz();
			_injector.mapValue(managerClazz,manager);
			_managers.push(manager);
		}
		
		public function mapManagerOf(whenAskedFor:Class,provide:Class) : void
		{
			var manager : IGameManager = new provide();
			_injector.mapValue(whenAskedFor,manager);
			_managers.push(manager);
		}
		
		public function startGame() : void
		{
			// First inject into each manager
			for each (var manager : IGameManager in _managers)
			{
				_injector.injectInto(manager);
			}
			
			// First sort, some managers need to init before others
			_managers.sortOn("priority", Array.NUMERIC | Array.DESCENDING);
			
			// Now loop through each manager and start each one
			for each (var man : IGameManager in _managers)
			{
				man.onGameStartup();
			}
		}
		
		public function startNextLevel() : void
		{
			// Loop through each manager and start the next level
			for each (var man : IGameManager in _managers)
			{
				man.onNextLevel();
			}
		}
	}
}