// Feather disable all

/// Sets the current group name. This group name will be used for future save/load operations but
/// will not impact any operations that have already been started. If you set the optional
/// `setKnown` parameter to true then `SparkleGetGroupNameUnknown()` will return `true` in the
/// future regardless of what happened when the game booted.
/// 
/// @param groupName
/// @param [setKnown=false]

function SparkleSetGroupName(_groupName, _setKnown = false)
{
    static _system = __SparkleSystem();
    
    _system.__groupName = string(_groupName);
    
    if (_setKnown)
    {
        _system.__groupNameUnknown = false;
    }
}