
class ACE_Medical_Actions {
	class Basic {
		class Bandage;
		class CPR: Bandage {
			condition = "!([(_this select 1)] call ace_common_fnc_isAwake)";
			callbackSuccess = QUOTE(DFUNC(treatmentAdvanced_CPR));
			callbackProgress = "!([((_this select 0) select 1)] call ace_common_fnc_isAwake)";
		};
	};
};
