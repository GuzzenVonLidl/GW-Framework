#define	COMPONENT ServiceStation
#include "..\scriptComponent.hpp"

// General
#define RADIUS 8					// Area (meters) the SS will scan for vehicles.
#define BLINKINGLIGHTS true			// Blinking BLINKINGLIGHTS on/off. True = on.

// Repair
#define INSPECTIONSPEED 3			// Time in seconds it takes to inspect each part of the vehicle.
#define REPAIRINGSPEED 0.04			// Percent of maximum HP (per part) repaired (ground vehicles and heli) per second.							 0 = 0%, 1 = 100%.
#define REPAIRINGTRACKSPEED 0.01	// Percent of maximum HP of left and right Track (per track)(Tanks) repaired per second.				 	 0 = 0%, 1 = 100%.
#define REPAIRINGSPEEDPLANE 0.01	// Percent of maximum HP (whole plane since it only has 1 part) repaired (planes) per second.				 0 = 0%, 1 = 100%.
#define REFUELING 0.01				// Percent of maximum fuel refueled per second.																 0 = 0%, 1 = 100%.

#define REMOVEWHEELSPEED 5			// Time in seconds it takes to remove a damaged wheel.
#define MOUNTWHEELSPEED 5			// Time in seconds it takes to mount a new wheel.

#define REARMSLEEP 0.02				// Percent of maximum ammo rearmed per second for vehicles.
