#include "..\scriptComponent.hpp"

params ["_unit"];

private _newPos = (_unit getPos [25,floor(random 360)]);

_unit doMove _newPos;
