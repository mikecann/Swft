package co.uk.swft.core
{
	
	public interface IEntityMap
	{
		function createEntity(entityClass:Class):IEntity;
		function registerEntity(entity:IEntity):void;
		function removeEntity(entity:IEntity):void;
		function removeEntities():void;
	}
}