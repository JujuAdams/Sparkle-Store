// Feather disable all

// Directory to forcibly use. Setting this macro to anything other than `undefined` wil cause the
// macro value to override every other setting, including `SPARKLE_DEBUG_DIRECTORY` and
// `SPARKLE_UNKNOWN_DIRECTORY`. This is useful for testing but you should re-set this macro to
// `undefined` for production builds!
#macro SPARKLE_FORCE_DIRECTORY  undefined

// Macro that determines whether the game is running in "debug mode". If you're running in debug
// mode then the directory will be forced to `SPARKLE_DEBUG_DIRECTORY`. This is helpful to keep
// e.g. Steam cloud saves separate from your testing environment. Set `SPARKLE_DEBUG_MODE` to
// `false` or `SPARKLE_DEBUG_DIRECTORY` to `undefined` to turn off this feature
#macro SPARKLE_DEBUG_MODE  SPARKLE_RUNNING_FROM_IDE
#macro SPARKLE_DEBUG_DIRECTORY  "debug"

// Directory to use when the user cannot be determined. This is the case when running in debug or
// offline modes on different platforms. Set to `undefined` to instead throw an error when the user
// cannot be determined.
#macro SPARKLE_UNKNOWN_DIRECTORY  "savedata"

// Whether to allow simultaneous saving/loading. This is automatically disabled on certain
// platforms to avoid running afoul of upstream bugs. Setting this option to `true` will elad to
// much faster save times where it's safe to do so. Setting this option to `false` will cause all
// platforms to behave more-or-less similarly to each other.
#macro SPARKLE_ALLOW_SIMULTANEOUS  true

// Maximum number of save/load operations that can be completed in a minute. These numbers are
// used to calculate the delays between operations.
#macro SPARKLE_MAX_SAVE_FREQUENCY  ((os_type == os_switch)? 30 : infinity)
#macro SPARKLE_MAX_LOAD_FREQUENCY  ((os_type == os_switch)? 30 : infinity)

// Minimum and maximum delays for save/load operations.
#macro SPARKLE_SAVE_DELAY_MIN  0
#macro SPARKLE_SAVE_DELAY_MAX  ((os_type == os_switch)? 4000 : 0)
#macro SPARKLE_LOAD_DELAY_MIN  0
#macro SPARKLE_LOAD_DELAY_MAX  ((os_type == os_switch)? 4000 : 0)