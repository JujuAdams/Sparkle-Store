// Feather disable all

/// Returns the current slot subtitle for save/load operations.

function SparkleGetConsoleSlotSubtitle()
{
    static _system = __SparkleSystem();
    return _system.__slotSubtitle;
}