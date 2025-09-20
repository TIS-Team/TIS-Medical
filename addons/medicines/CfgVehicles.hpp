class CfgVehicles {
    class Item_Base_F;

    class TIS_tisupromItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Tisuprom_Display);
        author = ECSTRING(main,TISTeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(TIS_tisuprom,1);
        };
    };
};
