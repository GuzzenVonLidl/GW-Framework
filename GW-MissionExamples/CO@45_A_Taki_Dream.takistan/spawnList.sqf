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
	case 0: {	// Time > 10
		[[],[["CUP_I_ZU23_TK_GUE",[5636.13,8857.13,7.34673],30,[["gunner",-1,[0]]]],["CUP_I_ZU23_TK_GUE",[5684.38,8865.13,7.35898],325,[["gunner",-1,[0]]]]],[]] call GW_Common_fnc_spawnGroup;
		[[],[["CUP_I_DSHKM_TK_GUE",[5643.25,8902.5,10.586],315,[["gunner",-1,[0]]]],["CUP_I_DSHKM_TK_GUE",[5663.5,8905,10.0258],10,[["gunner",-1,[0]]]],["CUP_I_DSHKM_TK_GUE",[5617.33,8894.18,0.8],315,[["gunner",-1,[0]]]]],[]] call GW_Common_fnc_spawnGroup;
	};

	case 1: {	// Fuel truck @ fuel station
		// Wave 1
		[[[[5573.75,8963.75,0],0],[[5578.75,8958.75,0],0],[[5568.75,8958.75,0],0],[[5583.75,8953.75,0],0]],[],[[[5539.88,9266.25,-0.0212021],"Guard","AWARE","RED",0,"NO CHANGE","NORMAL"]]] call GW_Common_fnc_spawnGroup;
		[[[[5724.25,8999.5,0],0],[[5729.25,8994.5,0.0276337],0],[[5719.25,8994.5,0.00959015],0],[[5734.25,8989.5,0.000808716],0]],[],[[[5648.38,9314.75,5.34058e-005],"Guard","AWARE","RED",0,"NO CHANGE","NORMAL"]]] call GW_Common_fnc_spawnGroup;
		sleep 20;
		[[[[5627.75,8971.25,7.62939e-005],0],[[5632.75,8966.25,0],0],[[5622.75,8966.25,0],0],[[5637.75,8961.25,0],0]],[],[[[5619.75,9324.5,1.52588e-005],"Guard","AWARE","RED",0,"NO CHANGE","NORMAL"]]] call GW_Common_fnc_spawnGroup;
		// Wave 2
		sleep 40;
		[[],[["CUP_I_Datsun_PK_TK_Random",[5780.63,8303.5,0.00174713],345,[["driver",-1,[]],["cargo",2,[]],["gunner",-1,[0]],["cargo",0,[1]],["cargo",1,[2]]]]],[[[5771.88,8341.24,0],"Move","AWARE","RED",0,"NO CHANGE","NORMAL"],[[5532.38,8901.38,3.05176e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5539.16,9310.35,-7.62939e-006],"Guard","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		sleep 5;
		[[],[["CUP_I_Datsun_PK_TK_Random",[6465.75,8980.38,0.00347137],260,[["driver",-1,[]],["cargo",2,[]],["gunner",-1,[0]],["cargo",0,[1]],["cargo",1,[2]]]]],[[[6415.39,8970.63,0],"Move","AWARE","RED",0,"NO CHANGE","NORMAL"],[[5702.25,8951.52,-3.8147e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5644.42,9320.87,-0.00012207],"Guard","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		// Wave 3
		sleep 30;
		[[],[["CUP_O_UAZ_MG_TKA",[6476.46,8987.87,0.0099411],260,[["driver",-1,[]],["cargo",0,[0]],["gunner",-1,[1]]]]],[[[6415.39,8970.63,0],"Move","AWARE","RED",0,"NO CHANGE","NORMAL"],[[5702.25,8951.52,-3.8147e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5644.42,9320.87,-0.00012207],"Guard","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		[[],[["CUP_O_UAZ_MG_TKA",[5789.04,8293.57,0.0146255],345,[["driver",-1,[]],["cargo",0,[0]],["gunner",-1,[1]]]]],[[[5771.88,8341.24,0],"Move","AWARE","RED",0,"NO CHANGE","NORMAL"],[[5532.38,8901.38,3.05176e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5539.16,9310.35,-7.62939e-006],"Guard","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		// Wave 4
		sleep 90;
		[[],[["CUP_I_BRDM2_TK_Gue",[5780,8550,1.284],35,[["driver",-1,[]],["cargo",0,[]],["cargo",1,[]],["cargo",2,[]],["gunner",-1,[0]]]]],[[[5772,8688,-0.0019989],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","NORMAL"],[[5677.69,8997.24,-0.000213623],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5618,9324,0.000465393],"Guard","AWARE","RED",0,"NO CHANGE","LIMITED"]]] call GW_Common_fnc_spawnGroup;
		[[[[5573.75,8963.75,0],0],[[5578.75,8958.75,0],0],[[5568.75,8958.75,0],0],[[5583.75,8953.75,0],0]],[],[[[5539.88,9266.25,-0.0212021],"Guard","AWARE","RED",0,"NO CHANGE","NORMAL"]]] call GW_Common_fnc_spawnGroup;
		[[],[["CUP_O_UAZ_MG_TKA",[6476.46,8987.87,0.0099411],260,[["driver",-1,[]],["cargo",0,[0]],["gunner",-1,[1]]]]],[[[6415.39,8970.63,0],"Move","AWARE","RED",0,"NO CHANGE","NORMAL"],[[5702.25,8951.52,-3.8147e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5644.42,9320.87,-0.00012207],"Guard","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		sleep 50;
		[[],[["CUP_O_UAZ_MG_TKA",[6476.46,8987.87,0.0099411],260,[["driver",-1,[]],["cargo",0,[0]],["gunner",-1,[1]]]]],[[[6415.39,8970.63,0],"Move","AWARE","RED",0,"NO CHANGE","NORMAL"],[[5702.25,8951.52,-3.8147e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5644.42,9320.87,-0.00012207],"Guard","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
	};

	case 2: {	// timer from when case 2 started
		["randomMarker_1", 50, 10] spawn EFUNC(Common,BuildingPop);
		sleep 1;
		["randomMarker_2", 50, 5] spawn EFUNC(Common,BuildingPop);
		sleep 1;
		["randomMarker_3", 50, 8] spawn EFUNC(Common,BuildingPop);
		sleep 1;
		// West
		[[[5597.5,8886,3.46435],90,"auto"],[[5600.25,8867.75,0.268608],55,"auto"],[[5601,8895.25,3.24533],62,"auto"],[[5598.13,8900.63,3.23069],15,"auto"],[[5592.25,8916.88,2.7582],0,"auto"],[[5591.16,8886.73,0.0944443],95,"auto"],[[5504.5,8816.5,1.73447],20,"auto"]] call GW_Common_fnc_spawnStatic;
		// Wall West
		sleep 1;
		[[[5622.5,8923,7.31665],270,"auto"],[[5624,8925.5,7.31252],0,"auto"],[[5622.5,8897,0],285,"auto"],[[5633.13,8914.75,16.813],280,"auto"]] call GW_Common_fnc_spawnStatic;
		// Stronghold
		[[[5655,8876.5,0.197433],135,"auto"],[[5661.5,8899,5.42405],210,"auto"],[[5647,8899,5.4521],135,"auto"],[[5643,8901,5.45776],210,"auto"],[[5649,8910.5,0.234734],15,"auto"],[[5656.34,8911.47,0.215935],285,"auto"],[[5665,8871,0],240,"auto"],[[5647,8878.5,0],300,"auto"]] call GW_Common_fnc_spawnStatic;
		// Wall East
		[[[5673.9,8933.74,7.30157],0,"auto"],[[5676.5,8932,7.30611],75,"auto"],[[5686.5,8901.5,0],30,"auto"]] call GW_Common_fnc_spawnStatic;
		sleep 1;
		[[[[5740.63,8766.13,0],0],[[5745.63,8761.13,0],0]],[],[[[5688.05,8950.54,5.34058e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","LIMITED"],[[5599.12,8932.79,-1.52588e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5621.7,8815.53,-0.000175476],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5636.98,8818.09,0.00012207],"Cycle","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		[[[[5626.38,8774.25,0],0],[[5631.38,8769.25,0],0]],[],[[[5599.12,8932.79,-1.52588e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","LIMITED"],[[5688.05,8950.54,5.34058e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5732.63,8804.5,-0.000205994],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5636.98,8818.09,0.00012207],"Cycle","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		sleep 15;
		[[[[5740.63,8766.13,0],0],[[5745.63,8761.13,0],0]],[],[[[5688.05,8950.54,5.34058e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","LIMITED"],[[5599.12,8932.79,-1.52588e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5621.7,8815.53,-0.000175476],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5636.98,8818.09,0.00012207],"Cycle","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		[[[[5626.38,8774.25,0],0],[[5631.38,8769.25,0],0]],[],[[[5599.12,8932.79,-1.52588e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","LIMITED"],[[5688.05,8950.54,5.34058e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5732.63,8804.5,-0.000205994],"Guard","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5636.98,8818.09,0.00012207],"Cycle","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
	};

	case 3: {
		[[],[["CUP_I_BTR40_MG_TKG",[5915.25,7337.25,0.00218964],20,[["driver",-1,[]],["cargo",0,[]],["cargo",1,[]],["cargo",2,[]],["cargo",3,[]],["cargo",4,[]],["cargo",5,[]],["gunner",-1,[0]]]]],[[[5639.25,8646.5,0],"Move","CARELESS","RED",0,"COLUMN","NORMAL"],[[5649.28,8684.79,-9.15527e-005],"Unload","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5658.56,8851.01,0],"Guard","AWARE","RED",0,"LINE","LIMITED"]]] call GW_Common_fnc_spawnGroup;
		sleep 1;
		[[],[["CUP_I_BTR40_MG_TKG",[5914.38,7314,-0.00125885],20,[["driver",-1,[]],["cargo",0,[]],["cargo",1,[]],["cargo",2,[]],["cargo",3,[]],["cargo",4,[]],["cargo",5,[]],["gunner",-1,[0]]]]],[[[5639.25,8646.5,0],"Move","CARELESS","RED",0,"COLUMN","NORMAL"],[[5649.28,8684.79,-9.15527e-005],"Unload","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5658.56,8851.01,0],"Guard","AWARE","RED",0,"LINE","LIMITED"]]] call GW_Common_fnc_spawnGroup;
		sleep 10;
		[[],[["CUP_I_T34_TK_GUE",[5934.13,7385.75,0.0810165],20,[["driver",-1,[]],["gunner",-1,[0]],["cargo",-1,[0,0]]]]],[[[5609.88,8910.25,-0.0449982],"Move","CARELESS","RED",0,"NO CHANGE","NORMAL"],[[5619.06,8684.02,0],"Guard","AWARE","RED",0,"COLUMN","FULL"]]] call GW_Common_fnc_spawnGroup;
		[[],[["CUP_I_T34_TK_GUE",[5925.25,7351.5,-0.000572205],20,[["driver",-1,[]],["gunner",-1,[0]],["cargo",-1,[0,0]]]]],[[[5619.06,8684.02,0],"Move","CARELESS","RED",0,"COLUMN","FULL"],[[5609.88,8910.25,-0.0449982],"Guard","AWARE","RED",0,"NO CHANGE","NORMAL"]]] call GW_Common_fnc_spawnGroup;
	};

	case 4: {
		{
			_x hideObjectGlobal true;
		} forEach nearestObjects [[5912.25,7278.5,-0.00280762], [], 5];
		{
			_x hideObjectGlobal true;
		} forEach nearestObjects [[5944,7269.5,0.111], [], 19];

		sleep 0.1;

		[["Land_House_L_8_EP1",[5934.25,7263,0.00218201],165],["Land_House_K_1_EP1",[5926,7292,0.0013504],290],["Wall_L_2m5_EP1",[5937.75,7272.75,0.00556183],105],["Land_Wall_L_2m5_gate_EP1",[5938.25,7275.25,0.00228119],105],["Wall_L_2m5_EP1",[5939,7277.75,0.000183105],105],["Wall_L_2m5_EP1",[5939.75,7280.5,-0.000144958],105],["Wall_L_2m5_EP1",[5940.25,7282.5,0.00140381],105],["Wall_L_2m5_EP1",[5940.75,7284.5,0.0911865],105],["Wall_L_2m5_EP1",[5941.25,7286.5,0.105591],105],["Wall_L_2m5_EP1",[5941.75,7289,0.000549316],105],["Wall_L_2m5_EP1",[5942.25,7291,-1.52588e-005],105],["Land_Wall_L_2m5_gate_EP1",[5928.25,7279.75,0],20],["Wall_L_2m5_EP1",[5926,7280.75,0.00119781],205],["Wall_L_2m5_EP1",[5930.75,7278.75,0],205],["Wall_L_2m5_EP1",[5933.25,7278.75,-0.0038681],350],["Wall_L_2m5_EP1",[5938.25,7279.5,-0.00479889],205],["Wall_L_2m5_EP1",[5935.25,7279.5,-0.000740051],340],["Wall_L_2m5_EP1",[5923.5,7281.25,0.00107574],355],["Land_House_K_6_EP1",[5914.75,7277.75,0.0947876],25]] call GW_Common_fnc_spawnObjects;
		sleep 1;
		pilot1 setPosATL [5935.75,7268.5,0.317];
		removeAllWeapons pilot1;
		pilot2 setPosATL [5892.5,7298.5,3.932];
		removeAllWeapons pilot2;
		[[[5912.25,7281.5,6.54809],315,"auto"],[[5936.25,7269.75,3.34759],0,"auto"],[[5906,7255.25,0.0911865],55,"auto"],[[5906.75,7270,1.03078],105,"auto"],[[5917.5,7281,6.78893],130,"auto"],[[5937.25,7260.25,0.922325],0,"auto"],[[5912.25,7281.25,0.552818],355,"auto"],[[5936.25,7272,0],0,"auto"],[[5917.75,7281,0.770752],105,"auto"],[[5932.5,7265.75,0],260,"auto"],[[5930.5,7257.5,1.31432],0,"auto"],[[5923.25,7294.25,0.651726],95,"auto"],[[5923.25,7289,0.698547],95,"auto"]] call GW_Common_fnc_spawnStatic;
		sleep 2;
		[[[5970.25,7340.5,3.09883],295,"auto"],[[5971.5,7337,0.248596],260,"auto"],[[5975.5,7358.5,0.859367],280,"auto"],[[5988,7335.75,0],0,"auto"],[[5923,7396.75,0.572403],35,"auto"],[[5922.5,7389.25,0],105,"auto"]] call GW_Common_fnc_spawnStatic;
		[[[5894.25,7310,0.363899],0,"auto"],[[5892.5,7312.25,3.6497],0,"auto"],[[5901.5,7309.5,3.95119],45,"auto"],[[5896,7300,3.80931],290,"auto"],[[5890.75,7301.25,0.413071],85,"auto"],[[5893.25,7296.5,0.561722],0,"auto"],[[5894.5,7296.5,3.87097],340,"auto"]] call GW_Common_fnc_spawnStatic;
		[[[5904.5,7329,0.641556],170,"auto"],[[5903.25,7323,3.8767],0,"auto"],[[5897.75,7328.75,3.98858],75,"auto"],[[5910,7348.5,3.66961],0,"auto"],[[5906.25,7338.25,-7.62939e-006],290,"auto"],[[5911,7347.5,0.678383],225,"auto"],[[5904.5,7347,3.25318],200,"auto"],[[5906,7349,0.519653],210,"auto"]] call GW_Common_fnc_spawnStatic;
		[[[5952,7320.75,3.31],0,"auto"],[[5931.25,7318,0.30674],120,"auto"],[[5947.75,7319,0.120804],205,"auto"],[[5949.25,7343.75,0.4786],15,"auto"],[[5942.75,7349,0.4786],40,"auto"],[[5957.5,7314.25,0.978798],320,"auto"]] call GW_Common_fnc_spawnStatic;
		sleep 2;
		[[[[5935.3,7307.5,-0.010788],0],[[5940.3,7302.5,0],0]],[],[[[5937.55,7314.25,0.113991],"Guard","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		[[[[5965.25,7320,0],0],[[5970.25,7315,0],0]],[],[[[5966.25,7327,0],"Loiter","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		[[[[5915.5,7261,0],0],[[5920.5,7256,0],0]],[],[[[5917.75,7267.75,0.113991],"Guard","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		[[[[6053.98,7323.46,-0.00320435],0],[[6058.98,7318.46,-0.00681305],0]],[],[[[6009.33,7430.72,-0.000267029],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","LIMITED"],[[5929.93,7447.6,-3.05176e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5896.06,7358.38,-0.000854492],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[6045.56,7317.72,2.28882e-005],"Cycle","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		sleep 3;
		[[[[6053.98,7323.46,-0.00320435],0],[[6058.98,7318.46,-0.00681305],0]],[],[[[6009.33,7430.72,-0.000267029],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","LIMITED"],[[5929.93,7447.6,-3.05176e-005],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[5896.06,7358.38,-0.000854492],"Move","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"],[[6045.56,7317.72,2.28882e-005],"Cycle","UNCHANGED","NO CHANGE",0,"NO CHANGE","UNCHANGED"]]] call GW_Common_fnc_spawnGroup;
		[[],[["CUP_I_T55_TK_GUE",[6077.25,7356.25,1.25922],275,[["driver",-1,[]],["cargo",-1,[0]],["cargo",-1,[0,0]]]]],[]] call GW_Common_fnc_spawnGroup;
		[[],[["CUP_I_T55_TK_GUE",[5896.25,7253,0],350,[["driver",-1,[]],["cargo",-1,[0]],["cargo",-1,[0,0]]]]],[]] call GW_Common_fnc_spawnGroup;
	};

	default {
		ERROR(FORMAT_1("Case missing: %1", _case));
	};
};
