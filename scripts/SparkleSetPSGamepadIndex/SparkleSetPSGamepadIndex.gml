// Feather disable all

/// Sets the current PlayStation gamepad index for future save/load operations. This value will not
/// impact any operations that have already been started.
/// 
/// @param gamepadIndex

function SparkleSetPSGamepadIndex(_gamepadIndex)
{
    static _system = __SparkleSystem();
    _system.__psGamepadIndex = _gamepadIndex;
}