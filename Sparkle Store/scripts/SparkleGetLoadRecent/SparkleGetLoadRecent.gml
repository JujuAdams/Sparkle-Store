// Feather disable all

/// Returns the number of load operations completed in the last minute.

function SparkleGetLoadRecent()
{
    static _loadPq = __SparkleSystem().__loadPq;
    return ds_priority_size(_loadPq);
}