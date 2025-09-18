#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
        name = COMPONENT_NAME;
		authors[]= { "TIS" };
		units[]={};
		weapons[]={};
        requiredVersion = REQUIRED_VERSION;
		requiredAddons[]=
		{
			"cba_main"
		};
        authorUrl = "https://github.com/Aquerr";
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
