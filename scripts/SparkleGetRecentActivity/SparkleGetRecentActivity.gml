// Feather disable all

/// Returns whether there was save/load activity recently within the given timespan. This is
/// useful for setting up a save/load indicator in your game's UI.
/// 
/// @param [milliseconds=1200]

function SparkleGetRecentActivity(_milliseconds = 1200)
{
    static _system = __SparkleSystem();
    
    return (SparkleGetTotalPending() > 0)? true : (current_time - _system.__lastActivityTime <= _milliseconds);
}