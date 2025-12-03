// Feather disable all

/// Starts an asynchronous load operation for a string. This function is a wrapper around
/// `SparkleLoad()`. Please see documentation for that function for more information.
/// 
/// The callback for this function will be executed with two parameters:
/// 
/// argument0: The "status" of the load operation. This is one of the `SPARKLE_STATUS_*`
///            constants. Please see the `__SparkleConstants` script for more information.
/// 
/// argument1: The string that was found in the file. If there was a problem then this parameter
///            will be set to an empty string.
/// 
/// @param filename
/// @param callback
/// @param [priority=normal]

function SparkleLoadString(_filename, _callback, _priority = SPARKLE_PRIORITY_NORMAL)
{
    var _newCallback = method({
        __callback: _callback,
    },
    function(_status, _buffer)
    {
        if (_status)
        {
            var _string = buffer_read(_buffer, buffer_string);
        }
        else
        {
            var _string = "";
        }
        
        buffer_delete(_buffer);
        
        __callback(_status, _string);
    });
    
    return SparkleLoad(_filename, _newCallback, _priority);
}