// Feather disable all

/// Starts an asynchronous save operation for a string. Please see `SparkleSave()` for more
/// information.
/// 
/// @param filename
/// @param string
/// @param callback
/// @param [priority=normal]

function SparkleSaveString(_filename, _string, _callback, _priority = SPARKLE_PRIORITY_NORMAL)
{
    var _buffer = buffer_create(string_byte_length(_string), buffer_fixed, 1);
    buffer_write(_buffer, buffer_text, _string);
    
    return SparkleSave(_filename, _buffer, _callback, undefined, undefined, _priority);
}