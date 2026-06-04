#include "..\script_component.hpp"

/*
 * Author: Aquerr/Nerdi
 * Function for checking if the given unit is alive.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Target unit <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, _anotherPlayer] call tis_medical_actions_fnc_checkAlive;
 *
 */

params ["_medic", "_patient"];

if (GVAR(CheckAlive_Enable)) then {
	if (alive _patient) then {
		hint (LLSTRING(PatientIsAlive));
	} else {
		hint (LLSTRING(PatientIsNotAlive));
	};
};
