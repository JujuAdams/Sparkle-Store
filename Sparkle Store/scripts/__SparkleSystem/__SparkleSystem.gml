// Feather disable all

#macro __SPARKLE_SIMULTANEOUS  (SPARKLE_ALLOW_SIMULTANEOUS && (not SPARKLE_ON_CONSOLE))

__SparkleSystem();

function __SparkleSystem()
{
    static _system = undefined;
    if (_system != undefined) return _system;
    
    _system = {};
    if (debug_mode) global.__SparkleStore = _system;
    
    with(_system)
    {
        __SparkleTrace("Welcome to Sparkle Store by Juju Adams!");
        
        __queuedArray      = [];
        __savePendingArray = [];
        __loadPendingArray = [];
        
        __savePq = ds_priority_create();
        __loadPq = ds_priority_create();
        
        if (SPARKLE_FORCE_DIRECTORY != undefined)
        {
            __directory = SPARKLE_FORCE_DIRECTORY;
            __SparkleTrace($"Initialized directory to \"{__directory}\" (forced)");
            
            __unknownUser = false;
        }
        else if (SPARKLE_DEBUG_MODE && (SPARKLE_DEBUG_DIRECTORY != undefined))
        {
            __directory = SPARKLE_DEBUG_DIRECTORY;
            __SparkleTrace($"Initialized directory to \"{__directory}\" (in debug mode)");
            
            __unknownUser = false;
        }
        else
        {
            __directory = SPARKLE_UNKNOWN_DIRECTORY;
            __SparkleTrace($"Initialized directory to \"{__directory}\"");
            
            __unknownUser = true;
        }
        
        __SparkleInitializeSteam();
        
        time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, function()
        {
            static _createdInstance = false;
            
            if (not _createdInstance)
            {
                _createdInstance = true;
                instance_create_depth(0, 0, 0, __oSparkleStore);
            }
            else if (not instance_exists(__oSparkleStore))
            {
                __SparkleError("`__oSparkleStore` has been destroyed or deactivated.\nPlease enough this instance is never destroyed or deactivated.");
            }
        },
        [], -1));
    }
    
    return _system;
}