package openfl.events;

/**
 * ...
 * @author Christopher Speciale
 */
class SQLEvent extends Event
{
	public static var ANALYZE(default, never):EventType<SQLEvent> = "analyze";
	public static var ATTACH(default, never):EventType<SQLEvent> = "attach";
	public static var BEGIN(default, never):EventType<SQLEvent> = "begin";
	public static var CANCEL(default, never):EventType<SQLEvent> = "cancel";
	public static var CLOSE(default, never):EventType<SQLEvent> = "close";
	public static var COMMIT(default, never):EventType<SQLEvent> = "commit";
	public static var COMPACT(default, never):EventType<SQLEvent> = "compact";
	public static var DEANALYZE(default, never):EventType<SQLEvent> = "deanalyze";
	public static var DETACH(default, never):EventType<SQLEvent> = "detach";
	public static var OPEN(default, never):EventType<SQLEvent> = "open";
	public static var RELEASE_SAVEPOINT(default, never):EventType<SQLEvent> = "releaseSavepoint";
	public static var RESULT(default, never):EventType<SQLEvent> = "result";
	public static var ROLLBACK(default, never):EventType<SQLEvent> = "rollback";
	public static var ROLLBACK_TO_SAVEPOINT(default, never):EventType<SQLEvent> = "rollbackToSavepoint";
	public static var SCHEMA(default, never):EventType<SQLEvent> = "schema";
	public static var SET_SAVEPOINT(default, never):EventType<SQLEvent> = "cancel";

	public function new(type:EventType<SQLEvent>)
	{
		super(type);
	}
}
