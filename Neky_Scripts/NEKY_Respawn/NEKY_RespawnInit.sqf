//	[1,true] execVM "Scripts\NEKY_Respawn\NEKY_RespawnInit.sqf";
//	
//	1. Respawn limit (NUMBER), how many times you can respawn.
//	2. Systemchat messages (BOOL), Whether the script should send systemchats to players (entering and exiting spectator). True = yes, False = no.
//	
///////////
//	HOW TO
///////////
//	
//	1. Modify the code to your liking and put it in the init.sqf of your mission.
//	
//	2. If you want to reward players with extra respawns upon completing tasks, use the code below.
//	null = [1] execVM "Scripts\NEKY_Respawn\NEKY_AddLives.sqf";
//	
//	3. Place a marker where spectators will be placed/held while spectating (They wont be dead, they will have a visible unit in the mission) and name it NEKY_Respawn_Spectator.
//	3a. Make sure to place this marker on land, somewhere safe and preferably far away from the other players.
//	
//////////////
//	EXAMPLES
//////////////
//	
//	[("Respawn_Limit" call BIS_fnc_getParamValue),true] execVM "Scripts\NEKY_Respawn\NEKY_RespawnInit.sqf";
//	[3, true] execVM "Scripts\NEKY_Respawn\NEKY_RespawnInit.sqf";
//	

if !(HasInterface) exitWith {False};

Params
[
	["_Limit",false,[0,true]],
	["_Msg",true,[true]]
];

if ((TypeName _Limit) != "BOOL") then 
{
	[] execVM "Scripts\NEKY_Respawn\NEKY_AddEH.sqf";
	NEKY_Respawn_Msg = True;
	NEKY_Respawn_Limit = _Limit;
} else {
	NEKY_Respawn_Msg = False;
	NEKY_Respawn_Limit = False;
};