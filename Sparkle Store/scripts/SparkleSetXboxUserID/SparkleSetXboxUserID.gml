// Feather disable all

/// Sets the current Xbox user ID for future save/load operations. This value will not impact any
/// operations that have already been started.
/// 
/// @param gamepadIndex

function SparkleSetXboxUserID(_gamepadIndex)
{
    static _system = __SparkleSystem();
    _system.__xboxUserID = string(_gamepadIndex);
}