// Feather disable all

/// @param directoryName

function SparkleSetDirectory(_name)
{
    static _system = __SparkleSystem();
    
    if (SPARKLE_FORCE_DIRECTORY)
    {
        __SparkleTrace($"Cannot set directory, `SPARKLE_FORCE_DIRECTORY` = \"{SPARKLE_FORCE_DIRECTORY}\"");
        return;
    }
    
    _system.__directory = _name;
}