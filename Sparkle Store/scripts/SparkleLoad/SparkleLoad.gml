// Feather disable all

/// Starts an asynchronous load operation for a buffer (or part of a buffer).
/// 
/// @param filename
/// @param callback
/// @param [priority=normal]

function SparkleLoad(_filename, _callback, _priority = SPARKLE_PRIORITY_NORMAL)
{
    static _system = __SparkleSystem();
    static _queuedArray = _system.__queuedArray;
    
    var _struct = new __SparkleClassLoad(_system.__groupName, _filename, _callback, _system.__gamepadIndex);
    
    if (_priority == SPARKLE_PRIORITY_HIGH)
    {
        array_insert(_queuedArray, _struct, 0);
    }
    else if (_priority == SPARKLE_PRIORITY_IMMEDIATE)
    {
        _struct.__Execute();
    }
    else
    {
        array_push(_queuedArray, _struct);
    }
    
    return _struct;
}