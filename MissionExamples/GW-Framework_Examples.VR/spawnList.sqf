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
#include "script_Component.hpp"
#define	COMPONENT spawnList
params [
	"_case"
];

switch (_case) do {
/*
	NOTES:
	Where it says "Dummy variable" it means thoughs are just there for this demo to allow the trigger to used multiple times
*/
	case 0: { // Custom Init after 5sec
		hint "Custom Server Init says hi";
	};

	case 1: {
		spawnArea_1 = nil;	// Dummy variable
		publicVariable "spawnArea_1";	// Dummy variable
		groupInArea1 = [[[[127.5,110,0],110,"Up",[[4,true]]],[[126.5,110,0],180,"Middle",[[4,true]]],[[125.5,110,0],230,"Down",[[4,true]]]],[]] call GW_Common_fnc_spawnGroup;
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

		groupInArea2 pushBack ([[[[140.5,110,0],110,"Up",[[4,true]]],[[139.5,110,0],180,"Middle",[[4,true]]],[[138.5,110,0],230,"Down",[[4,true]]]],[]] call GW_Common_fnc_spawnGroup);
		sleep 1;
		groupInArea2 pushBack ([[[[143,110,0],250,"Up",[[4,true]]],[[144,110,0],180,"Middle",[[4,true]]],[[145,110,0],135,"Down",[[4,true]]]],[]] call GW_Common_fnc_spawnGroup);
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
		buildingsInArea_1 pushBack ([["Land_HBarrier_Big_F",[152.824,88.8305,6.21],[[0,0,33.6418],[-0,0,33.6418]],[],false],["Land_MetalBarrel_F",[155.58,95.4003,5.42268],[[0,-0,138.617],[-0,0,138.617]],[],false],["Land_MetalBarrel_F",[155.337,96.1628,5.42268],[[0,0,33.6018],[-0,0,33.6018]],[],false],["Land_PaperBox_open_empty_F",[154.555,90.5787,5.60703],[[0,-0,138.644],[-0,0,138.644]],[],false],["Land_PaperBox_open_empty_F",[152.926,91.4654,5.60703],[[0,0,33.6418],[-0,0,33.6418]],[],false],["Land_HBarrier_Big_F",[155.141,101.833,6.21],[[0,0,303.643],[-0,0,303.643]],[],false],["Land_HBarrier_Big_F",[161.141,101.894,6.21],[[0,0,213.644],[-0,0,213.644]],[],false],["Land_HBarrier_3_F",[159.852,99.6183,5.79834],[[0,-0,123.643],[-0,0,123.643]],[],false],["Land_PaperBox_open_empty_F",[156.675,100.826,5.60703],[[0,0,303.643],[-0,0,303.643]],[],false],["Land_HBarrier_5_F",[160.246,93.6472,5.74051],[[0,0,33.6418],[-0,0,33.6418]],[],false],["Land_HBarrier_Big_F",[166.002,84.2652,6.21],[[0,-0,123.643],[-0,0,123.643]],[],false],["Land_HBarrier_Big_F",[159.865,84.2946,6.21],[[0,0,213.644],[-0,0,213.644]],[],false],["Land_HBarrier_3_F",[161.664,88.8033,5.79834],[[0,-0,123.643],[-0,0,123.643]],[],false],["Land_FieldToilet_F",[163.216,85.2141,6.22006],[[0,-0,168.646],[-0,0,168.646]],[],false],["Land_BagBunker_Tower_F",[164.85,91.9349,7.21002],[[0,-0,123.643],[0,-0,123.643]],[],false],["Land_HBarrier_Big_F",[170.579,91.4417,6.21],[[0,-0,123.643],[-0,0,123.643]],[],false],["Land_MetalBarrel_F",[166.656,95.0175,5.42268],[[0,0,33.6228],[-0,0,33.6228]],[],false],["Land_MetalBarrel_F",[167.542,94.1969,5.42268],[[0,0,258.616],[-0,0,258.616]],[],false],["Land_MetalBarrel_F",[167.572,95.2115,5.42268],[[0,0,348.614],[-0,0,348.614]],[],false],["Land_BagFence_Long_F",[170.249,95.5488,5.41931],[[0,0,213.644],[-0,0,213.644]],[],false],["Land_BagFence_Long_F",[165.905,98.7397,5.41931],[[0,0,33.6418],[-0,0,33.6418]],[],false]] call GW_Common_fnc_spawnObjects);
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
