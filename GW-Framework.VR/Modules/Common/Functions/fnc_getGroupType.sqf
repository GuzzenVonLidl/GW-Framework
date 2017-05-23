/*	================================================================
	AUTHOR: GuzzenVonLidl
	Selects a new faction to spawn

	Usage:
	["NATO"] call GW_Common_Fnc_getGroup;

	Parameters:
	#0:	STRING - Name of the faction to select

	Returning Value: ARRAY
	#0: SIDE - Side of group
	#1: STRING - Classname of team leader
	#2: ARRAY - Classnames

	#define NO_SIDE -1
	#define EAST 0
	#define WEST 1
	#define RESISTANCE 2
	#define CIVILIAN 3
	#define NEUTRAL 4
	#define ENEMY 5
	#define FRIENDLY 6
	#define LOGIC 7

	Public: NO
// ================================================================ */
#include "..\scriptComponent.hpp"

params ["_faction"];
private ["_unitList","_side","_leader"];

switch (toUpper(_faction)) do {
	case "WEST": {
		_leader = "B_Soldier_TL_F";
		_unitList = ["B_Soldier_F","B_Soldier_GL_F","B_medic_F","B_soldier_AR_F"];
	};

	case "EAST": {
		_leader = "O_Soldier_TL_F";
		_unitList = ["O_Soldier_F","O_Soldier_GL_F","O_medic_F","O_soldier_AR_F"];
	};

	case "INDEPENDENT": {
		_leader = "I_Soldier_TL_F";
		_unitList = ["I_Soldier_F","I_Soldier_GL_F","I_medic_F","I_soldier_AR_F"];
	};

	case "CIVILIAN": {
		_leader = "C_man_1";
		_unitList = ["C_Man_casual_4_F","C_Man_casual_5_F","C_Man_casual_6_F"];
	};
};

switch ((configfile >> "CfgVehicles" >> _leader >> "side") call BIS_fnc_getCfgData) do {
	case 0: {
		_side = east;
	};
	case 1: {
		_side = west;
	};
	case 2: {
		_side = resistance;
	};
	case 3: {
		_side = civilian;
	};
};

[_side, _leader, _unitList]
