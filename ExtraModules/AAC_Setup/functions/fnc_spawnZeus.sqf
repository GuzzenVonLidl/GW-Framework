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
 
 [Zeus] call GW_AAC_Setup_fnc_detectZeus;
 
 // Main Switch
 switch (_side) do
 {
	case "OPFOR": //0: // OPFOR
	{
		switch (_opfor) do
		{
			case "CSAT-H":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_O_Heli_Attack_02_dynamicLoadout_F";
			};
			case "CSAT-W":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_O_Heli_Attack_02_dynamicLoadout_F";
			};
			case "CSAT-U":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_O_Heli_Attack_02_dynamicLoadout_F";
			};
			case "CSAT-V":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_O_Heli_Attack_02_dynamicLoadout_F";
			};
			case "RUSSIAN-W":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_O_Mi24_V_RU";
			};
			case "SPETSNAZ":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_O_Mi24_V_RU";
			};
			case "TAKIARMY-D":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_O_Mi24_D_TK";
			};
			case "SLA":
			{
				GW_AAC_Setup_ZeusAirframe = "CUP_O_Mi24_D_SLA";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_ZeusAirframe = "CUP_O_Mi24_D_SLA";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_ZeusAirframe = "CUP_O_Mi24_D_SLA";
			};
			case "CAMPAIGN-E":
			{
				GW_AAC_Setup_ZeusAirframe = GW_Gear_ZeusAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnAngel.sqf Main/OPFOR Switch";
			};
		};
	};
	case "BLUFOR": //1: // BLUFOR
	{
		switch (_blufor) do
		{
			case "NATO-D":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_B_RAH66_DYNO_F";
			};
			case "NATO-W":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_B_RAH66_DYNO_F";
			};
			case "NATO-CTRG":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_B_RAH66_DYNO_F";
			};
			case "BAF-D":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_AH1_BAF";
			};
			case "SAS":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_AH1_BAF";
			};
			case "USMC-D":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_AH1Z_USMC";
			};
			case "USMC-W":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_AH1Z_USMC";
			};
			case "MARSOC":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_AH1Z_USMC";
			};
			case "ACR":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_Mi35_CZ";
			};
			case "601STSFG":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_Mi35_CZ";
			};
			case "CDF-D":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_Mi24_D_CDF";
			};
			case "CDF-F":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_Mi24_D_CDF";
			};
			case "CDF-M":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_Mi24_D_CDF";
			};
			case "US-OCP":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_AH64D_USA";
			};
			case "US-UCP":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_AH64D_USA";
			};
			case "US-R":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_AH64D_USA";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_ZeusAirframe = "CUP_O_Mi24_D_SLA";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_ZeusAirframe = "CUP_O_Mi24_D_SLA";
			};
			case "SWAT":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_AH6M_USA";
			};
			case "CAMPAIGN-GEORGIA":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_O_Mi24_V_RU";
			};
			case "CAMPAIGN-W":
			{
				GW_AAC_Setup_ZeusAirframe = GW_Gear_ZeusAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnAngel.sqf Main/BLUFOR Switch";
			};
		};
	};
	case "INDEP": //2: // INDEP
	{
		switch (_indep) do
		{
			case "AAF-W":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_I_Mi24_D_AAF";
			};
			case "PMC":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_I_Mi24_Mk4_ION";
			};
			case "RACS-MTP":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_AH6J_RACS";
			};
			case "RACS-URB":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_AH6J_RACS";
			};
			case "RACS-ADPM":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_AH6J_RACS";
			};
			case "RACS-WDPM":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_AH6J_RACS";
			};
			case "SYND":
			{
				GW_AAC_Setup_ZeusAirframe = "CUP_O_Ka60_Grey_RU";
			};
			case "UN":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_I_Mi24_D_UN";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_ZeusAirframe = "CUP_O_Mi24_D_SLA";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_ZeusAirframe = "CUP_O_Mi24_D_SLA";
			};
			case "CAMPAIGN-601":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_B_Mi35_CZ";
			};
			case "CAMPAIGN-AAF":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_I_Mi24_D_UN";
			};
			case "CAMPAIGN-RACS":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_I_Mi24_D_UN";
			};
			case "CAMPAIGN-CDF":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_I_Mi24_D_UN";
			};
			case "CAMPAIGN-ACR":
			{
				GW_AAC_Setup_ZeusAirframe = "JAS_CUP_I_Mi24_D_UN";
			};
			case "CAMPAIGN-I":
			{
				GW_AAC_Setup_ZeusAirframe = GW_Gear_ZeusAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnAngel.sqf Main/INDEP Switch";
			};
		};
	};
	default
	{
		hint "CODE FAIL. spawnAngel.sqf Main Switch";
	};
 };
 
 {
	_dir = getDir _x;
	_pad = "Land_HelipadCivil_F" createVehicle position _x;
	_pad setDir _dir;
	_veh = GW_AAC_Setup_ZeusAirframe createVehicle position _x;
	_veh setDir _dir;
	deleteVehicle _x;
 }foreach GW_AAC_Setup_Zeus;
 