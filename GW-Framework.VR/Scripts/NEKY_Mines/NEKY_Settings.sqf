//	https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
//	
//	Made by NeKo-ArroW

// General
_MineClass = ["IEDUrbanSmall_F"];								// IED class (visual model), randomly selected classname within array. Does not affect blast size or sensitivity.									Array of Strings
// _MineClass = ["CUP_IED_V1","CUP_IED_V2","CUP_IED_V3","CUP_IED_V4","IEDUrbanSmall_F"]; // CUP IEDs (modded) move // from the start of this line to the line above to use them.
_SensitivityM = [2.5,3]; 										// IED sensitivity (meters) for footsoldiers, randomly selected number within array.																Array of Numbers
_SensitivityV = [7,8,9];										// IED sensitivity (meters) for vehicles, randomly selected number within array.																	Array of Numbers
_FrequencyC = 0.5;												// Frequency (seconds) to scan for players near IED and trigger it.																					Number
_FrequencyF = 5;												// Frequency (seconds) to scan for players within 300m, will change to _FrequencyC when anyone is closer.											Number
_MineHealth = 0.2;												// Health of a mine (0.01 - 0.8), this decides how much damage it can take before exploding. Lower = less health, higher = more health.				Number
_SafeStances = [""];											// What stances the IED will *NOT* trigger from. 	["PRONE","CROUCH","STAND"]																		Array of Strings

// Explosives
_Small = "G_20mm_HE";											// Class name of item used for a small explosion.	Can be Projectile or Mine.																		String
_Medium = "G_40mm_HE";											// Class name of item used for a medium explosion.	Can be Projectile or Mine.																		String
_Large = "R_TBG32V_F";											// Class name of item used for a large explosion.	Can be Projectile or Mine.																		String
_Grenade = "GrenadeHand";										// Class name of item used for a grenade explosion (delayed, imagine a tripwire that pulls the pin).		Must be a grenade.						String
_MiniGrenade = "Mini_Grenade";									// Class name of item used for a small grenade explosion (delayed, imagine a tripwire that pulls the pin).	Must be a grenade.						String
_SelfDestruct = "G_20mm_HE";									// Class name of item used for when you destroy the IED by shooting at it.	Can be Projectile or Mine.												String
_RandomMines = ["small","small","small","medium","medium","large"];// IED types, randomly selected within array. 																									Array of Strings