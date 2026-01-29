// Feather disable all

show_debug_message(json_encode(async_load, true));

if (SPARKLE_ON_XBOX)
{
    if (async_load[? "event_type"] == "user controller associated")
    {
        if (async_load[? "pad_index"] == gamepadFocus)
        {
            SparkleSetXboxUser(async_load[? "user"]);
        }
    }
}