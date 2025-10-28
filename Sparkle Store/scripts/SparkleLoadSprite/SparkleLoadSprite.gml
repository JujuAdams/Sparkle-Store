// Feather disable all

/// Starts an asynchronous load operation for one image of a sprite. Please see `SparkleLoad()`
/// for more information.
/// 
/// @param filename
/// @param callback
/// @param [priority=normal]

function SparkleLoadSprite(_filename, _callback, _priority = SPARKLE_PRIORITY_NORMAL)
{
    var _newCallback = method({
        __callback: _callback,
    },
    function(_surface)
    {
        var _sprite = sprite_create_from_surface(_surface, 0, 0, surface_get_width(_surface), surface_get_height(_surface), false, false, 0, 0);
        surface_free(_surface);
        
        __callback(_sprite);
    });
    
    return SparkleLoad(_newCallback, _filename, _priority);
}