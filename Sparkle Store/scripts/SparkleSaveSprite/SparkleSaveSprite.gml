// Feather disable all

/// Starts an asynchronous save operation for one image of a sprite. Please see `SparkleSave()` for
/// more information.
/// 
/// @param callback
/// @param filename
/// @param sprite
/// @param image
/// @param [priority=normal]

function SparkleSaveSprite(_callback, _filename, _sprite, _image, _priority = SPARKLE_PRIORITY_NORMAL)
{
    var _surface = surface_create(sprite_get_width(_sprite), sprite_get_height(_sprite));
    
    surface_set_target(_surface);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    draw_sprite(_sprite, _image, sprite_get_xoffset(_sprite), sprite_get_yoffset(_sprite));
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    
    var _result = SparkleSaveSurface(_filename, _surface, _callback, _priority);
    
    surface_free(_surface);
    
    return _result;
}