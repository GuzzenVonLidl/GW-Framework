//	#include "NEKY_Settings.sqf"
//	
//	Settings file for NEKY_BombingRun.sqf

Private ["_Plane","_Pilot","_Bomb"];

// Plane and pilot settings
Switch (_Side) do
{
	case WEST:										// BLUFOR
	{
		_Plane = "B_Plane_CAS_01_F";
		_Pilot = "B_Pilot_F";
	};
	case EAST:										// OPFOR
	{
		_Plane = "O_Plane_CAS_02_F";
		_Pilot = "O_Pilot_F";
	};
	case INDEPENDENT:								// INDEPENDENT
	{
		_Plane = "I_Plane_Fighter_03_CAS_F";
		_Pilot = "I_pilot_F";
	};
	default {systemChat "Incorrect side"};
};

// Bomb Types
Switch (_BombType) do
{
	case "bomb": {_Bomb = "Bomb_04_F"};				// Type of bombs when using a basic bomb.
	case "clusterbomb": {_Bomb = "G_40mm_HE"};		// Type of bombs when using a cluster bomb.
	case "firebomb": {_Bomb = "Bomb_04_F"};			// Type of bombs when using a fire bomb. 
	default {SystemChat "Incorrect Bomb Type"};
};

// General Settings
_Daytime = 04.30;									// When daytime begins and mark target with smokes.
_NightTime = 19.30;									// When nightime begins and mark target with flares.
_MarkFlare = "F_40mm_Red";							// Flare used when marking target area.
_MarkSmoke = "SmokeShellRed";						// Smoke grenade used when marking target area.

// Firebomb specific settings
_FireDamage = [0.5, 15, 0.1];						// The damage the fire will cause to nearby players. [coreIntensity, coreDistance, damageTick]