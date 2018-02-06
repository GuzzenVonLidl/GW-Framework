if (hasInterface) then {
	
    _condition = {player in [w1a,w1a1,w1b1,w1c1,e1a,e1a1,e1b1,e1c1,i1a,i1a1,i1b1,i1c1]};//<only works MP 
    _code = {openMap true;[player, systemChat "Pilot: Awaiting coordinates"] onMapSingleClick {[blufor,"","drop",    ["spawn",_pos,"despawn"],"Scripts\NEKY_supply\Supply Box Templates\Medical.sqf",false] execVM "Scripts\NEKY_supply\NEKY_SupplyMapClick.sqf"}};
    _landcode = {openMap true;[player, systemChat "Pilot: Awaiting coordinates"] onMapSingleClick {[blufor,"","unload",    ["spawn",_pos,"despawn"],"Scripts\NEKY_supply\Supply Box Templates\Medical.sqf",false] execVM "Scripts\NEKY_supply\NEKY_SupplyMapClick.sqf"}};
	
	_action = ["Medical Resupply", "Medical Resupply","Scripts\NEKY_supply\ui\medical_cross.paa", {}, _condition] call ace_interact_menu_fnc_createAction;
	_drop = ["Airdrop", "Airdrop","Scripts\NEKY_supply\ui\Chute.paa", _code, _condition] call ace_interact_menu_fnc_createAction;
	_unload = ["Unload", "Unload","Scripts\NEKY_supply\ui\Helli.paa", _landcode, _condition] call ace_interact_menu_fnc_createAction;
	
    [typeOf player, 1, ["ACE_SelfActions","ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;
	[typeOf player, 1, ["ACE_SelfActions","ACE_Equipment","Medical Resupply"], _drop] call ace_interact_menu_fnc_addActionToClass;
	[typeOf player, 1, ["ACE_SelfActions","ACE_Equipment","Medical Resupply"], _unload] call ace_interact_menu_fnc_addActionToClass;
};
//_condition = {leader (group player) isEqualTo (leader player)}; 