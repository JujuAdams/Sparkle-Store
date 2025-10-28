// Feather disable all

/// Returns the number of pending load operations.

function SparkleGetLoadPending()
{
    static _system           = __SparkleSystem();
    static _queuedArray      = _system.__queuedArray;
    static _loadPendingArray = _system.__loadPendingArray;
    
    var _count = 0;
    
    var _i = 0;
    repeat(array_length(_queuedArray))
    {
        if (_queuedArray[_i].GetOperation() == SPARKLE_OP_LOAD)
        {
            ++_count;
        }
        
        ++_i;
    }
    
    return _count + array_length(_loadPendingArray);
}