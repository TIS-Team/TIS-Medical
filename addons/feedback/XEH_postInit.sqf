#include "script_component.hpp"

["ace_treatmentSucceded", LINKFUNC(treatmentSucceeded)] call CBA_fnc_addEventHandler;

GVAR(nextFadeIn) = 0;

[false] call FUNC(initEffects);
