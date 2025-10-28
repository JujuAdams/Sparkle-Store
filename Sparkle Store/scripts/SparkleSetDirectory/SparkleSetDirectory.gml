// Feather disable all

/// @param directoryName

function SparkleSetDirectory(_name)
{
    static _system = __SparkleSystem();
    
    if (not _system.__unknownUser)
    {
        if (SPARKLE_RUNNING_FROM_IDE)
        {
            __SparkleError("Cannot set directory, user is known");
        }
        else
        {
            __SparkleTrace("Warning! Cannot set directory, user is known");
        }
        
        return;
    }
    
    _system.__directory = _name;
}