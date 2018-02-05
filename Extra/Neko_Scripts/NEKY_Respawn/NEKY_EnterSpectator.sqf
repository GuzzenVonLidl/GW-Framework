//	[] execVM "Scripts\NEKY_Respawn\NEKY_EnterSpectator.sqf";
//	
//	This sends the player in to spectator mode.
//	
//	

if !(HasInterface) exitWith {False};

if (NEKY_Respawn_Msg) then {Systemchat "You've run out of lives, sending you to spectator."};
Player setVariable ["NEKY_Respawn_Spectating",true];
sleep 5;

["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;

// Move respawned player to marker Spectator.
if !((getMarkerPos "NEKY_Respawn_Spectator") isEqualTo [0,0,0]) then
{
	WaitUntil {sleep 1; Alive Player};
	NEKY_Respawn_SpawnPos = getPosATL Player;
	Sleep 0.5;
	Player setPos (getMarkerPos "NEKY_Respawn_Spectator");
};