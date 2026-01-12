// Feather disable all

/// Sets whether a OS dialog should appear when saving or loading a file. This value will not
/// impact any operations that have already been started.
/// 
/// @param state

function SparkleSetPSShowDialog(_state)
{
    static _system = __SparkleSystem();
    _system.__psShowDialog = _state;
}