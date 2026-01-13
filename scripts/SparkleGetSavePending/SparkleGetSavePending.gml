// Feather disable all

/// Returns the number of pending save operations.

function SparkleGetSavePending()
{
    static _system           = __SparkleSystem();
    static _queuedArray      = _system.__queuedArray;
    static _savePendingArray = _system.__savePendingArray;
    
    var _count = 0;
    
    var _i = 0;
    repeat(array_length(_queuedArray))
    {
        var _operation = _queuedArray[_i].GetOperation();
        if ((_operation == SPARKLE_OP_SAVE) || (_operation == SPARKLE_OP_DELETE))
        {
            ++_count;
        }
        
        ++_i;
    }
    
    return _count + array_length(_savePendingArray);
}