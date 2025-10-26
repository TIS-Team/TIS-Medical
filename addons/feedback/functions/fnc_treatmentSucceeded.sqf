#include "..\script_component.hpp"

params["_caller","_target","_selectionName","_className","_itemUser","_usedItem"];

if (not(GVAR(YouAreBeingHealedNotificationEnable))) exitWith {};

if (!([_target] call ace_common_fnc_isAwake) and alive _target) then {
	[[LLSTRING(HoldOnYouAreBeingHealed), "PLAIN", -1, true]] remoteExec ["titleText", _target];
	[5] remoteExec ["titleFadeOut", _target];
};
