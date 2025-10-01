#define COMPONENT feedback
#include "\z\tis_medical\addons\main\script_mod.hpp"

// #define DEBUG_ENABLED_TIS_FEEDBACK
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_TIS_FEEDBACK
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_TIS_FEEDBACK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TIS_MEDICAL
#endif

#include "\z\tis_medical\addons\main\script_macros.hpp"
