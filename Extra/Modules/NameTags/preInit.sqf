#include "script_Component.hpp"

PREP(drawNameTags);

GVAR(filteredUnits) = [];

GVAR(showNameTags) = false;
GVAR(distance) = 10;
GVAR(playersOnly) = false;

[QGVAR(useKeyBind), "CHECKBOX", ["Enable on Keypress", "Toggles always on, or only on keypress"], ["GW_UI", "Name Tags"], true, CBA_CANOVERWRITE] call CBA_settings_fnc_init;

["GW","show_nametags_key", "Show NameTags", {
	if (GVAR(useKeyBind)) then {
		GVAR(showNameTags) = true;
	};
	false
}, {
	if (GVAR(useKeyBind)) then {
		GVAR(showNameTags) = false;
	};
	false
}, [DIK_TAB, [false, false, false]], false] call CBA_fnc_addKeybind;
