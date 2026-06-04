#include "..\script_component.hpp"

params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

if (ACEGVAR(medical_treatment,advancedMedication)) then {
	_this call ACEFUNC(medical_treatment,medication); // ACE will handle that using medication config.
} else {
	// We need to handle simple Tisuprom logic ourselves.
	[_patient, _usedItem] call ACEFUNC(medical_treatment,addToTriageCard);
	private _cfg = ["CfgWeapons", "CfgMagazines"] select (isClass (configFile >> "CfgMagazines" >> _usedItem));
	[_patient, "activity", ACEELSTRING(medical_treatment,Activity_usedItem), [[_medic, false, true] call ACEFUNC(common,getName), getText (configFile >> _cfg >> _usedItem >> "displayName")]] call ACEFUNC(medical_treatment,addToLog);
	[QGVAR(treatment_TisupromLocal), [_patient, _bodyPart], _patient] call CBA_fnc_targetEvent;
};
