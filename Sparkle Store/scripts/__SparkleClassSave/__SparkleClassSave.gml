// Feather disable all

/// @param filename
/// @param buffer
/// @param offset
/// @param size
/// @param callback
/// @param gamepadIndex

function __SparkleClassSave(_filename, _buffer, _offset, _size, _callback) constructor
{
    static _system = __SparkleSystem();
    static _queuedArray       = _system.__queuedArray;
    static _savePendingArray  = _system.__savePendingArray;
    static _saveActivityArray = _system.__saveActivityArray;
    
    __filename = _filename;
    __buffer   = _buffer;
    __offset   = _offset;
    __size     = _size;
    __callback = _callback;
    
    __groupName    = _system.__groupName;
    __gamepadIndex = _system.__gamepadIndex;
    __slotTitle    = _system.__slotTitle;
    __slotSubtitle = _system.__slotSubtitle;
    
    if (SPARKLE_VERBOSE)
    {
        __SparkleTrace($"Created SAVE operation {string(ptr(self))}: group name = \"{__groupName}\", slot title = \"{__slotTitle}\", filename = \"{_filename}\", buffer = {_buffer}, offset = {_offset}, size = {_size}, callback = {_callback}");
    }
    
    __dispatched   = false;
    __completed    = false;
    __activityTime = infinity;
    __asyncID      = undefined;
    __status       = SPARKLE_STATUS_QUEUED;
    
    static GetOperation = function()
    {
        return SPARKLE_OP_SAVE;
    }
    
    static Cancel = function()
    {
        __Complete(SPARKLE_STATUS_CANCELLED);
    }
    
    static GetStatus = function()
    {
        return __status;
    }
    
    static __Dispatch = function()
    {
        if (__dispatched) return;
        
        __dispatched = true;
        __activityTime = current_time;
        
        if (SPARKLE_VERBOSE)
        {
            __SparkleTrace($"Dispatching SAVE operation {string(ptr(self))}");
        }
        
        buffer_async_group_begin(__groupName);
    	buffer_async_group_option("showdialog", 0);
        
        if (SPARKLE_ON_PS4)
        {
        	buffer_async_group_option("savepadindex", __gamepadIndex);
        	buffer_async_group_option("slottitle",    __slotTitle);
        	buffer_async_group_option("subtitle",     __slotSubtitle);
        }
        
        buffer_save_async(__buffer, __filename, __offset, __size);
        
    	__asyncID = buffer_async_group_end();
        
        var _index = array_get_index(_queuedArray, self);
        if (_index >= 0) array_delete(_queuedArray, _index, 1);
        
        array_push(_savePendingArray, self);
        array_push(_saveActivityArray, self);
        
        __status = SPARKLE_STATUS_PENDING;
    }
    
    static __Complete = function(_status)
    {
        if (__completed) return;
        
        __completed = true;
        __activityTime = current_time;
        
        if (SPARKLE_VERBOSE)
        {
            __SparkleTrace($"Completing SAVE operation {string(ptr(self))}: status = {_status}");
        }
        
        if (SPARKLE_ON_SWITCH && (_status == SPARKLE_STATUS_SUCCESS))
        {
            switch_save_data_commit();
        }
        
        __status = _status;
        __asyncID = undefined;
        
        var _index = array_get_index(_queuedArray, self);
        if (_index >= 0) array_delete(_queuedArray, _index, 1);
        
        var _index = array_get_index(_savePendingArray, self);
        if (_index >= 0) array_delete(_savePendingArray, _index, 1);
        
        if (is_callable(__callback))
        {
            __callback(_status, __buffer);
        }
    }
}