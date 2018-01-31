//	[] execVM "Scripts\NEKY_Respawn\NEKY_AddEH.sqf";
//	
//	This adds the eventhandler to the unit and count respawns.
//	
//	

if !(HasInterface) exitWith {False};

NEKY_RespawnNumber = 0;
Player addEventhandler ["Killed",
{
	NEKY_RespawnNumber = NEKY_RespawnNumber +1;
	if (NEKY_RespawnNumber > NEKY_Respawn_Limit) then 
	{
		[] execVM "Scripts\NEKY_Respawn\NEKY_EnterSpectator.sqf";
	} else {
		SystemChat Format ["You have %1 respawn(s) remaining.",NEKY_Respawn_Limit - NEKY_RespawnNumber]
	};
}];