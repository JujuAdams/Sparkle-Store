// Feather disable all

/// Returns the currently set group name.

function SparkleGetGroupName()
{
    static _system = __SparkleSystem();
    return _system.__groupName;
}