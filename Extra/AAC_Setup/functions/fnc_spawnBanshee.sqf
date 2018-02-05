/*
 * Module Script that confirms the exercise requested and spawns the relevant aircraft
 * 
 */
 
 #include "..\script_Component.hpp"
 
 // Store Incoming Data
 //_dir = _this select 0;
 
 // Gather Relevant Variables
 //_side = getNumber(configfile >> "CfgVehicles" >> (typeOf _caller) >> "side"); // 0 = OPFOR, 1 = BLUFOR, 2 = INDEP, 3 = CIV
 _side = _this select 0;
 _blufor = GW_Gear_Blufor;
 _opfor = GW_Gear_Opfor;
 _indep = GW_Gear_Independent;
 
 [Banshee] call GW_AAC_Setup_fnc_detectBanshee;
 
 // Main Switch
 switch (_side) do
 {
	case "OPFOR": //0: // OPFOR
	{
		switch (_opfor) do
		{
			case "CSAT-H":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_Plane_Fighter_02_F_DYNO";
			};
			case "CSAT-W":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_Plane_Fighter_02_F_DYNO";
			};
			case "CSAT-U":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_Plane_Fighter_02_F_DYNO";
			};
			case "CSAT-V":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_Plane_Fighter_02_F_DYNO";
			};
			case "RUSSIAN-W":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_O_SU34_RU";
			};
			case "SPETSNAZ":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_O_SU34_RU";
			};
			case "TAKIARMY-D":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_O_L39_TK";
			};
			case "SLA":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_O_SU34_SLA";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_O_L39_TK";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_O_L39_TK";
			};
			case "CAMPAIGN-E":
			{
				GW_AAC_Setup_BansheeAirframe = GW_Gear_BansheeAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnBanshee.sqf Main/OPFOR Switch";
			};
		};
	};
	case "BLUFOR": //1: // BLUFOR
	{
		switch (_blufor) do
		{
			case "NATO-D":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_Plane_Fighter_01_Base_F_DYNO";
			};
			case "NATO-W":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_Plane_Fighter_01_Base_F_DYNO";
			};
			case "NATO-CTRG":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_Plane_Fighter_01_Base_F_DYNO";
			};
			case "BAF-D":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_F35B_RAF";
			};
			case "SAS":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_F35B_RAF";
			};
			case "USMC-D":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_F35B_USMC";
			};
			case "USMC-W":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_F35B_USMC";
			};
			case "MARSOC":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_F35B_USMC";
			};
			case "ACR":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_L39_CZ";
			};
			case "601STSFG":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_L39_CZ";
			};
			case "CDF-D":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_SU34_CDF";
			};
			case "CDF-F":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_SU34_CDF";
			};
			case "CDF-M":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_SU34_CDF";
			};
			case "US-OCP":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_F35B_USMC";
			};
			case "US-UCP":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_F35B_USMC";
			};
			case "US-R":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_F35B_USMC";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_L39_CZ";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_L39_CZ";
			};
			case "SWAT":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_L39_CZ";
			};
			case "CAMPAIGN-GEORGIA":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_O_Su25_RU_3";
			};
			case "CAMPAIGN-W":
			{
				GW_AAC_Setup_BansheeAirframe = GW_Gear_BansheeAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnBanshee.sqf Main/BLUFOR Switch";
			};
		};
	};
	case "INDEP": //2: // INDEP
	{
		switch (_indep) do
		{
			case "AAF-W":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_Plane_Fighter_04_F_DYNO";
			};
			case "PMC":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_I_L39_AAF";
			};
			case "RACS-MTP":
			{
				GW_AAC_Setup_RavenAirframe = "JAS_CUP_B_F35B_USMC";
			};
			case "RACS-URB":
			{
				GW_AAC_Setup_RavenAirframe = "JAS_CUP_B_F35B_USMC";
			};
			case "RACS-ADPM":
			{
				GW_AAC_Setup_RavenAirframe = "JAS_CUP_B_F35B_USMC";
			};
			case "RACS-WDPM":
			{
				GW_AAC_Setup_RavenAirframe = "JAS_CUP_B_F35B_USMC";
			};
			case "SYND":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_I_L39_AAF";
			};
			case "UN":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_I_L39_AAF";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_I_L39_AAF";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_I_L39_AAF";
			};
			case "CAMPAIGN-601":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_FIR_A143R_AAC";
			};
			case "CAMPAIGN-AAF":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_FIR_A143R";
			};
			case "CAMPAIGN-RACS":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_FIR_A143R";
			};
			case "CAMPAIGN-CDF":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_CUP_B_Su25_CDF";
			};
			case "CAMPAIGN-ACR":
			{
				GW_AAC_Setup_BansheeAirframe = "JAS_FIR_A143R";
			};
			case "CAMPAIGN-I":
			{
				GW_AAC_Setup_BansheeAirframe = GW_Gear_BansheeAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnBanshee.sqf Main/INDEP Switch";
			};
		};
	};
	default
	{
		hint "CODE FAIL. spawnBanshee.sqf Main Switch";
	};
 };
 
 {
	_dir = getDir _x;
	_pad = "Land_HelipadCivil_F" createVehicle position _x;
	_pad setDir _dir;
	_veh = GW_AAC_Setup_BansheeAirframe createVehicle position _x;
	_veh setDir _dir;
	deleteVehicle _x;
 }foreach GW_AAC_Setup_Banshee;
 