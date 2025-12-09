// Feather disable all

/// @param [executeCallbacks=false]

function SparkleCancelAll(_executeCallbacks = false)
{
    static _system = __SparkleSystem();
    with(_system)
    {
        if (_executeCallbacks)
        {
            var _i = 0;
            repeat(array_length(__queuedArray))
            {
                __queuedArray[_i].__Complete(false);
                ++_i;
            }
        }
        else
        {
            var _i = 0;
            repeat(array_length(__savePendingArray))
            {
                __savePendingArray[_i].__callback = undefined;
                ++_i;
            }
            
            var _i = 0;
            repeat(array_length(__loadPendingArray))
            {
                __loadPendingArray[_i].__callback = undefined;
                ++_i;
            }
        }
        
        array_resize(__queuedArray, 0);
    }
}