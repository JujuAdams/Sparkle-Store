// Feather disable all

/// Returns whether the group name was successfully determined when the game booted up.

function SparkleGetGroupNameUnknown()
{
    static _system = __SparkleSystem();
    return _system.__groupNameUnknown;
}