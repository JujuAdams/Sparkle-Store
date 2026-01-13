// Feather disable all

/// Returns if Steam Cloud is enabled. The requires all of the following to be true:
/// - The game is running on Windows, MacOS, or Linux
/// - The game is using YoYoGames' Steamworks extension
/// - Steam is open and running
/// - The application is owed by the player
/// - The application has been installed
/// - The application is set up to use Steam Cloud
/// - The user has enabled Steam Cloud for their account
/// 
/// Please note that `SPARKLE_ALLOW_STEAM_FILE` and `SoarkleSetSteamFile()` can alter where and
/// how files are saved/loaded.

function SparkleGetSteamCloud()
{
    static _system = __SparkleSystem();
    
    return (SPARKLE_ON_DESKTOP && _system.__steamCloudEnabled);
}