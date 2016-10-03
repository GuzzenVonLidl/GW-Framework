#include "scriptComponent.hpp"

if !(GVARMAIN(mod_ACE3)) exitWith {false};

ACE_MaxWeightDrag = 100000;
ACE_MaxWeightCarry = 10000;

if (GVAR(medical_level) isEqualTo 2) then {
	ACE_Medical_level = 2;
	ACE_Medical_medicSetting = 2;
	ACE_Medical_increaseTrainingInLocations = false;
	ACE_Medical_enableFor = 0;
	ACE_Medical_enableOverdosing = true;
	ACE_Medical_bleedingCoefficient = 0.5;
	ACE_Medical_painCoefficient = 4;
	ACE_Medical_enableAirway = false;
	ACE_Medical_enableFractures = false;
	ACE_Medical_enableAdvancedWounds = false;
	ACE_Medical_enableVehicleCrashes = true;
	ACE_Medical_enableScreams = true;
	ACE_Medical_playerDamageThreshold = 1.5;
	ACE_Medical_AIDamageThreshold = 1;
	ACE_Medical_enableUnconsciousnessAI = 0;
	ACE_Medical_remoteControlledAI = false;
	ACE_Medical_preventInstaDeath = false;
	ACE_Medical_allowDeadBodyMovement = false;
	ACE_Medical_allowLitterCreation = true;
	ACE_Medical_litterSimulationDetail = 2;
	ACE_Medical_litterCleanUpDelay = 900;
	ACE_Medical_medicSetting_basicEpi = 0;
	ACE_Medical_medicSetting_PAK = 0;
	ACE_Medical_medicSetting_SurgicalKit = 0;
	ACE_Medical_consumeItem_PAK = 1;
	ACE_Medical_consumeItem_SurgicalKit = 0;
	ACE_Medical_useLocation_basicEpi = 0;
	ACE_Medical_useLocation_PAK = 0;
	ACE_Medical_useLocation_SurgicalKit = 0;
	ACE_Medical_useCondition_PAK = 0;
	ACE_Medical_useCondition_SurgicalKit = 1;
	ACE_Medical_keepLocalSettingsSynced = true;
	ACE_Medical_healHitPointAfterAdvBandage = 1;
	ACE_Medical_painIsOnlySuppressed = true;
	ACE_Medical_painEffectType = 0;
	ACE_Medical_allowUnconsciousAnimationOnTreatment = false;
	ACE_Medical_moveUnitsFromGroupOnUnconscious = false;
	ACE_Medical_menuTypeStyle = 0;
	ACE_Medical_delayUnconCaptive = 3;

	ACE_Medical_enableRevive = 0;
	ACE_Medical_maxReviveTime = 120;
	ACE_Medical_amountOfReviveLives = -1;

	ACE_Medical_menu_allow = 2;
	ACE_Medical_menu_useMenu = 2;
	ACE_Medical_menu_openAfterTreatment = 1;
	ACE_Medical_menu_maxRange = 3;

	ACE_Medical_ai_enabledFor = 2;
	ACE_Medical_blood_enabledFor = 1;
};
