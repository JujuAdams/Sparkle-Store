// Feather disable all

function __SparkleInitializeSteam()
{
    with(__SparkleSystem())
    {
        __usingSteam      = false;
        __usingSteamworks = false;
        __onSteamDeck     = false;
        __onWINE          = false;
        
        var _steamEnviron = environment_get_variable("SteamEnv");
        if ((_steamEnviron != "") && (_steamEnviron == "1"))
        {
            __usingSteam = true;
        }
        
        try
        {
            //Using Steamworks extension
            __usingSteamworks = steam_input_init(true);
            __onSteamDeck     = steam_utils_is_steam_running_on_steam_deck();
        }
        catch(_error)
        {
            __SparkleTrace("Steamworks extension unavailable");
        }
        
        //Identify Steam Deck in absence of Steamworks
        if (not __onSteamDeck)
        {
            var _deck_envar = environment_get_variable("SteamDeck");
            if (_deck_envar != "")
            {
                //Try Deck environment variable
                __onSteamDeck = (_deck_envar == "1");
            }
            else
            {
                //Try Deck hardware identity
                var _map = os_get_info();
                if (ds_exists(_map, ds_type_map))
                {
                    var _identifier = undefined;
                    if (SPARKLE_ON_LINUX  ) _identifier = _map[? "gl_renderer_string"];
                    if (SPARKLE_ON_WINDOWS) _identifier = _map[? "video_adapter_description"];
                    
                    //Steam Deck GPU identifier
                    if ((_identifier != undefined) && __SparkleStringContains(_identifier, "AMD Custom GPU 0"))
                    {
                        __onSteamDeck = true;
                    }
                    
                    ds_map_destroy(_map);
                }
            }
        }
        
        //Detect whether in-game labels should use Steam's gamepad types
        var _switchLabels = environment_get_variable("SDL_GAMECONTROLLER_USE_BUTTON_LABELS");
        if (_switchLabels != "")
        {
            //Use environment variable
            __steamSwitchLabels = (_switchLabels == "1");
        }
        else
        {
            //Default enabled on Deck and disabled on desktop
            __steamSwitchLabels = __onSteamDeck;
        }
        
        if (__usingSteamworks)
        {
            //Whether we're on WINE. This is useful for trigger effects but is otherwise unused by this library
            __onWINE = (environment_get_variable("WINEDLLPATH") != "");
        }
    }
}