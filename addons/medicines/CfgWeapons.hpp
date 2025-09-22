class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class TIS_tisuprom: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(main,TISTeam);
        displayName = CSTRING(Tisuprom_Display);
        picture = QACEPATHTOF(medical_treatment,ui\painkillers_ca.paa);
        model = "\A3\Structures_F_EPA\Items\Medical\Painkillers_F.p3d";
        descriptionShort = CSTRING(Tisuprom_Desc_Short);
        descriptionUse = CSTRING(Tisuprom_Desc_Use);
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
