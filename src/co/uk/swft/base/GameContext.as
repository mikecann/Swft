package co.uk.swft.base
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.base.ContextBase;
	import org.robotlegs.base.SignalCommandMap;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IMediatorMap;
	import org.robotlegs.core.ISignalCommandMap;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.lazy.LazyMediatorMap;
	import org.swiftsuspenders.Injector;
	
	public class GameContext extends Context
	{
		// Protecteds
		protected var _entityMap : EntityMap;
		protected var _signalCommandMap:ISignalCommandMap;
		
		public function GameContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}	
		
		public function get entityMap():EntityMap
		{
			return _entityMap || (_entityMap = new EntityMap(injector));
		}
		
		public function set entityMap(value:EntityMap) : void
		{
			_entityMap = value;
		}	
				
		public function get signalCommandMap():ISignalCommandMap
		{
			return _signalCommandMap || (_signalCommandMap = new SignalCommandMap(injector));
		}
		
		public function set signalCommandMap(value:ISignalCommandMap):void	
		{
			_signalCommandMap = value; 
		}
		
		override protected function get mediatorMap():IMediatorMap
		{
			return _mediatorMap || (_mediatorMap = new LazyMediatorMap(contextView, injector, reflector));
		}
				
		override protected function mapInjections():void
		{
			super.mapInjections();
			injector.mapValue(ISignalCommandMap, signalCommandMap);
			injector.mapValue(EntityMap, entityMap);			
		}
	}
}