#include "..\script_component.hpp"

params [["_updateOnly", false]];

private _fnc_createEffect = {
    params ["_type", "_layer", "_default"];

    private _effect = ppEffectCreate [_type, _layer];
    _effect ppEffectForceInNVG true;
    _effect ppEffectAdjust _default;
    _effect ppEffectCommit 0;

    _effect
};

if (_updateOnly) exitWith {};

// - Unconscious --------------------------------------------------------------
GVAR(ppUnconsciousBlur) = [
    "DynamicBlur",
    814, // 135xx does not work
    [0]
] call _fnc_createEffect;

TRACE_1("Created effect",GVAR(ppUnconsciousBlur));

GVAR(ppUnconsciousBlackout) = [
    "ColorCorrections",
    13500,
    [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
] call _fnc_createEffect;

TRACE_1("Created effect",GVAR(ppUnconsciousBlackout));

