// Feather disable all

/// Returns the number of save operations completed in the last minute.

function SparkleGetSaveRecent()
{
    static _savePq = __SparkleSystem().__savePq;
    return ds_priority_size(_savePq);
}