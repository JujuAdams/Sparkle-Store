// Feather disable all

#macro SPARKLE_RUNNING_FROM_IDE  (GM_build_type == "run")

#macro SPARKLE_ON_WINDOWS  (os_type == os_windows)
#macro SPARKLE_ON_MAC      (os_type == os_macosx)
#macro SPARKLE_ON_LINUX    (os_type == os_linux)

#macro SPARKLE_ON_CONSOLE  ((os_type == os_switch) || (os_type == os_ps4) || (os_type == os_ps5) || (os_type == os_xboxone) || (os_type == os_xboxseriesxs))
#macro SPARKLE_ON_MOBILE   ((os_type == os_ios) || (os_type == os_android))
#macro SPARKLE_ON_DESKTOP  (SPARKLE_ON_WINDOWS || SPARKLE_ON_MAC || SPARKLE_ON_LINUX)

#macro SPARKLE_STATUS_CANCELLED  -2
#macro SPARKLE_STATUS_FAILED     -1
#macro SPARKLE_STATUS_INACTIVE    0
#macro SPARKLE_STATUS_QUEUED      1
#macro SPARKLE_STATUS_PENDING     2
#macro SPARKLE_STATUS_SUCCESS     3