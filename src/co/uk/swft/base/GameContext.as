package co.uk.swft.base
{
	import co.uk.swft.core.IEntityMap;
	import co.uk.swft.core.IGameManagerMap;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.SignalCommandMap;
	import org.robotlegs.core.IMediatorMap;
	import org.robotlegs.core.ISignalCommandMap;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.lazy.LazyMediatorMap;
	
	public class GameContext extends Context
	{
		protected var _entityMap:IEntityMap;
		protected var _gameManagerMap:IGameManagerMap;
		protected var _signalCommandMap:ISignalCommandMap;
		
		public function GameContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		public function get entityMap():IEntityMap
		{
			return _entityMap ||= new EntityMap(injector);
		}
		
		public function set entityMap(value:IEntityMap):void
		{
			_entityMap = value;
		}
		
		public function get gameManagerMap():IGameManagerMap
		{
			return _gameManagerMap ||= new GameManagerMap(injector);
		}
		
		public function set gameManagerMap(value:IGameManagerMap):void
		{
			_gameManagerMap = value;
		}
		
		public function get signalCommandMap():ISignalCommandMap
		{
			return _signalCommandMap ||= new SignalCommandMap(injector);
		}
		
		public function set signalCommandMap(value:ISignalCommandMap):void
		{
			_signalCommandMap = value;
		}
		
		override protected function get mediatorMap():IMediatorMap
		{
			return _mediatorMap ||= new LazyMediatorMap(contextView, injector, reflector);
		}
		
		override protected function mapInjections():void
		{
			super.mapInjections();
			injector.mapValue(ISignalCommandMap, signalCommandMap);
			injector.mapValue(IEntityMap, entityMap);
			injector.mapValue(IGameManagerMap, gameManagerMap);
		}
	}
}