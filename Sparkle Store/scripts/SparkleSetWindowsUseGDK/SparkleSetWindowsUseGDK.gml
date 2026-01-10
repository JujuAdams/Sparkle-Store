// Feather disable all

/// @param state

function SparkleSetWindowsUseGDK(_state)
{
    static _system = __SparkleSystem();
    
    if (os_type == os_windows)
    {
        _system.__windowsUseGDK = _state;
    }
    else if (_state)
    {
        __SparkleTrace("Warning! Cannot use GDK on non-Windows platforms");
    }
}