// Feather disable all

with(__SparkleSystem())
{
    var _oldestSave = ds_priority_find_min(__savePq);
    if (is_struct(_oldestSave))
    {
        if (current_time - _oldestSave.__executeTime > 60_000)
        {
            ds_priority_delete_min(__savePq);
        }
    }
    
    var _oldestLoad = ds_priority_find_min(__loadPq);
    if (is_struct(_oldestLoad))
    {
        if (current_time - _oldestLoad.__executeTime > 60_000)
        {
            ds_priority_delete_min(__loadPq);
        }
    }
    
    if (array_length(__queuedArray) > 0)
    {
        __lastQueuedTime = current_time;
        
        var _lastOpTime = infinity;
        var _delay      = infinity;
        
        var _opStruct = array_first(__queuedArray);
        if (_opStruct.GetOperation() == SPARKLE_OP_SAVE)
        {
            var _priorityCount = ds_priority_size(__savePq);
            if (_priorityCount < SPARKLE_MAX_SAVE_FREQUENCY)
            {
                var _param = clamp((_priorityCount - SPARKLE_NO_RATE_LIMIT_COUNT) / (SPARKLE_MAX_SAVE_FREQUENCY - SPARKLE_NO_RATE_LIMIT_COUNT), 0, 1);
                _delay = _param * 2 * (60_000 / (SPARKLE_MAX_SAVE_FREQUENCY - SPARKLE_NO_RATE_LIMIT_COUNT));
                
                var _newestOp = ds_priority_find_max(__savePq);
                var _lastOpTime = is_struct(_newestOp)? _newestOp.__executeTime : -infinity;
            }
        }
        else
        {
            var _priorityCount = ds_priority_size(__loadPq);
            if (_priorityCount < SPARKLE_MAX_LOAD_FREQUENCY)
            {
                var _param = clamp((_priorityCount - SPARKLE_NO_RATE_LIMIT_COUNT) / (SPARKLE_MAX_LOAD_FREQUENCY - SPARKLE_NO_RATE_LIMIT_COUNT), 0, 1);
                _delay = _param * 2 * (60_000 / (SPARKLE_MAX_LOAD_FREQUENCY - SPARKLE_NO_RATE_LIMIT_COUNT));
                
                var _newestOp = ds_priority_find_max(__loadPq);
                var _lastOpTime = is_struct(_newestOp)? _newestOp.__executeTime : -infinity;
            }
        }
        
        if (current_time > _lastOpTime + _delay)
        {
            array_shift(__queuedArray);
            _opStruct.__Execute();
        }
    }
}