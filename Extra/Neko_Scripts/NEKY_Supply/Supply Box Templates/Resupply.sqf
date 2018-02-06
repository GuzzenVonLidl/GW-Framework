//	[_Box] execVM "Scripts\NEKY_supply\NEKY_SupplyBox.sqf";
//	
//	Template
//	
//	This is a template for a customized supply box.

if !(isServer) exitWith {False};

Private "_Box";

_Box = [_This, 0, ObjNull, [ObjNull]] call BIS_fnc_Param;

// Clear Box
ClearItemCargoGlobal _Box;
ClearWeaponCargoGlobal _Box;
ClearBackPackCargoGlobal _Box;
ClearMagazineCargoGLobal _Box;
sleep 0.5;

// Add Items
_Box addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag", 50];
_Box addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red", 50];
_Box addMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 30];
_Box addWeaponCargoGlobal ["rhs_weap_M136",5];
_Box AddBackPackCargoGlobal ["B_HMG_01_support_high_F",1]; _Box AddBackPackCargoGlobal ["B_HMG_01_high_weapon_F",1]; // HMG Raised
_Box AddBackPackCargoGlobal ["B_HMG_01_support_high_F",1]; _Box AddBackPackCargoGlobal ["B_HMG_01_high_weapon_F",1]; // HMG Raised
_Box addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
_Box addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 10];
_Box addMagazineCargoGlobal ["HandGrenade", 10];
_Box addMagazineCargoGlobal ["MiniGrenade", 10];
_Box addMagazineCargoGlobal ["SmokeShell", 10];
