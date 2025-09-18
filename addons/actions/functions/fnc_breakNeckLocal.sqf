#include "..\script_component.hpp"

params ["_patient"];

playSound3D [QPATHTOF(data\sounds\breakNeck.ogg), _patient, false, getPosASL _patient, 10, 1, 15];
_patient setDamage 1;
