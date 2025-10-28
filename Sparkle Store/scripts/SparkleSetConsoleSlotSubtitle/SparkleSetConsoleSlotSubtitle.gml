// Feather disable all

/// Sets the current slot subtitle for future save/load operations. This value will not impact any
/// operations that have already been started.
/// 
/// @param slotSubtitle

function SparkleSetConsoleSlotSubtitle(_slotSubtitle)
{
    static _system = __SparkleSystem();
    _system.__slotSubtitle = string(_slotSubtitle);
}