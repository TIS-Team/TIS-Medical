#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut (ACE)
 * Adapted by Aquerr for TIS
 * Handles the unconscious effect.
 *
 * Arguments:
 * 0: Enable <BOOL>
 * 1: Mode (0: instant, 1: animation, 2: fx handler) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true, 0] call ace_medical_feedback_fnc_effectUnconscious
 *
 * Public: No
 */

params ["_enable", "_mode"];

switch (_mode) do {
    // Instant (for Zeus or death)
    case 0: {
        GVAR(ppUnconsciousBlur)     ppEffectEnable _enable;

        if (GVAR(UnconsciousBlackout_Enable)) then {
            GVAR(ppUnconsciousBlackout) ppEffectEnable _enable;
        };
    };
    // Animated (triggered on unconscious event)
    case 1: {
        if (_enable) then {
            ACE_Player setVariable [QGVAR(effectUnconsciousTimeout), CBA_missionTime + FX_UNCON_FADE_IN];
            GVAR(ppUnconsciousBlur)     ppEffectEnable true;

            if (GVAR(UnconsciousBlackout_Enable)) then {
                GVAR(ppUnconsciousBlackout) ppEffectEnable true;
            };

            GVAR(ppUnconsciousBlur)     ppEffectAdjust [0];
            GVAR(ppUnconsciousBlur)     ppEffectCommit 0;
            if (GVAR(UnconsciousBlackout_Enable)) then {
                GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1]];
                GVAR(ppUnconsciousBlackout) ppEffectCommit 0;
            };

            GVAR(ppUnconsciousBlur)     ppEffectAdjust [5];
            GVAR(ppUnconsciousBlur)     ppEffectCommit FX_UNCON_FADE_IN;


            if (GVAR(UnconsciousBlackout_Enable)) then {
                GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 1], [0, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1]];
                GVAR(ppUnconsciousBlackout) ppEffectCommit FX_UNCON_FADE_IN;
            };

            // Handle next fade in
            GVAR(nextFadeIn) = CBA_missionTime + 15 + random 5;
        } else {
            ACE_Player setVariable [QGVAR(effectUnconsciousTimeout), CBA_missionTime + FX_UNCON_FADE_OUT];
            GVAR(ppUnconsciousBlur)     ppEffectEnable true;

            if (GVAR(UnconsciousBlackout_Enable)) then {
                GVAR(ppUnconsciousBlackout) ppEffectEnable true;    
            };

            // Step 1: Widen eye "hole"
            GVAR(ppUnconsciousBlur)     ppEffectAdjust [5];
            GVAR(ppUnconsciousBlur)     ppEffectCommit (FX_UNCON_FADE_OUT * 1/3);

            if (GVAR(UnconsciousBlackout_Enable)) then {
                GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0.9], [0, 0, 0, 1], [0, 0, 0, 0], [0.51, 0.17, 0, 0, 0, 0, 1]];
                GVAR(ppUnconsciousBlackout) ppEffectCommit (FX_UNCON_FADE_OUT * 1/3);  
            };

            // Step 2: Open it
            [{
                if (!isNull curatorCamera || {!alive ACE_Player}) exitWith {};

                GVAR(ppUnconsciousBlur)     ppEffectAdjust [0];
                GVAR(ppUnconsciousBlur)     ppEffectCommit (FX_UNCON_FADE_OUT * 2/3);

                if (GVAR(UnconsciousBlackout_Enable)) then {
                    GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0.8], [0, 0, 0, 1], [0, 0, 0, 0], [0.7, 0.78, 0, 0, 0, 0, 1]];
                    GVAR(ppUnconsciousBlackout) ppEffectCommit (FX_UNCON_FADE_OUT * 1/3);
                };
            }, [], FX_UNCON_FADE_OUT * 1/3] call CBA_fnc_waitAndExecute;

            // Step 3: Fade away vignette
            [{
                if (!isNull curatorCamera || {!alive ACE_Player}) exitWith {};

                if (GVAR(UnconsciousBlackout_Enable)) then {
                    GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0], [0.7, 0.78, 0, 0, 0, 0, 1]];
                    GVAR(ppUnconsciousBlackout) ppEffectCommit (FX_UNCON_FADE_OUT * 1/3);
                };
            }, [], FX_UNCON_FADE_OUT * 2/3] call CBA_fnc_waitAndExecute;
        };
    };
    // Raised by effectsHandler (blocked if animation in progress)
    case 2: {
        private _animatedTimeOut = ACE_Player getVariable [QGVAR(effectUnconsciousTimeout), 0];
        if (_animatedTimeOut > CBA_missionTime) exitWith {};

        if (_enable) then {
            if (GVAR(nextFadeIn) < CBA_missionTime) then {
                GVAR(ppUnconsciousBlur) ppEffectAdjust [5];
                GVAR(ppUnconsciousBlur) ppEffectCommit 0;

                if (GVAR(UnconsciousBlackout_Enable)) then {
                    GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0.9], [0, 0, 0, 1], [0, 0, 0, 0], [0.51, 0.17, 0, 0, 0, 0, 1]];
                    GVAR(ppUnconsciousBlackout) ppEffectCommit (FX_UNCON_FADE_OUT * 2/3);
                };

                [{
                    if (!isNull curatorCamera || {!alive ACE_Player}) exitWith {};

                    if (GVAR(UnconsciousBlackout_Enable)) then {
                        GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 1], [0, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1]];
                        GVAR(ppUnconsciousBlackout) ppEffectCommit (FX_UNCON_FADE_OUT * 1/3);
                    };
                }, [], FX_UNCON_FADE_OUT * 2/3] call CBA_fnc_waitAndExecute;

                ACE_Player setVariable [QGVAR(effectUnconsciousTimeout), CBA_missionTime + FX_UNCON_FADE_OUT];
                GVAR(nextFadeIn) = CBA_missionTime + FX_UNCON_FADE_OUT + 15 + random 5;
            } else {
                GVAR(ppUnconsciousBlur)     ppEffectAdjust [5];
                GVAR(ppUnconsciousBlur)     ppEffectCommit 0;

                if (GVAR(UnconsciousBlackout_Enable)) then {
                    GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 1], [0, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1]];
                    GVAR(ppUnconsciousBlackout) ppEffectCommit 0;
                };
            };
        } else {
            GVAR(ppUnconsciousBlur)     ppEffectAdjust [0];
            GVAR(ppUnconsciousBlur)     ppEffectCommit 0;

            if (GVAR(UnconsciousBlackout_Enable)) then {
                GVAR(ppUnconsciousBlackout) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1]];
                GVAR(ppUnconsciousBlackout) ppEffectCommit 0;
            };
        };

        GVAR(ppUnconsciousBlur)     ppEffectEnable _enable;

        if (GVAR(UnconsciousBlackout_Enable)) then {
            GVAR(ppUnconsciousBlackout) ppEffectEnable _enable;
        };
    };
};
