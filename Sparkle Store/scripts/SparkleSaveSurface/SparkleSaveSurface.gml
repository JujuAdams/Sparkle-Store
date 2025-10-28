// Feather disable all

/// Starts an asynchronous save operation for a surface. Please see `SparkleSave()` for more
/// information.
/// 
/// @param filename
/// @param surface
/// @param callback
/// @param [priority=normal]

function SparkleSaveSurface(_filename, _surface, _callback, _priority = SPARKLE_PRIORITY_NORMAL)
{
    var _buffer = buffer_create(2*8 + 4*surface_get_width(_surface)*surface_get_height(_surface), buffer_fixed, 1);
    buffer_write(_buffer, buffer_u64, surface_get_width(_surface));
    buffer_write(_buffer, buffer_u64, surface_get_height(_surface));
    buffer_get_surface(_buffer, _surface, buffer_tell(_buffer));
    
    var _compressedBuffer = buffer_compress(_buffer, 0, buffer_get_size(_buffer));
    buffer_delete(_buffer);
    
    return SparkleSave(_filename, _compressedBuffer, _callback, undefined, undefined, _priority);
}