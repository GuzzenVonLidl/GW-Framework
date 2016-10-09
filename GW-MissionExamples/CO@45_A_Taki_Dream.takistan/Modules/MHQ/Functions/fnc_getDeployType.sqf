/*
	Author: GuzzenVonLidl
	Gets the deploy type for the mhq

	Usage:
	[mhq_1, "small"] call GW_MHQ_Fnc_getDeployType;

	Arguments:
	0: Unit <OBJECT>
	1: Type <STRING>

	Return Value: NO

	Public: No
*/
#include "..\scriptComponent.hpp"

params [["_mhq", objNull, [objNull]],["_type", "", [""]]];

switch (_type) do {
	case "small": {
		[
			_mhq,
			[
				["Land_IRMaskingCover_02_F",90,[-0.796722,-3.09734,-0.00529003]],
				["Land_CampingTable_F",189.946,[-1.85233,-6.61244,-0.00528622]],
				["Land_CampingChair_V2_F",230,[-2.26124,-7.54794,-0.00528622]],
				["Land_CampingChair_V2_F",353.474,[-1.2665,-5.82129,-0.00528622]],
				["Land_Portable_generator_F",110,[-2.7164,-5.33063,-0.00528622]],
				["Land_CanisterFuel_F",320,[-2.04576,-5.67267,-0.00528622]],
				["PortableHelipadLight_01_red_F",340,[-1.69991,-6.54645,0.807719]],
				["Land_Sleeping_bag_folded_F",38,[-1.80033,-6.83354,0.807719]],
				["Land_Sleeping_bag_folded_F",121.391,[-2.10519,-6.41302,0.807719]],
				["Box_NATO_WpsSpecial_F",90,[-2.64225,-2.79993,-0.00528622],["small_box",(_mhq getVariable QGVAR(Side))]]
			]
		] call FUNC(prefabCreate);
	};

	case "medium": {
		[
			_mhq,
			[
				["Land_IRMaskingCover_01_F",90,[0.764259,-2.32185,-0.00528431]],
				["Land_CampingTable_F",55,[3.74195,-7.76796,-0.00530243]],
				["Land_CampingChair_V2_F",9,[4.13631,-6.87442,-0.00527763]],
				["Land_CampingChair_V2_F",230,[3.24062,-8.54305,-0.00529766]],
				["Land_Portable_generator_F",110,[1.61208,0.909119,-0.00528717]],
				["PortableHelipadLight_01_red_F",340,[3.69947,-7.66631,0.807703]],
				["Land_BarrelWater_grey_F",0,[1.59785,-2.64888,-0.00528622]],
				["Land_BarrelWater_grey_F",0,[1.88465,-2.10916,-0.00528622]],
				["Land_CanisterFuel_F",185,[1.78939,1.53864,-0.00528574]],
				["Land_CanisterFuel_F",320,[1.59416,0.130081,-0.00528622]],
				["Land_CanisterFuel_F",0,[1.68509,1.88417,-0.00528622]],
				["Land_Sleeping_bag_folded_F",38,[4.02016,-8.22243,0.807703]],
				["Land_Sleeping_bag_folded_F",120,[3.40695,-7.24936,0.807703]],
				["Box_NATO_WpsSpecial_F",65,[1.54897,-0.949875,-0.00528622],["small_box",(_mhq getVariable QGVAR(Side))]]
			]
		] call FUNC(prefabCreate);
	};
};
