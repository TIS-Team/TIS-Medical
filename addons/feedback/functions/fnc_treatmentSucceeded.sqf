#include "..\script_component.hpp"

params["_caller","_target","_selectionName","_className","_itemUser","_usedItem"];

if (not(GVAR(YouAreBeingHealedNotificationEnable))) exitWith {};

if (!([_target] call ace_common_fnc_isAwake) and alive _target) then {
	titleText [LLSTRING(HoldOnYouAreBeingHealed), "PLAIN", -1];
	titleFadeOut 5;
};
