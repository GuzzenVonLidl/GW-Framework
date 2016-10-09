#include "scriptComponent.hpp"

//PREP(returnTrue);
PREP(Actions);
PREP(FullService);
PREP(Init);
PREP(InitMobile);
PREP(Lights);
PREP(Rearm);
PREP(Refuel);
PREP(Repair);

FUNC(Busy) = { Hint "Service Station is busy, please wait for current service to be finished." };
FUNC(Available) = {
	GVAR(Active) DeleteAt (GVAR(Active) find (_This select 0));
	PublicVariable QGVAR(Active);
	if (_This select 1) then {
		Hint "You have left the Service station, service ending."
	};
};
FUNC(Hints) = {
	if (((Player distance (_This select 1)) <= 15) or (driver (_This select 1) == player)) then {
		Hint (_This select 0)
	};
	if !(driver (_This select 1) isEqualTo ObjNull) then {
		[[[(_This select 0)],{Hint (_This select 0)}], "BIS_FNC_SPAWN", (_This select 1)] call BIS_FNC_MP;
	};
};

GVAR(Active) = [];
GVAR(Actions) = [];
GVAR(Array) = [];
GVAR(Stations) = [];

// General
GVAR(Radius) = 8;					// Area (meters) the SS will scan for vehicles.
GVAR(Lights) = true;				// Blinking lights on/off. True = on.

// Repair
GVAR(InspectionSpeed) = 3;			// Time in seconds it takes to inspect each part of the vehicle.
GVAR(RepairingSpeed) = 0.04;		// Percent of maximum HP (per part) repaired (ground vehicles and heli) per second.														 0 = 0%, 1 = 100%.
GVAR(RepairingTrackSpeed) = 0.01;	// Percent of maximum HP of left and right Track (per track)(Tanks) repaired per second.				 								 0 = 0%, 1 = 100%.
GVAR(RepairingSpeedPlane) = 0.01;	// Percent of maximum HP (whole plane since it only has 1 part) repaired (planes) per second.											 0 = 0%, 1 = 100%.
GVAR(Refueling) = 0.01;				// Percent of maximum fuel refueled per second.																							 0 = 0%, 1 = 100%.

GVAR(RemoveWheelSpeed) = 5;			// Time in seconds it takes to remove a damaged wheel.
GVAR(MountWheelSpeed) = 5;			// Time in seconds it takes to mount a new wheel.
//
GVAR(RearmSleep) = 5;				// Time in seconds it takes to rearm vehicles (save planes).
GVAR(RearmSleepPlane) = 5;			// Time in seconds it takes to rearm a plane.

// Mobile Service Station
GVAR(MRadius) = 20;			// Area (meters) the Mobile SS will scan for vehicles.
