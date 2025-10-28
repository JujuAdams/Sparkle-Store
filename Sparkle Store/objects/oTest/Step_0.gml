// Feather disable all

if (keyboard_check_pressed(ord("1")))
{
    SparkleSaveString("test.txt", "Test String", function(_status)
    {
        show_debug_message($"Returned status {_status}");
    });
}

if (keyboard_check_pressed(ord("2")))
{
    repeat(5)
    {
        SparkleSaveString("test.txt", "Test String", function(_status)
        {
            show_debug_message($"Returned status {_status}");
        });
    }
}

if (keyboard_check_pressed(ord("3")))
{
    repeat(10)
    {
        SparkleSaveString("test.txt", "Test String", function(_status)
        {
            show_debug_message($"Returned status {_status}");
        });
    }
}

if (keyboard_check_pressed(ord("4")))
{
    repeat(40)
    {
        SparkleSaveString("test.txt", "Test String", function(_status)
        {
            show_debug_message($"Returned status {_status}");
        });
    }
}