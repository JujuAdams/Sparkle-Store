// Feather disable all

/// Returns the current Xbox user ID for save/load operations.

function SparkleGetXboxUserID(_gamepadIndex)
{
    static _system = __SparkleSystem();
    return _system.__xboxUserID;
}