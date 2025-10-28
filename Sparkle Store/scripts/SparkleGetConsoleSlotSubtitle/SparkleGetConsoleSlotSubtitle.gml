// Feather disable all

/// Returns the current slot subtitle.

function SparkleGetConsoleSlotSubtitle()
{
    static _system = __SparkleSystem();
    return _system.__slotSubtitle;
}