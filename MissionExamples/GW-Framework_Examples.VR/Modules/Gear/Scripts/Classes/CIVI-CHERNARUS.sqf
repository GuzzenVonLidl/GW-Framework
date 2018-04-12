//	villager	- normal
//	worker		- nice cloths
//	farmer		- dirty cloths
//	officials	- police, paramedics etc

_goggles = selectRandom [""];
_helmet = selectRandom ["","CUP_H_C_Beret_01","CUP_H_C_Beret_02","CUP_H_C_Beret_03","CUP_H_C_Beret_04","CUP_H_C_Ushanka_01","CUP_H_C_Ushanka_02","CUP_H_C_Ushanka_03","CUP_H_C_Ushanka_04","CUP_H_C_Beanie_01","CUP_H_C_Beanie_02","CUP_H_C_Beanie_03","CUP_H_C_Beanie_04"];
_uniform = selectRandom ["CUP_U_C_Citizen_01","CUP_U_C_Citizen_02","CUP_U_C_Citizen_03","CUP_U_C_Citizen_04","CUP_U_C_Labcoat_02","CUP_U_C_Rocker_01","CUP_U_C_Rocker_02","CUP_U_C_Rocker_03","CUP_U_C_Rocker_04","CUP_U_C_Villager_01","CUP_U_C_Villager_02","CUP_U_C_Villager_03","CUP_U_C_Villager_04","CUP_U_C_Woodlander_01","CUP_U_C_Woodlander_02","CUP_U_C_Woodlander_03","CUP_U_C_Woodlander_04","CUP_U_C_Worker_01","CUP_U_C_Worker_02","CUP_U_C_Worker_03","CUP_U_C_Worker_04","CUP_U_C_Labcoat_01","CUP_U_C_Mechanic_01","CUP_U_C_Mechanic_02","CUP_U_C_Mechanic_03","CUP_U_C_Profiteer_02","CUP_U_C_Profiteer_01","CUP_U_C_Profiteer_04"];
_vest = selectRandom [""];
_backpack = selectRandom [""];

if (_uniform in ["CUP_U_C_Mechanic_01","CUP_U_C_Mechanic_02","CUP_U_C_Mechanic_03"]) then {
	_backpack = "CUP_C_EngineeringBag";
};

if ((random 1) > 0.7) then {
	_goggles = "";
	_helmet = "";
	_uniform = selectRandom ["CUP_U_C_Rescuer_01","CUP_U_C_Pilot_01","CUP_U_C_Policeman_01","CUP_U_C_Fireman_01"];
	_vest = "";
	_backpack = "";

	if ((toLower(_role)) isEqualTo "worker") then {
		_uniform = selectRandom ["CUP_U_C_Suit_01","CUP_U_C_Suit_02","CUP_U_C_Profiteer_02","CUP_U_C_Profiteer_03","CUP_U_C_Profiteer_01","CUP_U_C_Profiteer_04","CUP_U_C_Priest_01"];
	};

	if (_uniform isEqualTo "CUP_U_C_Policeman_01") then {
		_helmet = "CUP_H_C_Policecap_01";
	};

	if (_uniform isEqualTo "CUP_U_C_Fireman_01") then {
		_helmet = "CUP_H_C_Fireman_Helmet_01";
	};

	if (_uniform isEqualTo "CUP_U_C_Pilot_01") then {
		_helmet = "H_Cap_headphones";
	};
};
