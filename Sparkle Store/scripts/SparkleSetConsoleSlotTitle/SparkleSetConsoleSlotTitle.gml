// Feather disable all

/// Sets the current slot title for future save/load operations.
/// 
/// @param slotTitle

function SparkleSetConsoleSlotTitle(_slotTitle)
{
    static _system = __SparkleSystem();
    _system.__slotTitle = string(_slotTitle);
}