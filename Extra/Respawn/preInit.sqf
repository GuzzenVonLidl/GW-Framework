#include "script_Component.hpp"

PREP(getRespawns);
PREP(revive);

GVAR(ServerConnections) = [];
GVAR(ServerDead) = [];
GVAR(ServerDeadPermanent) = [];
GVAR(IsSpectator) = {
	(["IsSpectating"] call BIS_fnc_EGSpectator)
};

[
	QGVAR(Mode), "LIST",
	["Respawn Type", "How respawns are handeled"],
	QUOTE(ADDON), [[0,1,2], ["Normal (No limits)", "Player Tickets", "Team Tickets"], 0], CBA_SERVEROVERWRITE
] call FUNCMAIN(settingsInit);

[
	QGVAR(Count), "LIST",
	["Player Respawns", "Amount of respawns each player gets"],
	QUOTE(ADDON), [[0,2,3,4,5,6,7,8], ["No Respawns","1","2","3","4","5","6","7"], 0], CBA_SERVEROVERWRITE
] call FUNCMAIN(settingsInit);

[
	QGVAR(CountTeamWest), "LIST",
	["Team Respawns West", "Total amount of respawns allowed per side"],
	QUOTE(ADDON), [[0,5,10,20,30,40,50,60,70,80,90,100], ["No Respawns","5","10","20","30","40","50","60","70","80","90","100"], 0], CBA_SERVEROVERWRITE
] call FUNCMAIN(settingsInit);

[
	QGVAR(CountTeamEast), "LIST",
	["Team Respawns East", "Total amount of respawns allowed per side"],
	QUOTE(ADDON), [[0,5,10,20,30,40,50,60,70,80,90,100], ["No Respawns","5","10","20","30","40","50","60","70","80","90","100"], 0], CBA_SERVEROVERWRITE
] call FUNCMAIN(settingsInit);

[
	QGVAR(CountTeamIndependent), "LIST",
	["Team Respawns Independent", "Total amount of respawns allowed per side"],
	QUOTE(ADDON), [[0,5,10,20,30,40,50,60,70,80,90,100], ["No Respawns","5","10","20","30","40","50","60","70","80","90","100"], 0], CBA_SERVEROVERWRITE
] call FUNCMAIN(settingsInit);

[
	QGVAR(JIP), "LIST",
	["Join in progress", ""],
	QUOTE(ADDON), [[true,false], ["enabled","disabled"], 0], CBA_SERVEROVERWRITE
] call FUNCMAIN(settingsInit);

if (is3DEN) then {
	if !(isNil QGVAR(3denEH)) then {
		remove3DENEventHandler ["OnMessage", GVAR(3denEH)];
		GVAR(3denEH) = nil;
	};
	GVAR(3denEH) = add3DENEventHandler ["OnMessage",{
		if (!("spectator" in (all3DENEntities select 5))) then {
			["Warning Spectator marker is missing, Create a new marker and name it 'spectator', place it on land and out of AO",'I understand'] call BIS_fnc_3DENShowMessage;
		};
	}];
};
