// Feather disable all

/// Returns whether a file's presence has been cached. Please see `SparkleExist()` for more
/// information.
/// 
/// @param filename

function SparkleExistCached(_filename)
{
    static _presenceCacheMap = __SparkleSystem().__presenceCacheMap;
    return ds_map_exists(_presenceCacheMap, __SparkleFileCacheKey(_filename));
}