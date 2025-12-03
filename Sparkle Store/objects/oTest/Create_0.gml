// Feather disable all

watchStart = undefined;
loadedSurface = undefined;
loadedGraphicAlpha = 0;

gamepadFocus = -1;

optionIndex = 0;

optionArray = [];

array_push(optionArray, {
    name: "Save text",
    func: method(other, function()
    {
        watchStart = current_time;
        
        SparkleSaveString("test.txt", "Test String", function(_status)
        {
            show_debug_message($"Returned status {_status}");
        });
    }),
});

array_push(optionArray, {
    name: "Save text x20",
    func: method(other, function()
    {
        watchStart = current_time;
        
        repeat(20)
        {
            SparkleSaveString("test.txt", "Test String", function(_status)
            {
                show_debug_message($"Returned status {_status}");
            });
        }
    }),
});

array_push(optionArray, {
    name: "Load text",
    func: method(other, function()
    {
        watchStart = current_time;
        
        SparkleLoadString("test.txt", function(_status, _string)
        {
            show_debug_message($"Returned status {_status}, string = \"{_string}\"");
        });
    }),
});

array_push(optionArray, {
    name: "Load text x20",
    func: method(other, function()
    {
        watchStart = current_time;
        
        repeat(40)
        {
            SparkleLoadString("test.txt", function(_status, _string)
            {
                show_debug_message($"Returned status {_status}, string = \"{_string}\"");
            });
        }
    }),
});

array_push(optionArray, {
    name: "Save JSON",
    func: method(other, function()
    {
        watchStart = current_time;
        
        SparkleSaveJSON("test.json", { woah: "we're halfway there", woahoh: "living on a prayer" }, function(_status)
        {
            show_debug_message($"Returned status {_status}");
        });
    }),
});

array_push(optionArray, {
    name: "Load JSON",
    func: method(other, function()
    {
        watchStart = current_time;
        
        SparkleLoadJSON("test.json", function(_status, _json)
        {
            show_debug_message($"Returned status {_status}, json = {json_stringify(_json)}");
        });
    }),
});

array_push(optionArray, {
    name: "Save Screenshot",
    func: method(other, function()
    {
        watchStart = current_time;
        
        SparkleSaveSurface("test.img", application_surface, function(_status)
        {
            show_debug_message($"Returned status {_status}");
        });
    }),
});
    
array_push(optionArray, {
    name: "Load Screenshot",
    func: method(other, function()
    {
        watchStart = current_time;
        
        SparkleLoadSurface("test.img", function(_surface)
        {
            show_debug_message($"Surface = {_surface}");
            
            if (loadedSurface != undefined)
            {
                surface_free(loadedSurface);
                loadedSurface = undefined;
            }
            
            loadedSurface = _surface;
            loadedGraphicAlpha = 1;
        });
    }),
});