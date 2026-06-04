#include "..\script_component.hpp"

/*
 * Author: Aquerr/Nerdi
 * Function to perform neck breaking.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Target unit <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, _anotherPlayer] call tis_medical_actions_fnc_breakNeck;
 *
 */

params ["_medic", "_patient"];


if (GVAR(BreakNeck_Enable)) then {
    [QGVAR(breakNeckLocal), [_patient], _patient] call CBA_fnc_targetEvent;
};
