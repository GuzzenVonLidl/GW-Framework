#include "script_Component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[QGVARMAIN(playerReady), {
	private _enable = true;
	if (GVARMAIN(mod_ACE3)) then {
		_enable = false;
		if (ace_nametags_showPlayerNames isEqualTo 0) then {
			_enable = true;
		};
	};

	if (_enable) then {
		[] spawn {
			while {true} do {
				_closebyUnits = ((player nearObjects ["CAManBase", (GVAR(distance) * 2.5)]) - [player]);

				_closebyUnits = (_closebyUnits select {
					((side _x) isEqualTo playerSide) &&
					{((isPlayer _x) || !GVAR(playersOnly))} &&
					{(lineIntersectsSurfaces [(AGLtoASL (positionCameraToWorld [0,0,0])), (eyePos _x), player, _x]) isEqualTo []} &&
					{!isObjectHidden _x}
				});

				sleep 0.1;

				GVAR(filteredUnits) = _closebyUnits;
			};
		};

		addMissionEventHandler ["Draw3D", {
			if ((GVAR(useKeyBind) && GVAR(showNameTags)) || !GVAR(useKeyBind)) then {
				if ((alive player) && !(["IsSpectating"] call BIS_fnc_EGSpectator)) then {
					{
						_x call FUNC(drawNameTags);
					} forEach GVAR(filteredUnits);
				};
			};
		}];
	};
}] call CBA_fnc_addEventHandler;
