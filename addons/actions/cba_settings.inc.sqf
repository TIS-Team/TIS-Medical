[
    QGVAR(BreakNeck_Enable),
    "CHECKBOX",
    [LLSTRING(SETTING_BreakNeck_Enable), LLSTRING(SETTING_BreakNeck_Enable)],
    [TIS_MEDICAL_SETTINGS_CAT, LSTRING(SubCategory_BreakingNeck)],
    true,
    true,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTime_BreakingNeck),
    "SLIDER",
    [LLSTRING(treatmentTime_BreakingNeck)],
    [TIS_MEDICAL_SETTINGS_CAT, LSTRING(SubCategory_BreakingNeck)],
    [0.1, 20, 5, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(BreakNeck_Conscious_Enable),
    "CHECKBOX",
    [LLSTRING(SETTING_BreakNeck_Conscious_Enable), LLSTRING(SETTING_BreakNeck_Conscious_Enable)],
    [TIS_MEDICAL_SETTINGS_CAT, LSTRING(SubCategory_BreakingNeck)],
    false,
    true,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(CheckAlive_Enable),
    "CHECKBOX",
    [LLSTRING(SETTING_CheckAlive_Enable), LLSTRING(SETTING_CheckAlive_Enable)],
    [TIS_MEDICAL_SETTINGS_CAT, LSTRING(SubCategory_CheckAlive)],
    false,
    true,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(treatmentTime_CheckingAlive),
    "SLIDER",
    [LLSTRING(treatmentTime_CheckingAlive)],
    [TIS_MEDICAL_SETTINGS_CAT, LSTRING(SubCategory_CheckAlive)],
    [0.1, 20, 5, 1],
    true
] call CBA_fnc_addSetting;
