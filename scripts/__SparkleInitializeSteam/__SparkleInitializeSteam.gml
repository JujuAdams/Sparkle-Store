// Feather disable all

function __SparkleInitializeSteam()
{
    with(__SparkleSystem())
    {
        __usingSteamworks   = false;
        __steamCloudEnabled = false;
        
        try
        {
            //Using Steamworks extension
            __usingSteamworks = steam_is_user_logged_on();
        }
        catch(_error)
        {
            __SparkleTrace("Steamworks extension unavailable");
            return;
        }
        
        if (__usingSteamworks)
        {
            if (steam_is_cloud_enabled_for_app())
            {
                __SparkleTrace("Steam Cloud enabled for app");
                
                if (steam_is_cloud_enabled_for_account())
                {
                    __SparkleTrace("Steam Cloud enabled for account, using cloud saves");
                    __steamCloudEnabled = true;
                }
                else
                {
                    __SparkleTrace("Steam Cloud disabled for account");
                }
            }
            else
            {
                __SparkleTrace("Steam Cloud disabled for app");
            }
        }
    }
}