// Feather disable all

/// @param gamepad

function xboxone_user_for_pad_safe(_gamepad)
{
    try
    {
        var _user = xboxone_user_for_pad(_gamepad);
    }
    catch(_error)
    {
        return undefined;
    }
    
    if (_user == 0)
    {
        //Account isn't known to the game yet, show the account picker
        xboxone_show_account_picker(_gamepad, 1);
        return undefined;
    }
    else
    {
        return _user;
    }
}