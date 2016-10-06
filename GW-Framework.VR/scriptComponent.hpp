//	https://github.com/CBATeam/CBA_A3/blob/master/addons/settings/fnc_init.sqf

#define QUOTE(var1) #var1
#define DOUBLES(var1,var2) ##var1##_##var2
#define DOUBLESCOMMA(var1,var2) ##var1##,##var2
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3
#define PREFIX GW
#define ADDON DOUBLES(PREFIX,COMPONENT)

#ifndef isDescription	// Will crash on server otherwise
	#include "\x\cba\addons\main\script_macros_mission.hpp"
#endif

/* -------------------------------------------
Group: General
------------------------------------------- */
// Custom

#define	GUZZENVONLIDL	"76561197993196728"
//#define	R4IDER	"76561197985030555"
//#define	OKSMAN	"76561198013929549"
//#define	CHRIS	"76561197973520734"
//#define	BENY	"76561197995362215"

// *************************************

#define REMOTEONLYSERVER(A) remoteExecCall [A, 2]
#define MISSIONLOADED getClientStateNumber >= 10 || !isMultiplayer

#define	DEVBUILD (["GW_FRAMEWORK", "Core", "devBuild"] call BIS_fnc_getCfgData) == -2
#define	DEVCONSOLEENABLED (["GW_FRAMEWORK", "Core", "DebugConsole"] call BIS_fnc_getCfgData) isEqualTo -2
#define	DEVCONSOLE(VAR1)	"debug_console" callExtension (VAR1)

#define conBeep DEVCONSOLE("A")
#define conClear DEVCONSOLE("C")
#define conClose DEVCONSOLE("X")

// *************************************	// Do not edit below
// Internal
#define	FALSE -1
#define	TRUE -2
#define PRIVATE 0
#define PUBLIC 2

#define MAJOR 0
#define MINOR 0
#define PATCHLVL 4
#define BUILD 161006	// We will use the DATE for the BUILD# in the format YYMMDD
#define VERSION MAJOR.MINOR.PATCHLVL.BUILD

#define COMPONENTPATH(var1) CUSTOM_FOLDER\fnc_##var1.sqf
#define PREP(var1) ##ADDON##_fnc_##var1 = compile preProcessFileLineNumbers QUOTE(COMPONENTPATH(var1));
#define PREPMAIN(var1) ##PREFIX##_fnc_##var1 = compile preProcessFileLineNumbers QUOTE(COMPONENTPATH(var1));
#define PREPMAINFOLDER(var1) ##PREFIX##_fnc_##var1 = compile preProcessFileLineNumbers QUOTE(var1.sqf);

#define	GETSIDE(var1) (configfile >> "CfgVehicles" >> (typeOf var1) >> "side") call BIS_fnc_getCfgData

/* -------------------------------------------
Group: Debugging
------------------------------------------- */
//	#define DEBUG_SETTINGS [true, true, true]

#ifdef DEBUG_MODE_FULL
	#define DEBUG_MODE_NORMAL
#endif

#ifdef DEBUG_MODE_NORMAL
	#define DEBUG_MODE_MINIMAL
#endif

#ifndef DEBUG_MODE_MINIMAL
	#define DEBUG_MODE_NORMAL
	#define DEBUG_MODE_MINIMAL
#endif

#ifdef DEBUG_MODE_FULL
	#define LOG(MESSAGE) [__LINE__, #COMPONENT, MESSAGE, "DEBUG", false] call GW_fnc_log
	#define LOG_ADMIN(MESSAGE) [__LINE__, #COMPONENT, MESSAGE, "DEBUG", true] call GW_fnc_log
#else	// disabled
	#define LOG(MESSAGE)
	#define LOG_ADMIN(MESSAGE)
#endif

#ifdef DEBUG_MODE_NORMAL
	#define WARNING(MESSAGE) [__LINE__, #COMPONENT, MESSAGE, "WARNING", false] call GW_fnc_log
	#define WARNING_ADMIN(MESSAGE) [__LINE__, #COMPONENT, MESSAGE, "WARNING", true] call GW_fnc_log
#else	// disabled
	#define WARNING(MESSAGE)
	#define WARNING_ADMIN(MESSAGE)
#endif

#define ERROR(MESSAGE) [__LINE__, #COMPONENT, MESSAGE, "ERROR", false] call GW_fnc_log
#define ERROR_ADMIN(MESSAGE) [__LINE__, #COMPONENT, MESSAGE, "ERROR", true] call GW_fnc_log

#ifdef DEBUG_MODE_FULL
	#define TRACE_1(MESSAGE,A) LOG(PFORMAT_1(MESSAGE,A));
	#define TRACE_2(MESSAGE,A,B) LOG(PFORMAT_2(MESSAGE,A,B));
	#define TRACE_3(MESSAGE,A,B,C) LOG(PFORMAT_3(MESSAGE,A,B,C));
	#define TRACE_4(MESSAGE,A,B,C,D) LOG(PFORMAT_4(MESSAGE,B,C,D));
	#define TRACE_5(MESSAGE,A,B,C,D,E) LOG(PFORMAT_5(MESSAGE,B,C,D,E));
	#define TRACE_6(MESSAGE,A,B,C,D,E,F) LOG(PFORMAT_6(MESSAGE,B,C,D,E,F));
	#define TRACE_7(MESSAGE,A,B,C,D,E,F,G) LOG(PFORMAT_7(MESSAGE,B,C,D,E,F,G));
	#define TRACE_8(MESSAGE,A,B,C,D,E,F,G,H) LOG(PFORMAT_8(MESSAGE,B,C,D,E,F,G,H));
	#define TRACE_9(MESSAGE,A,B,C,D,E,F,G,H,I) LOG(PFORMAT_9(MESSAGE,B,C,D,E,F,G,H,I));
#else	// disabled
	#define TRACE_1(MESSAGE,A)
	#define TRACE_2(MESSAGE,A,B)
	#define TRACE_3(MESSAGE,A,B,C)
	#define TRACE_4(MESSAGE,A,B,C,D)
	#define TRACE_5(MESSAGE,A,B,C,D,E)
	#define TRACE_6(MESSAGE,A,B,C,D,E,F)
	#define TRACE_7(MESSAGE,A,B,C,D,E,F,G)
	#define TRACE_8(MESSAGE,A,B,C,D,E,F,G,H)
	#define TRACE_9(MESSAGE,A,B,C,D,E,F,G,H,I)
#endif
