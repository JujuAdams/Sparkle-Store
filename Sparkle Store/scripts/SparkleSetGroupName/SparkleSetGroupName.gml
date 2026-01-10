// Feather disable all

/// Sets the current group name. This group name will be used for future save/load operations but
/// will not impact any operations that have already been started.
/// 
/// If this function is never called, the group name will default to `SPARKLE_DEFAULT_GROUP_NAME`
/// or `SPARKLE_IDE_GROUP_NAME` as appropriate.
/// 
/// The group name determines the save directory that a file gets placed into on most (but not
/// all!) platforms. Please refer to savefile documentation for consoles for further information.
/// 
/// @param groupName

function SparkleSetGroupName(_groupName)
{
    static _system = __SparkleSystem();
    _system.__groupName = string(_groupName);
}