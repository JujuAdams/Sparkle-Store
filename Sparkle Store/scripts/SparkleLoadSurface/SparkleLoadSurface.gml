// Feather disable all

/// Starts an asynchronous load operation for surface. Please see `SparkleLoad()` for more
/// information.
/// 
/// @param filename
/// @param callback
/// @param [priority=normal]

function SparkleLoadSurface(_filename, _callback, _priority = SPARKLE_PRIORITY_NORMAL)
{
    var _newCallback = method({
        __callback: _callback,
    },
    function(_buffer)
    {
        buffer_seek(_buffer, buffer_seek_start, 0);
        var _width  = buffer_read(_buffer, buffer_u64);
        var _height = buffer_read(_buffer, buffer_u64);
        
        var _surface = surface_create(_width, _height);
        buffer_set_surface(_buffer, _surface, 0);
        
        __callback(_surface);
    });
    
    return SparkleLoad(_newCallback, _filename, _priority);
}