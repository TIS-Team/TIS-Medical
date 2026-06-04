#include "..\script_component.hpp"

/*
 * Author: Aquerr/Nerdi
 * Local callback for administering Tisuprom to a patient.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "RightArm"] call tis_medical_actions_fnc_medicationLocal;
 *
 */

params ["_patient", "_bodyPart"];

if (!alive _patient) exitWith {};

private _painSuppress = _patient getVariable [QACEGVAR(medical,painSuppress), 0];
_patient setVariable [ACEGVAR(medical,painSuppress), (_painSuppress + TISUPROM_PAIN_SUPPRESSION) min 1, true];
