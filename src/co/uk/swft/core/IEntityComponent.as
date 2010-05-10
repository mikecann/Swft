package co.uk.swft.core
{
	public interface IEntityComponent
	{
		function set entity(value:IEntity) : void;
		function get entity() : IEntity;
		function onRegister():void;
		function onRemove():void;
	}
}