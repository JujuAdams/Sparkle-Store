// Feather disable all

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
        
        __lastQueuedTime = -infinity;
        __gamepadIndex = -1;
        
        __queuedArray      = [];
        __savePendingArray = [];
        __loadPendingArray = [];
        
        __savePq = ds_priority_create();
        __loadPq = ds_priority_create();
        
        if (SPARKLE_FORCE_GROUP_NAME != undefined)
        {
            __groupName = string(SPARKLE_FORCE_GROUP_NAME);
            __groupNameUnknown = false;
            
            __SparkleTrace($"Initialized group name to \"{__groupName}\" (forced)");
        }
        else
        {
            __groupName = string(SPARKLE_ON_CONSOLE? SPARKLE_CONSOLE_GROUP_NAME : SPARKLE_UNKNOWN_GROUP_NAME);
            __groupNameUnknown = true;
            
            __SparkleTrace($"Initialized group name to \"{__groupName}\"");
        }
        
        __SparkleInitializeSteam();
        
        if (SPARKLE_ON_DESKTOP && __usingSteamworks)
        {
            try
            {
                __groupName = string(steam_get_user_steam_id());
                __groupNameUnknown = false;
            }
            catch(_error)
            {
                show_debug_message(_error);
                __SparkleError("Failed to obtain Steam user ID");
            }
        }
        
        if (__groupNameUnknown)
        {
            __SparkleTrace($"Warning! Group name not known");
        }
        
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