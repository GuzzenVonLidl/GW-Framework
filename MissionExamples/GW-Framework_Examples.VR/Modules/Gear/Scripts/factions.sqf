
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
	case "CIVI-ALTIS": {
		#include "Classes\CIVI-ALTIS.sqf"
	};
	case "CIVI-CHERNARUS": {
		#include "Classes\CIVI-CHERNARUS.sqf"
	};
	case "CIVI-TAKISTAN": {
		#include "Classes\CIVI-TAKISTAN.sqf"
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
	case "CUSTOM-E": {
		#include "Classes\CUSTOM-E.sqf"
	};
	case "CUSTOM-I": {
		#include "Classes\CUSTOM-I.sqf"
	};
	case "CUSTOM-W": {
		#include "Classes\CUSTOM-W.sqf"
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
	case "TAKIARMY-D": {
		#include "Classes\TAKIARMY-D.sqf"
	};
	case "USMC-D": {
		#include "Classes\USMC-D.sqf"
	};
	case "USMC-W": {
		#include "Classes\USMC-W.sqf"
	};
	default {
		_errorCode = true;
		ERROR(FORMAT_1("Faction does not exist: %1", _side));
	};
};

/*
	case "UN-D": {
		#include "Classes\UN-D.sqf"
	};

*/
