#include "scriptComponent.hpp"

//Compile all scripts that might be used
PREP(AIHit);
PREP(ArmEmptyStatic);
PREP(Artillery);
PREP(ArtilleryCalled);
PREP(BuildingCheck);
PREP(BuildingSpawnCheck);
PREP(CheckBag);
PREP(CheckStatic);
PREP(Classvehicle);
PREP(ClosestAllyWarn);
PREP(ClosestEnemy);
PREP(ClosestObject);
PREP(CombatMode);
PREP(DebugText);
PREP(DefaultSetup);
PREP(DeployUAV);
PREP(DestroyBuilding);
PREP(DetermineLeader);
PREP(DetermineRank);
PREP(DriverCheck);
PREP(EnemyArray);
PREP(EraseMarkers);
PREP(FindCoverPos);
PREP(FlankManeuver);
PREP(FocusedAccuracy);
PREP(ForceHeal);
PREP(FormationChange);
PREP(FragmentMove);
PREP(FriendlyArray);
PREP(Garrison);
PREP(GarrisonClear);
PREP(GarrisonClearPatrol);
PREP(GroupLoiter);
PREP(HasMine);
PREP(HearingAids);
PREP(LightGarrison);
PREP(LoiterAction);
PREP(MapMarkers);
PREP(MoveInCombat);
PREP(MoveToCover);
PREP(PackStatic);
PREP(PlaceMine);
PREP(RankAndSkill);
PREP(RearmGo);
PREP(RearmSelf);
PREP(ReGroup);
PREP(StanceModifier);
PREP(SuppressedEffect);
PREP(SuppressingShots);
PREP(ThrowGrenade);
PREP(UnitInit);
PREP(UnpackStatic);
PREP(VehicleHandle);
PREP(Waypointcheck);
PREP(WepSupCheck);

//Danger FSM
PREP_SUB(CombatMovement);
PREP_SUB(CurrentStance);
PREP_SUB(DeadBodyDetection);
PREP_SUB(Explosiondetection);
PREP_SUB(MoveToCoverGroup);
PREP_SUB(RecentEnemyDetected);
PREP_SUB(SetCombatStance);
PREP_SUB(VehicleHandleDanger);

//Global actions compiles
VCOMAI_3DText = compile "[_this select 0,_this select 1,_this select 2,_this select 3] call VCOMAI_DebugText;";
VCOMAI_playActionNowEverywhere = compileFinal "(_this select 0) playActionNow (_this select 1);";
VCOMAI_playMoveEverywhere = compileFinal "(_this select 0) playMoveNow (_this select 1);";
VCOMAI_PSup = compile "[] spawn VCOMAI_SuppressedEffect;";
VCOMAI_switchMoveEverywhere = compileFinal "(_this select 0) switchMove (_this select 1);";

//The following commands are to be left alone, except under rare circumstances.
if (isNil QGVAR(Enabled)) then {
	GVAR(Enabled) = false;
};

VCOMAI_ArtilleryArray = [];
VCOMAI_MarkerArray = [];
VCOMAI_CurrentlyMoving = 0;
VCOMAI_CurrentlySuppressing = 0;

VCOMAI_AIDEBUG = 0;						//	Turn this on to see certain debug messages. 1 is on
VCOMAI_AISkillEnabled = false;			//	Variable for enabling/disabling skill changes for AI. True is on, False is off.
VCOMAI_CurrentlyMovingLimit = 6;		//	How many AI UNITS can be calculating cover positions at once?
VCOMAI_CurrentlySuppressingLimit = 12;	//	How many AI UNITS can be suppressing others at once?
VCOMAI_NOAI_FOR_PLAYERLEADERS = 1;		//	Turns off VCOMAI for AI units in a players squad
VCOMAI_UseMarkers = false;				//	Turn on map markers that track AI movement
VCOMAI_SideBasedExecution = [WEST,EAST,RESISTANCE];
VCOMAI_SideBasedMovement = [WEST,EAST,RESISTANCE];

//The following commands can be edited to enhance each mission.
VCOMAI_Adrenaline = true;				//	Should AI/players be impacted by adrenaline?
VCOMAI_AdrenalineVar = 1.35;			//	How much of a speed boost should players/AI recieve? Default = 1.35; (1 is ArmA's normal speed).
VCOMAI_AIDisembark = true;				//	AI will automatically disembark from vehicles when in combat.
VCOMAI_AIMagLimit = 2;					//	How low should an AI's mag count be for them to consider finding more ammo? This DOES NOT include the mag loaded in the gun already.
VCOMAI_Artillery = 0;					//	Should AI be able to call for artillery. 1 = YES 0 = NO
VCOMAI_GRENADECHANCE = 10;				//	Chance of AI using grenades
VCOMAI_HEARINGDISTANCE = 1000;			//	How far can the AI hear gunshots from?
VCOMAI_IncreasingAccuracy = true;		//	The longer an AI's target stays in 1 location, the more accurate and aware of the target the AI becomes.
VCOMAI_MineLayChance = 40;				//	Chance of AI to lay a mine.
VCOMAI_MineLaying = true;				//	Should the AI lay mines?
VCOMAI_NOPATHING = false;				//	Should we let AI use flanking manuevers? false means they can flank
VCOMAI_RainImpact = true;				//	Should the rain impact accuracy of AI? DEFAULT = true;
VCOMAI_RainPercent = 3;					//	How much should rain impact the accuracy of AI? Default = 3. Default formula is -> _WeatherCheck = (rain)/3; "rain" is on a scale from 0 to 1. 1 Being very intense rain.
VCOMAI_STATICGARRISON = 1;				//	Will AI garrison static weapons nearby?
VCOMAI_Suppression = false;				//	Should AI and players have an additional layer of suppression that decreases aiming when suppressed? Default = false;
VCOMAI_SuppressionNoPlayers = true;		//	Disables Suppression effect for players, Requires the one above to be true
VCOMAI_SuppressionVar = 5;				//	How much should suppression impact both AI and player aiming? Default is 5. Normal ArmA is 1.
VCOMAI_Unit_AIWarnDistance = 750;		//	Distance AI will respond to call of help from each other
VCOMAI_USESMOKE = true;					//	Should AI use smoke grenades? Besides default A3 behavior?
