
switch (_side) do {
	case "AAF-W": {
		#include "Classes\AAF-W.sqf"
	};
	case "BAF-D": {
		#include "Classes\BAF-D.sqf"
	};
	case "BAF-W": {
		#include "Classes\BAF-W.sqf"
	};
	case "CSAT-H": {
		#include "Classes\CSAT-H.sqf"
	};
	case "CSAT-W": {
		#include "Classes\CSAT-W.sqf"
	};
	case "CSAT-U": {
		#include "Classes\CSAT-U.sqf"
	};
	case "INSURGENT-D": {
		#include "Classes\INSURGENT-D.sqf"
	};
	case "INSURGENT-W": {
		#include "Classes\INSURGENT-W.sqf"
	};
	case "NATO-D": {
		#include "Classes\NATO-D.sqf"
	};
	case "NATO-W": {
		#include "Classes\NATO-W.sqf"
	};
	case "PMC": {
		#include "Classes\PMC.sqf"
	};
	case "RUSSIAN-W": {
		#include "Classes\RUSSIAN-W.sqf"
	};
	case "USMC-D": {
		#include "Classes\USMC-D.sqf"
	};
	case "USMC-W": {
		#include "Classes\USMC-W.sqf"
	};
	default {
		_errorCode = 1;
		ERROR(FORMAT_1("Faction does not exist: %1", _side));
	};
};

/*

switch (toUpper(GW_Gear_Opfor)) do {
	case "VDV": {
		#include "..\Scripts\Classes\Opfor\VDV.sqf"
	};
	case "INS": {
		#include "..\Scripts\Classes\Opfor\INS.sqf"
	};
	case "Takistani Army": {
		#include "..\Scripts\Classes\Opfor\TA.sqf"
	};
	case "Takistani Militian": {
		#include "..\Scripts\Classes\Opfor\TM.sqf"
	};
};
switch (toUpper(GW_Gear_Independent)) do {
	case "GUE": {
		#include "..\Scripts\Classes\Independent\GUE.sqf"
	};
	case "UN": {
		#include "..\Scripts\Classes\Independent\UN.sqf"
	};
	case "PMC": {
		#include "..\Scripts\Classes\Independent\PMC.sqf"
	};
};
*/
