// Feather disable all

var _string = string_join("\n",
$"Time = {date_datetime_string(date_current_datetime())}",
$"Gamepad focus = {gamepadFocus}",
" ",
$"Group name = \"{SparkleGetGroupName()}\"",
$"Slot title = \"{SparkleGetConsoleSlotTitle()}\"",
$"Slot subtitle = \"{SparkleGetConsoleSlotSubtitle()}\"",
$"PS show dialog = {SparkleGetPSShowDialog()}",
$"PS gamepad index = {SparkleGetPSGamepadIndex()}",
$"Windows using GDK = {SparkleGetWindowsUseGDK()? "true" : "false"}",
$"Xbox user = {SparkleGetXboxUser()}",
" ",
$"Total pending = {SparkleGetTotalPending()}",
$"Save pending = {SparkleGetSavePending()}",
$"Save recent = {SparkleGetSaveRecent()}",
$"Load pending = {SparkleGetLoadPending()}",
$"Load recent = {SparkleGetLoadRecent()}",
$"Activity = {SparkleGetActivity()}",
);

_string += "\n\n";

var _i = 0;
repeat(array_length(optionArray))
{
    _string += optionArray[_i].name;
    if (_i == optionIndex) _string += " <--";
    _string += "\n";
    
    ++_i;
}

draw_text(10, 10, _string);

if (surface_exists(loadedSurface))
{
    draw_surface_ext(loadedSurface, 0, 0, 1, 1, 0, c_white, loadedGraphicAlpha);
}