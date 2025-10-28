// Feather disable all

/// Returns the current slot title.

function SparkleGetConsoleSlotTitle()
{
    static _system = __SparkleSystem();
    return _system.__slotTitle;
}