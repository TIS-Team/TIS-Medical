#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = COMPONENT_NAME;
		units[]={};
		weapons[]={};
		author="TIS";
		requiredAddons[]={ "cba_main", "tis_medical_main" };
		requiredVersion=REQUIRED_VERSION;
        VERSION_CONFIG;
	};
};

#include "ACE_Medical_Treatment.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp" 
