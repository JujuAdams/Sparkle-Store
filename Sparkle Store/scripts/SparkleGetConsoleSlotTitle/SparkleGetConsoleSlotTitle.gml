// Feather disable all

/// Returns the current slot title for save/load operations.

function SparkleGetConsoleSlotTitle()
{
    static _system = __SparkleSystem();
    return _system.__slotTitle;
}