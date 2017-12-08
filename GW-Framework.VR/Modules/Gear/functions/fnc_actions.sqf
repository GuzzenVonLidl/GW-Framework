/*
	Author: GuzzenVonLidl
	Sets the addactions for gearbox

	Usage:
	[player, "sl"] call GW_Gear_Fnc_Actions;

	Arguments:
	0: Unit <OBJECT>

	Return Value: NO

	Public: No
*/
#include "script_Component.hpp"
#define	bullShit nil,1,false,false,"",""
params [["_unit", objNull, [objNull]]];

_unit addAction ["<t color='#ffff00'>Attachment Menu</t>", {["player", [], -100, ["_this call GW_Gear_Fnc_replaceAttachments","main"]] call cba_fnc_fleximenu_openMenuByDef},bullShit,7];

_unit addAction ["Remove Night gear", {
	player unassignItem "NVGoggles_OPFOR";
	player removeItem "NVGoggles_OPFOR";
	if (GVARMAIN(mod_ACE3)) then {
		player removeItem "ACE_IR_Strobe_Item";
		player removeItem "ACE_Flashlight_XL50";
	};
}];

_unit addAction ["Platoon > Actual","[player,'pl'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["Platoon > Forward Air Controller","[player,'fac'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["<t color='#00ff00'>Squad > Squad Leader</t>","[player,'sl'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["Squad Medic","[player,'sm'] call GW_Gear_Fnc_Handler;",bullShit,5];

_unit addAction ["<t color='#00ff00'>Squad > Fire Team Leader</t>","[player,'ftl'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["<t color='#FF0000'>Squad > Rifleman</t>","[player,'r'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["<t color='#FF0000'>Squad > Grenadier</t>","[player,'g'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["<t color='#4785f4'>Squad > Asst. Gunner</t>","[player,'ag'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["<t color='#4785f4'>Squad > Automatic Rifleman</t>","[player,'ar'] call GW_Gear_Fnc_Handler;",bullShit,5];

_unit addAction ["Echo > Pilot","[player,'p'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["Echo > Crew","[player,'crew'] call GW_Gear_Fnc_Handler;",bullShit,5];

_unit addAction ["Special > Asst. Medium AT","[player,'amat'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["Special > Medium AT","[player,'mat'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["Special > Asst. Medium Machine Gunner","[player,'ammg'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["Special > Medium Machine Gunner","[player,'mmg'] call GW_Gear_Fnc_Handler;",bullShit,5];
_unit addAction ["Special > Marksman","[player,'marksman'] call GW_Gear_Fnc_Handler;",bullShit,5];
