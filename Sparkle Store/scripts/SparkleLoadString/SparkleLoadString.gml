// Feather disable all

/// Starts an asynchronous load operation for a string. Please see `SparkleLoad()` for more
/// information.
/// 
/// @param filename
/// @param callback
/// @param [priority=normal]

function SparkleLoadString(_filename, _callback, _priority = SPARKLE_PRIORITY_NORMAL)
{
    var _newCallback = method({
        __callback: _callback,
    },
    function(_buffer)
    {
        var _string = buffer_read(_buffer, buffer_string);
        __callback(_string);
    });
    
    return SparkleLoad(_newCallback, _filename, _priority);
}