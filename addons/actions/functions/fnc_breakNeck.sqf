#include "..\script_component.hpp"

params ["_medic", "_patient"];


if (GVAR(BreakNeck_Enable)) then {
    [QGVAR(breakNeckLocal), [_patient], _patient] call CBA_fnc_targetEvent;
};
