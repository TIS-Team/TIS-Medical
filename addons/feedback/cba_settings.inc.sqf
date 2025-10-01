[
    QGVAR(YouAreBeingHealedNotification_Enable),
    "CHECKBOX",
    LLSTRING(SETTING_YouAreBeingHealedNotification_Enable),
    [TIS_MEDICAL_SETTINGS_CAT, LSTRING(SubCategory_Unconscious)],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(UnconsciousBlackout_Enable),
    "CHECKBOX",
    LLSTRING(SETTING_UnconsciousBlackout_Enable),
    [TIS_MEDICAL_SETTINGS_CAT, LSTRING(SubCategory_Unconscious)],
    true,
    true
] call CBA_fnc_addSetting;
