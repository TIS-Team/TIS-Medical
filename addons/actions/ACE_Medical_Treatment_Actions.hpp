class ACE_Medical_Treatment_Actions {
    
    class BasicBandage;
    class FieldDressing: BasicBandage {}; 
    class Morphine: FieldDressing {};

    class Tisuprom: Morphine {
        displayName = CSTRING(Administer_Tisuprom);
        displayNameProgress = CSTRING(Administering_Tisuprom);
        // icon = QPATHTOEF(medical_gui,ui\painkillers.paa);
        allowedSelections[] = {"Head"};
        medicRequired = 0;
        items[] = {"TIS_tisuprom"};
        treatmentTime = 4;
        sounds[] = {{QACEPATHTOF(medical_treatment,sounds\Pills.ogg),1,1,50}};
        litter[] = {{"Land_PainKillers_F"}}; // just use BI's model as litter
    };

    class Whisper: Morphine {
        displayName = CSTRING(Whipser);
        displayNameProgress = CSTRING(Whispering);
        allowedSelections[] = {"Head"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(medLvl_Whispering);
        treatmentTime = QGVAR(treatmentTime_Whispering);
        items[] = {};
        condition = QUOTE(!([_patient] call ace_common_fnc_isAwake) && GVAR(Whisper_Enable));
        litter[] = {};
        callbackSuccess = QFUNC(treatmentAdvanced_Whisper);
        animationMedic = "AinvPknlMstpSnonWnonDnon_medicUp4";
        animationMedicProne = "AinvPknlMstpSnonWnonDnon_medicUp4";
    };

    class BreakNeck: BasicBandage {
        displayName = CSTRING(BreakNeck);
        displayNameProgress = CSTRING(BreakingNeck);
        icon = "";
        category = "examine";
        consumeItem = 0;
        allowedSelections[] = {"Head"};
        allowSelfTreatment = 0;
        medicRequired = 0;
        treatmentTime = QGVAR(treatmentTime_BreakingNeck);
        items[] = {};
        condition = QUOTE(!([_patient] call ace_common_fnc_isAwake) && GVAR(BreakNeck_Enable));
        litter[] = {};
        callbackSuccess = QFUNC(breakNeck);
        animationMedic = "AinvPknlMstpSnonWnonDnon_medicUp4";
        animationMedicProne = "AinvPknlMstpSnonWnonDnon_medicUp4";
        sounds[] = {{QPATHTO_R(data\sounds\breakNeck.ogg),1,1,50}};
    };
};
