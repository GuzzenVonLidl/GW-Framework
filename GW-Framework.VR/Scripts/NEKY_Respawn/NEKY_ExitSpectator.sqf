//	[] execVM "Scripts\NEKY_Respawn\NEKY_ExitSpectator.sqf";
//	
//	This exits the spectator in case the player gets more respawns.
//	
//	

if !(HasInterface) exitWith {False};

if (NEKY_Respawn_Msg) then {Systemchat Format ["Respawning... respawns remaining: %1.",((NEKY_Respawn_Limit - NEKY_RespawnNumber)+1)]};
Player setVariable ["NEKY_Respawn_Spectating",false];
Sleep 5;

if ((Player distance (GetMarkerPos "NEKY_Respawn_Spectator")) < 20) then {Player setPosATL NEKY_Respawn_SpawnPos};
["Terminate"] call BIS_fnc_EGSpectator;