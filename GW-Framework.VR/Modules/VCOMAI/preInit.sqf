#include "scriptComponent.hpp"

//Compile all scripts that might be used
VCOMAI_AIHit = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_AIHit.sqf";
VCOMAI_ArmEmptyStatic = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_ArmEmptyStatic.sqf";
VCOMAI_Artillery = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_Artillery.sqf";
VCOMAI_ArtilleryCalled = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_ArtilleryCalled.sqf";
VCOMAI_BuildingCheck = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_BuildingCheck.sqf";
VCOMAI_BuildingSpawnCheck = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_BuildingSpawnCheck.sqf";
VCOMAI_CheckBag = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_CheckBag.sqf";
VCOMAI_CheckStatic = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_CheckStatic.sqf";
VCOMAI_Classvehicle = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_Classvehicle.sqf";
VCOMAI_ClosestAllyWarn = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_ClosestAllyWarn.sqf";
VCOMAI_ClosestEnemy = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_ClosestEnemy.sqf";
VCOMAI_ClosestObject = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_Closestobject.sqf";
VCOMAI_CombatMode = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_CombatMode.sqf";
VCOMAI_DebugText = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_DebugText.sqf";
VCOMAI_DefaultSetup = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_DefaultSetup.sqf";
VCOMAI_DeployUAV = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_DeployUAV.sqf";
VCOMAI_DestroyBuilding = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_DestroyBuilding.sqf";
VCOMAI_DetermineLeader = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_DetermineLeader.sqf";
VCOMAI_DetermineRank = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_DetermineRank.sqf";
VCOMAI_DriverCheck = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_DriverCheck.sqf";
VCOMAI_EnemyArray = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_EnemyArray.sqf";
VCOMAI_EraseMarkers = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_EraseMarkers.sqf";
VCOMAI_FindCoverPos = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_FindCoverPos.sqf";
VCOMAI_FlankManeuver = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_FlankManeuver.sqf";
VCOMAI_FocusedAccuracy = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_FocusedAccuracy.sqf";
VCOMAI_ForceHeal = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_ForceHeal.sqf";
VCOMAI_FormationChange = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_FormationChange.sqf";
VCOMAI_FragmentMove = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_FragmentMove.sqf";
VCOMAI_FriendlyArray = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_FriendlyArray.sqf";
VCOMAI_Garrison = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_Garrison.sqf";
VCOMAI_GarrisonClear = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_GarrisonClear.sqf";
VCOMAI_GarrisonClearPatrol = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_GarrisonClearPatrol.sqf";
VCOMAI_GroupLoiter = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_GroupLoiter.sqf";
VCOMAI_HasMine = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_HasMine.sqf";
VCOMAI_HearingAids = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_HearingAids.sqf";
VCOMAI_LightGarrison = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_LightGarrison.sqf";
VCOMAI_LoiterAction = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_LoiterAction.sqf";
VCOMAI_MapMarkers = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_MapMarkers.sqf";
VCOMAI_MoveInCombat = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_MoveInCombat.sqf";
VCOMAI_MoveToCover = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_MoveToCover.sqf";
VCOMAI_PackStatic = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_PackStatic.sqf";
VCOMAI_PlaceMine = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_PlaceMine.sqf";
VCOMAI_RankAndSkill = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_RankAndSkill.sqf";
VCOMAI_RearmGo = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_RearmGo.sqf";
VCOMAI_RearmSelf = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_RearmSelf.sqf";
VCOMAI_ReGroup = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_ReGroup.sqf";
VCOMAI_StanceModifier = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_StanceModifier.sqf";
VCOMAI_SuppressedEffect = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_SuppressedEffect.sqf";
VCOMAI_SuppressingShots = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_SuppressingShots.sqf";
VCOMAI_ThrowGrenade = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_ThrowGrenade.sqf";
VCOMAI_UnitInit = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_UnitInit.sqf";
VCOMAI_UnpackStatic = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_UnpackStatic.sqf";
VCOMAI_VehicleHandle = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_VehicleHandle.sqf";
VCOMAI_Waypointcheck = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_Waypointcheck.sqf";
VCOMAI_WepSupCheck = compile preprocessFileLineNumbers "Modules\VCOMAI\Functions\VCOMAI_WepSupCheck.sqf";

//Danger FSM
VCOMAI_CombatMovement = compile preprocessFileLineNumbers "Modules\VCOMAI\functions\DangerCauses\VCOMAI_CombatMovement.sqf";
VCOMAI_CurrentStance = compile preprocessFileLineNumbers "Modules\VCOMAI\functions\DangerCauses\VCOMAI_CurrentStance.sqf";
VCOMAI_DeadBodyDetection = compile preprocessFileLineNumbers "Modules\VCOMAI\functions\DangerCauses\VCOMAI_DeadBodyDetection.sqf";
VCOMAI_Explosiondetection = compile preprocessFileLineNumbers "Modules\VCOMAI\functions\DangerCauses\VCOMAI_Explosiondetection.sqf";
VCOMAI_MoveToCoverGroup = compile preprocessFileLineNumbers "Modules\VCOMAI\functions\DangerCauses\VCOMAI_MoveToCoverGroup.sqf";
VCOMAI_RecentEnemyDetected = compile preprocessFileLineNumbers "Modules\VCOMAI\functions\DangerCauses\VCOMAI_RecentEnemyDetected.sqf";
VCOMAI_SetCombatStance = compile preprocessFileLineNumbers "Modules\VCOMAI\functions\DangerCauses\VCOMAI_SetCombatStance.sqf";
VCOMAI_VehicleHandleDanger = compile preprocessFileLineNumbers "Modules\VCOMAI\functions\DangerCauses\VCOMAI_VehicleHandle.sqf";
//Global actions compiles
VCOMAI_3DText = compile "[_this select 0,_this select 1,_this select 2,_this select 3] call VCOMAI_DebugText;";
VCOMAI_playActionNowEverywhere = compileFinal "(_this select 0) playActionNow (_this select 1);";
VCOMAI_playMoveEverywhere = compileFinal "(_this select 0) playMoveNow (_this select 1);";
VCOMAI_PSup = compile "[] spawn VCOMAI_SuppressedEffect;";
VCOMAI_switchMoveEverywhere = compileFinal "(_this select 0) switchMove (_this select 1);";

VCOMAI_Adrenaline = true;	//Should AI/players be impacted by adrenaline? This provides players and AI with a small speed boost to animations to assist with cover seeking and positioning for a short time. Default = true;
VCOMAI_AdrenalineVar = 1.35;	//How much of a speed boost should players/AI recieve? Default = 1.35; (1 is ArmA's normal speed).
VCOMAI_AIDEBUG = 0;	//Turn this on to see certain debug messages. 1 is on
VCOMAI_AIDisembark = true;	//AI will automatically disembark from vehicles when in combat.
VCOMAI_AIMagLimit = 2;	//How low should an AI's mag count be for them to consider finding more ammo? This DOES NOT include the mag loaded in the gun already.
VCOMAI_AISkillEnabled = false;	//Variable for enabling/disabling skill changes for AI. True is on, False is off.
VCOMAI_Artillery = 0;	//Should AI be able to call for artillery. 1 = YES 0 = NO
VCOMAI_CurrentlyMovingLimit = 6;	//How many AI UNITS can be calculating cover positions at once?
VCOMAI_CurrentlySuppressingLimit = 12;	//How many AI UNITS can be suppressing others at once?
VCOMAI_GRENADECHANCE = 0;	//Chance of AI using grenades
VCOMAI_HEARINGDISTANCE = 500;	//How far can the AI hear gunshots from?
VCOMAI_IncreasingAccuracy = true;	//The longer an AI's target stays in 1 location, the more accurate and aware of the target the AI becomes.DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
VCOMAI_MineLayChance = 40;	//Chance of AI to lay a mine.
VCOMAI_MineLaying = true;	//Should the AI lay mines?
VCOMAI_NOAI_FOR_PLAYERLEADERS = 1;	//Turns off VCOMAI for AI units in a players squad
VCOMAI_NOPATHING = false;	//Should we let AI use flanking manuevers? false means they can flank
VCOMAI_RainImpact = true;	//Should the rain impact accuracy of AI? DEFAULT = true;
VCOMAI_RainPercent = 3;	//How much should rain impact the accuracy of AI? Default = 3. Default formula is -> _WeatherCheck = (rain)/3; "rain" is on a scale from 0 to 1. 1 Being very intense rain.
VCOMAI_STATICGARRISON = 1;	//Will AI garrison static weapons nearby?
VCOMAI_Suppression = true;	//Should AI and players have an additional layer of suppression that decreases aiming when suppressed? Default = true;
VCOMAI_SuppressionVar = 5;	//How much should suppression impact both AI and player aiming? Default is 5. Normal ArmA is 1.
VCOMAI_Unit_AIWarnDistance = 1000;	//Distance AI will respond to call of help from each other
VCOMAI_UseMarkers = false;	//Turn on map markers that track AI movement
VCOMAI_USESMOKE = true;	//Should AI use smoke grenades? Besides default A3 behavior?
VCOMAI_SideBasedMovement = [WEST,EAST,RESISTANCE];
VCOMAI_SideBasedExecution = [WEST,EAST,RESISTANCE];

//The following commands are to be left alone, except under rare circumstances.
VCOMAI_MarkerArray = [];
VCOMAI_ArtilleryArray = [];

VCOMAI_UnitQueue = [];
VCOMAI_ActiveList = [];
VCOMAI_ActivateAI = true;
VCOMAI_CurrentlyMoving = 0;
VCOMAI_CurrentlySuppressing = 0;

if (isNil QGVAR(Enabled)) then {
	GVAR(Enabled) = false;
};

["CAManBase", "init", {
	if (GVAR(Enabled)) then {
		[{
			params ["_unit"];
			if ((_unit getVariable ["NOAI",false]) || ((vehicle _unit) isKindOf "Plane")) then {
				_unit setvariable ["NOAI",true];
			} else {
				VCOMAI_ActiveList pushBack _unit;
				if (side _unit in VCOMAI_SideBasedExecution) then {
					[_unit] execFSM "Modules\VCOMAI\AIBEHAVIORNEW.fsm";
				};
			};
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	};
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "KILLED", {
	if (GVAR(Enabled)) then {
		[{
			params ["_unit"];
			VCOMAI_ActiveList deleteAt (VCOMAI_ActiveList find _unit);
		}, _this, 0.5] call CBA_fnc_waitAndExecute;
	};
}] call CBA_fnc_addClassEventHandler;
