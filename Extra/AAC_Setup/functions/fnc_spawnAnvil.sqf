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
 
 [Anvil] call GW_AAC_Setup_fnc_detectAnvil;
 
 // Main Switch
 switch (_side) do
 {
	case "OPFOR": //0: // OPFOR
	{
		switch (_opfor) do
		{
			case "CSAT-H":
			{
				GW_AAC_Setup_AnvilAirframe = "O_MBT_02_cannon_F";
			};
			case "CSAT-W":
			{
				GW_AAC_Setup_AnvilAirframe = "O_T_MBT_02_cannon_ghex_F";
			};
			case "CSAT-U":
			{
				GW_AAC_Setup_AnvilAirframe = "O_MBT_02_cannon_F";
			};
			case "CSAT-V":
			{
				GW_AAC_Setup_AnvilAirframe = "O_T_MBT_02_cannon_ghex_F";
			};
			case "RUSSIAN-W":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_O_T90_RU";
			};
			case "SPETSNAZ":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_O_T90_RU";
			};
			case "TAKIARMY-D":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_O_T72_TKA";
			};
			case "SLA":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_O_T72_SLA";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_O_BMP2_SLA";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_O_BMP2_SLA";
			};
			case "CAMPAIGN-E":
			{
				GW_AAC_Setup_AnvilAirframe = GW_Gear_AnvilAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnAnvil.sqf Main/OPFOR Switch";
			};
		};
	};
	case "BLUFOR": //1: // BLUFOR
	{
		switch (_blufor) do
		{
			case "NATO-D":
			{
				GW_AAC_Setup_AnvilAirframe = "B_MBT_01_TUSK_F";
			};
			case "NATO-W":
			{
				GW_AAC_Setup_AnvilAirframe = "B_T_MBT_01_TUSK_F";
			};
			case "NATO-CTRG":
			{
				GW_AAC_Setup_AnvilAirframe = "B_T_MBT_01_TUSK_F";
			};
			case "BAF-D":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_Challenger2_2CW_BAF";
			};
			case "SAS":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_Challenger2_2CW_BAF";
			};
			case "USMC-D":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_M1A2_TUSK_MG_DES_USMC";
			};
			case "USMC-W":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_M1A2_TUSK_MG_USMC";
			};
			case "MARSOC":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_M1A2_TUSK_MG_USMC";
			};
			case "ACR":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_T72_CZ";
			};
			case "601STSFG":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_T72_CZ";
			};
			case "CDF-D":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_T72_CDF";
			};
			case "CDF-F":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_T72_CDF";
			};
			case "CDF-M":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_T72_CDF";
			};
			case "US-OCP":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_M1A2_TUSK_MG_DES_US_Army";
			};
			case "US-UCP":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_M1A2_TUSK_MG_US_Army";
			};
			case "US-R":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_M1A2_TUSK_MG_DES_US_Army";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_BMP2_CDF";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_BMP2_CDF";
			};
			case "SWAT":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_M1128_MGS_Woodland";
			};
			case "CAMPAIGN-GEORGIA":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_O_T72_RU";
			};
			case "CAMPAIGN-W":
			{
				GW_AAC_Setup_AnvilAirframe = GW_Gear_AnvilAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnAnvil.sqf Main/BLUFOR Switch";
			};
		};
	};
	case "INDEP": //2: // INDEP
	{
		switch (_indep) do
		{
			case "AAF-W":
			{
				GW_AAC_Setup_AnvilAirframe = "I_MBT_03_cannon_F";
			};
			case "PMC":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_M1128_MGS_Woodland";
			};
			case "RACS-MTP":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_M60A3_RACS";
			};
			case "RACS-URB":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_M60A3_RACS";
			};
			case "RACS-ADPM":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_M60A3_RACS";
			};
			case "RACS-WDPM":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_M60A3_RACS";
			};
			case "SYND":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_I_T34_NAPA";
			};
			case "UN":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_I_BMP2_UN";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_I_T34_NAPA";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_I_T34_NAPA";
			};
			case "CAMPAIGN-601":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_B_T72_CZ";
			};
			case "CAMPAIGN-AAF":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_I_BMP2_UN";
			};
			case "CAMPAIGN-RACS":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_I_M113_UN";
			};
			case "CAMPAIGN-CDF":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_I_BMP2_UN";
			};
			case "CAMPAIGN-ACR":
			{
				GW_AAC_Setup_AnvilAirframe = "CUP_I_BMP2_UN";
			};
			case "CAMPAIGN-I":
			{
				GW_AAC_Setup_AnvilAirframe = GW_Gear_AnvilAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnAnvil.sqf Main/INDEP Switch";
			};
		};
	};
	default
	{
		hint "CODE FAIL. spawnAnvil.sqf Main Switch";
	};
 };
 
 {
	_dir = getDir _x;
	_pad = "Land_HelipadCivil_F" createVehicle position _x;
	_pad setDir _dir;
	_veh = GW_AAC_Setup_AnvilAirframe createVehicle position _x;
	_veh setDir _dir;
	deleteVehicle _x;
 }foreach GW_AAC_Setup_Anvil;
 