// Feather disable all

/// Starts an asynchronous save operation for JSON (i.e. a struct/array assembly). Please see
/// `SparkleSave()` for more information.
/// 
/// @param filename
/// @param json
/// @param callback
/// @param [pretty=false]
/// @param [priority=normal]

function SparkleSaveJSON(_filename, _json, _callback, _pretty = false, _priority = SPARKLE_PRIORITY_NORMAL)
{
    return SparkleSaveString(_filename, json_stringify(_json, _pretty), _callback, _priority);
}