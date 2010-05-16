package co.uk.swft.core
{
	public interface IGameManagerMap
	{
		function mapManager(managerClazz:Class) : void;
		function mapManagerOf(whenAskedFor:Class,provide:Class) : void;
		function startGame() : void;
	}
}