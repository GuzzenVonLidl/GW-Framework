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
 
 [Giant] call GW_AAC_Setup_fnc_detectGiant;
 
 // Main Switch
 switch (_side) do
 {
	case "OPFOR": //0: // OPFOR
	{
		switch (_opfor) do
		{
			case "CSAT-H":
			{
				GW_AAC_Setup_GiantAirframe = "O_Heli_Transport_04_covered_F";
			};
			case "CSAT-W":
			{
				GW_AAC_Setup_GiantAirframe = "O_Heli_Transport_04_covered_F";
			};
			case "CSAT-U":
			{
				GW_AAC_Setup_GiantAirframe = "O_Heli_Transport_04_covered_F";
			};
			case "CSAT-V":
			{
				GW_AAC_Setup_GiantAirframe = "O_Heli_Transport_04_covered_F";
			};
			case "RUSSIAN-W":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi8_RU";
			};
			case "SPETSNAZ":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi8_RU";
			};
			case "TAKIARMY-D":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi17_TK";
			};
			case "SLA":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi8_SLA_2";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi8_SLA_2";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi8_SLA_2";
			};
			case "CAMPAIGN-E":
			{
				GW_AAC_Setup_GiantAirframe = GW_Gear_GiantAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnGiant.sqf Main/OPFOR Switch";
			};
		};
	};
	case "BLUFOR": //1: // BLUFOR
	{
		switch (_blufor) do
		{
			case "NATO-D":
			{
				GW_AAC_Setup_GiantAirframe = "B_Heli_Transport_03_F";
			};
			case "NATO-W":
			{
				GW_AAC_Setup_GiantAirframe = "B_Heli_Transport_03_F";
			};
			case "NATO-CTRG":
			{
				GW_AAC_Setup_GiantAirframe = "B_CTRG_Heli_Transport_01_tropic_F";
			};
			case "BAF-D":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_Merlin_HC3_GB_Armed";
			};
			case "SAS":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_Merlin_HC3_GB_Armed";
			};
			case "USMC-D":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_CH53E_USMC";
			};
			case "USMC-W":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_CH53E_USMC";
			};
			case "MARSOC":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_MH60L_DAP_4x_AT_USN";
			};
			case "ACR":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_Mi171Sh_ACR";
			};
			case "601STSFG":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_Mi171Sh_ACR";
			};
			case "CDF-D":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_Mi17_CDF";
			};
			case "CDF-F":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_Mi17_CDF";
			};
			case "CDF-M":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_Mi17_CDF";
			};
			case "US-OCP":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_CH47F_USA";
			};
			case "US-UCP":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_CH47F_USA";
			};
			case "US-R":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_MH60L_DAP";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi8_SLA_2";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi8_SLA_2";
			};
			case "SWAT":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_UH60M_Unarmed_FFV_US";
			};
			case "CAMPAIGN-GEORGIA":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi8_RU";
			};
			case "CAMPAIGN-W":
			{
				GW_AAC_Setup_GiantAirframe = GW_Gear_GiantAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnGiant.sqf Main/BLUFOR Switch";
			};
		};
	};
	case "INDEP": //2: // INDEP
	{
		switch (_indep) do
		{
			case "AAF-W":
			{
				GW_AAC_Setup_GiantAirframe = "I_Heli_Transport_02_F";
			};
			case "PMC":
			{
				GW_AAC_Setup_GiantAirframe = "CUP_I_Ka60_GL_Blk_ION";
			};
			case "RACS-MTP":
			{
				GW_AAC_Setup_RavenAirframe = "JAS_CUP_I_CH47F_RACS";
			};
			case "RACS-URB":
			{
				GW_AAC_Setup_RavenAirframe = "JAS_CUP_I_CH47F_RACS";
			};
			case "RACS-ADPM":
			{
				GW_AAC_Setup_RavenAirframe = "JAS_CUP_I_CH47F_RACS";
			};
			case "RACS-WDPM":
			{
				GW_AAC_Setup_RavenAirframe = "JAS_CUP_I_CH47F_RACS";
			};
			case "SYND":
			{
				GW_AAC_Setup_GiantAirframe = "I_C_Heli_Light_01_civil_F";
			};
			case "UN":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_I_Mi17_UN";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi8_SLA_2";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_O_Mi8_SLA_2";
			};
			case "CAMPAIGN-601":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_B_Mi171Sh_ACR";
			};
			case "CAMPAIGN-AAF":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_I_Mi17_UN";
			};
			case "CAMPAIGN-RACS":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_I_Mi17_UN";
			};
			case "CAMPAIGN-CDF":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_I_Mi17_UN";
			};
			case "CAMPAIGN-ACR":
			{
				GW_AAC_Setup_GiantAirframe = "JAS_CUP_I_Mi17_UN";
			};
			case "CAMPAIGN-I":
			{
				GW_AAC_Setup_GiantAirframe = GW_Gear_GiantAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnGiant.sqf Main/INDEP Switch";
			};
		};
	};
	default
	{
		hint "CODE FAIL. spawnGiant.sqf Main Switch";
	};
 };
 
 {
	_dir = getDir _x;
	_pad = "Land_HelipadCivil_F" createVehicle position _x;
	_pad setDir _dir;
	_veh = GW_AAC_Setup_GiantAirframe createVehicle position _x;
	_veh setDir _dir;
	deleteVehicle _x;
 }foreach GW_AAC_Setup_Giant;
 