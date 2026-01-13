// Feather disable all

/// Returns whether Sparkle Store will try to use `steam_file_*()` functions when saving and
/// loading files on desktop platforms, as set by `SoarkleSetSteamFile()`. This function will
/// always return `false` if `SPARKLE_ALLOW_STEAM_FILE` is set to `false`.
/// 
/// Please see documentation for `SPARKLE_ALLOW_STEAM_FILE` for more information.

function SoarkleGetSteamFile()
{
    static _system = __SparkleSystem();
    
    return (SPARKLE_ALLOW_STEAM_FILE && _system.__steamFile);
}