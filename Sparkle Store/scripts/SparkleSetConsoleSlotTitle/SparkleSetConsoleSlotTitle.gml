// Feather disable all

/// Sets the current slot title for future save/load operations. This value will not impact any
/// operations that have already been started.
/// 
/// @param slotTitle

function SparkleSetConsoleSlotTitle(_slotTitle)
{
    static _system = __SparkleSystem();
    _system.__slotTitle = string(_slotTitle);
}