/*
	AUTHOR: GuzzenVonLidl
	Description:
		What case tha should be called for the zone player is in
	Usage:
		null = [1] spawn GW_Fnc_spawnList;
	Parameters:
		#0: Number:	Activate zone
	Returning Value:
		None
*/
#include "scriptComponent.hpp"
#define	COMPONENT spawnList
params [
	"_case"
];

switch (_case) do {
/*
	NOTES:
	Where it says "Dummy variable" it means thoughs are just there for this demo to allow the trigger to used multiple times
*/
	case 1: {
		spawnArea_1 = nil;	// Dummy variable
		publicVariable "spawnArea_1";	// Dummy variable
		groupInArea1 = [[[[127.5,110.5,0],95,"Up",[]],[[126.5,110.5,0],145,"Middle",[]],[[124.983,110.391,0],230,"Down",[]]],[]] call GW_Common_fnc_spawnGroup;
	};

	case 2: {
		deleteArea_1 = nil;	// Dummy variable
		publicVariable "deleteArea_1";	// Dummy variable
		{
			deleteVehicle _x;
		} forEach units groupInArea1;
	};

	case 3: {
		spawnArea_2 = nil;	// Dummy variable
		publicVariable "spawnArea_2";	// Dummy variable
		if (isNil "groupInArea2") then {
			groupInArea2 = [];
		};

		// NOTE: After the pushback remeber to use Opening and Closing () around the spawn code
		// Example arrayTest pushBack ( Code );

		groupInArea2 pushBack ([[[[139.5,109.5,0],145,"Middle",[]],[[137.983,109.391,0],230,"Down",[]],[[140.5,109.5,0],95,"Up",[]]],[]] call GW_Common_fnc_spawnGroup);
		sleep 1;
		groupInArea2 pushBack ([[[[144,110,0],200,"Middle",[]],[[145.5,110,0],130,"Down",[]],[[142.5,109.5,0],270,"Up",[]]],[]] call GW_Common_fnc_spawnGroup);
	};

	case 4: {
		deleteArea_2 = nil;	// Dummy variable
		publicVariable "deleteArea_2";	// Dummy variable
		{
			_group = _x;
			{
				deleteVehicle _x;
			} forEach units _group;
		} forEach groupInArea2;
	};

	case 5: {
		spawnArea_3 = nil;	// Dummy variable
		publicVariable "spawnArea_3";	// Dummy variable
		if (isNil "buildingsInArea_1") then {
			buildingsInArea_1 = [];
		};
		buildingsInArea_1 pushBack ([["Land_Mil_ConcreteWall_F",[147.5,100.125,0],[[-3.25841e-007,-1,0],[0,0,1]],[],false],["Land_Cargo_Patrol_V1_F",[163.25,105.625,4.76837e-007],[[1,-1.62921e-007,0],[0,0,1]],[],false],["CamoNet_BLUFOR_F",[174.25,111.125,0],[[1.19209e-007,1,0],[0,0,1]],[],false],["Land_BarGate_F",[166,95.25,0],[[1,-1.62921e-007,0],[0,0,1]],[],false],["Land_HBarrier_Big_F",[161.5,105.5,0],[[-1,4.88762e-007,0],[0,0,1]],[],true],["Land_HBarrier_5_F",[175.875,104.125,0],[[1,-1.62921e-007,0],[0,0,1]],[],true],["Land_HBarrier_5_F",[164.375,110.5,0],[[1.19209e-007,1,0],[0,0,1]],[],true],["Land_HBarrier_5_F",[172.375,102,0],[[1.19209e-007,1,0],[0,0,1]],[],true],["Land_HBarrier_5_F",[174,114.125,0],[[1.19209e-007,1,0],[0,0,1]],[],true],["Land_HBarrier_5_F",[180.125,109.75,0],[[0.866025,-0.5,0],[0,0,1]],[],true],["Land_Mil_ConcreteWall_F",[188.375,91.125,0],[[-3.25841e-007,-1,0],[0,0,1]],[],false],["Land_HBarrier_3_F",[180.875,112.5,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_HBarrier_3_F",[164.125,102,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_HBarrier_3_F",[161.566,106.568,0],[[-1,4.88762e-007,0],[0,0,1]],[],true],["Land_HBarrier_3_F",[167.875,109.625,0],[[1,-1.62921e-007,0],[0,0,1]],[],true],["Land_HBarrier_3_F",[168.75,107.25,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_HBarrier_3_F",[178,113.5,0],[[0.5,0.866025,0],[0,0,1]],[],true],["Land_HBarrier_3_F",[171.125,106.375,0],[[1,-1.62921e-007,0],[0,0,1]],[],true],["Land_HBarrier_3_F",[161.636,103.411,0],[[-1,4.88762e-007,0],[0,0,1]],[],true],["Land_Mil_ConcreteWall_F",[156.5,100.25,0],[[-3.25841e-007,-1,0],[0,0,1]],[],false],["Land_Mil_ConcreteWall_F",[180.625,100.5,0],[[-3.25841e-007,-1,0],[0,0,1]],[],false],["Land_BagFence_Round_F",[168.125,113.75,0],[[0.707106,-0.707107,0],[0,0,1]],[],true],["Land_BagFence_Round_F",[182.376,106.862,0],[[-0.965926,0.258819,0],[0,0,1]],[],true],["Land_BagFence_Round_F",[180,102.625,0],[[-0.866025,0.5,0],[0,0,1]],[],true],["Land_BagFence_Round_F",[180.75,104.875,0],[[0.866025,-0.5,0],[0,0,1]],[],true],["Box_NATO_AmmoVeh_F",[176.502,112.287,0],[[-0.48952,-0.871992,0],[0,0,1]],[],false],["Land_BagFence_Long_F",[177.625,101.75,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_PaperBox_open_full_F",[169.5,108.875,0],[[1,-1.62921e-007,0],[0,0,1]],[],true],["Land_PaperBox_closed_F",[173.5,112.375,0],[[-0.965926,0.258819,0],[0,0,1]],[],true],["Land_Sacks_heap_F",[179.25,111.25,0],[[1,-1.62921e-007,0],[0,0,1]],[],false],["Land_WaterBarrel_F",[174.375,106.375,0],[[1,-1.62921e-007,0],[0,0,1]],[],false],["Land_BagFence_Short_F",[169.875,115,0],[[-0.707107,0.707107,0],[0,0,1]],[],true],["Land_BagFence_Short_F",[167.375,111.875,0],[[1,-1.62921e-007,0],[0,0,1]],[],true],["Land_BagFence_Short_F",[182.25,109,0],[[-0.965926,-0.258819,0],[0,0,1]],[],true],["Land_BagFence_End_F",[182.125,110,0],[[-0.866025,0.5,0],[0,0,1]],[],true],["FlexibleTank_01_sand_F",[177.75,112.25,0],[[1,0.000105099,0],[0,0,1]],[],false],["Land_BarrelSand_F",[174.75,105.375,0],[[1,3.50038e-005,0],[0,0,1]],[],false],["Land_Mil_ConcreteWall_F",[188.25,100.5,0],[[-3.25841e-007,-1,0],[0,0,1]],[],false],["Land_Mil_ConcreteWall_F",[147.625,90.75,0],[[-3.25841e-007,-1,0],[0,0,1]],[],false],["CamoNet_BLUFOR_open_F",[178,78.75,0],[[1.19209e-007,1,0],[0,0,1]],[],false],["CamoNet_BLUFOR_open_F",[166.375,80.625,0],[[1,-1.62921e-007,0],[0,0,1]],[],false],["Land_BagBunker_Tower_F",[159,84.875,0],[[1.19209e-007,1,0],[0,0,1]],[],false],["Land_Cargo_House_V1_F",[178.25,83.25,0],[[1.19209e-007,1,0],[0,0,1]],[],false],["Land_HBarrier_Big_F",[183.75,84,0],[[1,-1.62921e-007,0],[0,0,1]],[],true],["Land_HBarrier_Big_F",[180.375,89,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_HBarrier_Big_F",[171.875,88.875,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_HBarrier_Big_F",[184,77.625,0],[[1,-1.62921e-007,0],[0,0,1]],[],true],["Land_HBarrier_Big_F",[178.875,74.25,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_HBarrier_Big_F",[173,83.625,0],[[1,-1.62921e-007,0],[0,0,1]],[],true],["Land_HBarrier_5_F",[161.375,77.5,0],[[-1,4.88762e-007,0],[0,0,1]],[],true],["Land_HBarrier_5_F",[163.5,74.125,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_LampShabby_F",[171.75,88,0],[[-0.5,0.866026,0],[0,0,1]],[],false],["Land_HBarrier_3_F",[167,74.125,0],[[1,-1.62921e-007,0],[0,0,1]],[],true],["Land_Mil_ConcreteWall_F",[156.625,90.875,0],[[-3.25841e-007,-1,0],[0,0,1]],[],false],["Land_Mil_ConcreteWall_F",[180.75,91.125,0],[[-3.25841e-007,-1,0],[0,0,1]],[],false],["Land_BagFence_Round_F",[157.5,74.125,0],[[0.965926,0.258819,0],[0,0,1]],[],true],["Land_BagFence_Round_F",[156.5,78.875,0],[[0.965926,0.258819,0],[0,0,1]],[],true],["Land_BagFence_Round_F",[157.5,76.75,0],[[-0.965926,-0.258819,0],[0,0,1]],[],true],["Land_BagFence_Round_F",[168.625,72.125,0],[[1.19209e-007,1,0],[0,0,1]],[],true],["Land_BagFence_Round_F",[159.25,72.75,0],[[1.19209e-007,1,0],[0,0,1]],[],true],["Land_BagFence_Round_F",[170.937,72.541,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_BagFence_Round_F",[175.253,73.1961,0],[[-0.965926,0.258819,0],[0,0,1]],[],true],["Land_BagFence_Round_F",[173.472,71.8615,0],[[1.19209e-007,1,0],[0,0,1]],[],true],["Land_HBarrier_1_F",[162.625,89,0],[[1,-1.62921e-007,0],[0,0,1]],[],true],["Land_PaperBox_closed_F",[182.125,76.25,0],[[-1,4.88762e-007,0],[0,0,1]],[],true],["Land_PaperBox_closed_F",[166.625,83.375,0],[[0.707106,-0.707107,0],[0,0,1]],[],true],["Land_PaperBox_closed_F",[182,77.875,0],[[-1,4.88762e-007,0],[0,0,1]],[],true],["Land_Sacks_heap_F",[177.125,82.125,0],[[0.258819,0.965926,0],[0,0,1]],[],false],["Land_BagFence_End_F",[167.125,72.375,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_BagFence_End_F",[175.875,73,0],[[1.19209e-007,1,0],[0,0,1]],[],true],["Land_BagFence_End_F",[160.75,72.875,0],[[0.258819,0.965926,0],[0,0,1]],[],true],["Land_PaperBox_open_empty_F",[165.125,81.625,0],[[-3.25841e-007,-1,0],[0,0,1]],[],true],["Land_Pallets_stack_F",[167,81.25,0],[[0.258803,-0.96593,0],[0,0,1]],[],false],["Land_BarrelTrash_grey_F",[174.375,75.1251,0],[[1,3.50038e-005,0],[0,0,1]],[],false]] call GW_Common_fnc_spawnObjects);
	};

	case 6: {
		deleteArea_3 = nil;	// Dummy variable
		publicVariable "deleteArea_3";	// Dummy variable
		{
			_objectList = _x;
			{
				deleteVehicle _x;
			} forEach _objectList;
		} forEach buildingsInArea_1;
	};

	default {
		ERROR(FORMAT_1("Case missing: %1", _case));
	};
};
