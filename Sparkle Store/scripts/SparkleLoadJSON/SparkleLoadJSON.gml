// Feather disable all

/// Starts an asynchronous load operation for JSON (i.e. a struct/array assembly). Please see
/// `SparkleLoad()` for more information.
/// 
/// @param filename
/// @param callback
/// @param [priority=normal]

function SparkleLoadJSON(_filename, _callback, _priority = SPARKLE_PRIORITY_NORMAL)
{
    var _newCallback = method({
        __callback: _callback,
    },
    function(_string)
    {
        var _json = json_parse(_string);
        __callback(_json);
    });
    
    return SparkleLoadString(_newCallback, _filename, _priority);
}