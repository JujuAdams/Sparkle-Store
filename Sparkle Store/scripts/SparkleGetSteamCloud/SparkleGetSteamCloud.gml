// Feather disable all

/// Returns if Steam Cloud is enabled for both the application and the user's account.

function SparkleGetSteamCloud()
{
    static _system = __SparkleSystem();
    
    return (SPARKLE_ON_DESKTOP && _system.__steamCloudEnabled);
}