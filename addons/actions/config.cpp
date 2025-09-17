#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = COMPONENT_NAME;
		units[]={ "TIS_tisupromItem" };
		weapons[]={
			"TIS_tisuprom"
		};
		author="TIS";
		requiredAddons[]={ "cba_main", "ace_medical_treatment", "tis_medical_main"};
		requiredVersion=REQUIRED_VERSION;
        VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#include "CfgSounds.hpp"
