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
 
 [Condor] call GW_AAC_Setup_fnc_detectCondor;
 
 // Main Switch
 switch (_side) do
 {
	case "OPFOR": //0: // OPFOR
	{
		switch (_opfor) do
		{
			case "CSAT-H":
			{
				GW_AAC_Setup_CondorAirframe = "JAS_VTOL_02_infantry_dynamicLoadout_F";
			};
			case "CSAT-W":
			{
				GW_AAC_Setup_CondorAirframe = "JAS_VTOL_02_infantry_dynamicLoadout_F";
			};
			case "CSAT-U":
			{
				GW_AAC_Setup_CondorAirframe = "JAS_VTOL_02_infantry_dynamicLoadout_F";
			};
			case "CSAT-V":
			{
				GW_AAC_Setup_CondorAirframe = "JAS_VTOL_02_infantry_dynamicLoadout_F";
			};
			case "RUSSIAN-W":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_O_AN2_TK";
			};
			case "SPETSNAZ":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_O_AN2_TK";
			};
			case "TAKIARMY-D":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_O_C130J_TKA";
			};
			case "SLA":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_O_C47_SLA";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_O_AN2_TK";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_O_AN2_TK";
			};
			case "CAMPAIGN-E":
			{
				GW_AAC_Setup_CondorAirframe = GW_Gear_CondorAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnCondor.sqf Main/OPFOR Switch";
			};
		};
	};
	case "BLUFOR": //1: // BLUFOR
	{
		switch (_blufor) do
		{
			case "NATO-D":
			{
				GW_AAC_Setup_CondorAirframe = "B_T_VTOL_01_infantry_F";
			};
			case "NATO-W":
			{
				GW_AAC_Setup_CondorAirframe = "B_T_VTOL_01_infantry_F";
			};
			case "NATO-CTRG":
			{
				GW_AAC_Setup_CondorAirframe = "B_T_VTOL_01_infantry_F";
			};
			case "BAF-D":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C130J_GB";
			};
			case "SAS":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C130J_GB";
			};
			case "USMC-D":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_MV22_USMC_RAMPGUN";
			};
			case "USMC-W":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_MV22_USMC_RAMPGUN";
			};
			case "MARSOC":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_MV22_USMC_RAMPGUN";
			};
			case "ACR":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "601STSFG":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "CDF-D":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "CDF-F":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "CDF-M":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "US-OCP":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C130J_USMC";
			};
			case "US-UCP":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C130J_USMC";
			};
			case "US-R":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C130J_USMC";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "SWAT":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "CAMPAIGN-GEORGIA":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_O_AN2_TK";
			};
			case "CAMPAIGN-W":
			{
				GW_AAC_Setup_CondorAirframe = GW_Gear_CondorAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnCondor.sqf Main/BLUFOR Switch";
			};
		};
	};
	case "INDEP": //2: // INDEP
	{
		switch (_indep) do
		{
			case "AAF-W":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_I_C130J_AAF";
			};
			case "PMC":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "RACS-MTP":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_C130J_RACS";
			};
			case "RACS-URB":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_C130J_RACS";
			};
			case "RACS-ADPM":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_C130J_RACS";
			};
			case "RACS-WDPM":
			{
				GW_AAC_Setup_RavenAirframe = "CUP_I_C130J_RACS";
			};
			case "SYND":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "UN":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "INSURGENT-D":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "INSURGENT-W":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "CAMPAIGN-601":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_I_C130J_RACS";
			};
			case "CAMPAIGN-AAF":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_I_C130J_AAF";
			};
			case "CAMPAIGN-RACS":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_I_C130J_RACS";
			};
			case "CAMPAIGN-CDF":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_I_C130J_RACS";
			};
			case "CAMPAIGN-ACR":
			{
				GW_AAC_Setup_CondorAirframe = "CUP_B_C47_USA";
			};
			case "CAMPAIGN-I":
			{
				GW_AAC_Setup_CondorAirframe = GW_Gear_CondorAirframe;
			};
			default
			{
				hint "CODE FAIL. spawnCondor.sqf Main/INDEP Switch";
			};
		};
	};
	default
	{
		hint "CODE FAIL. spawnCondor.sqf Main Switch";
	};
 };
 
 {
	_dir = getDir _x;
	_pad = "Land_HelipadCivil_F" createVehicle position _x;
	_pad setDir _dir;
	_veh = GW_AAC_Setup_CondorAirframe createVehicle position _x;
	_veh setDir _dir;
	deleteVehicle _x;
 }foreach GW_AAC_Setup_Condor;
 