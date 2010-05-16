package co.uk.swft.core
{
	public interface IGameManager
	{
		function onGameStartup() : void;
		function onNextLevel() : void;
		function onGameShutdown() : void;
		function get priority() : int;
	}
}