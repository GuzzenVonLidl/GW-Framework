//	null = [number] execVM "Scripts\NEKY_Respawn\NEKY_AddLives.sqf";
//	
//	1. Number, Number of lives to add to all players.
//	
//	

if !(HasInterface) exitWith {False};

Params
[
	["_Lives",0,[0]]
];

NEKY_Respawn_Limit = NEKY_Respawn_Limit + _Lives;

if (Player getVariable ["NEKY_Respawn_Spectating",false]) then {[] execVM "Scripts\NEKY_Respawn\NEKY_ExitSpectator.sqf"};