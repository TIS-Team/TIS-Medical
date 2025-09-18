[
    QGVAR(BreakNeck_Enable),
    "CHECKBOX",
    [LLSTRING(SETTING_BreakNeck_Enable), LLSTRING(SETTING_BreakNeck_Enable)],
    [CBA_SETTINGS_CAT, LSTRING(SubCategory_BreakingNeck)],
    [true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTime_BreakingNeck),
    "SLIDER",
    [LLSTRING(treatmentTime_BreakingNeck)],
    [CBA_SETTINGS_CAT, LSTRING(SubCategory_BreakingNeck)],
    [0.1, 20, 5, 1],
    true
] call CBA_fnc_addSetting;
