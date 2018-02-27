package classes.game.elements
{
	public interface IElement
	{
		function get status():int;
		function set status(pstatus:int):void;
		function get vertexId():VertexId;
		function set vertexId(pid:VertexId):void;
		function get type():int;
		function explode():void;
	}
}