// Feather disable all

/// Returns the currently set group name for save/load operations.

function SparkleGetGroupName()
{
    static _system = __SparkleSystem();
    return _system.__groupName;
}