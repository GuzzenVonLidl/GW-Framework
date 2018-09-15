
if (isClass(configFile >> "CfgVehicles" >> "achilles_settings_f")) then {
	/*
	// Achilles - Available Factions
	Achilles_var_BLU_CTRG_F = true;
	Achilles_var_BLU_F = true;
	Achilles_var_BLU_GEN_F = true;
	Achilles_var_BLU_T_F = true;
	Achilles_var_CIV_F = true;
	Achilles_var_CIV_IDAP_F = true;
	Achilles_var_CUP_B_CDF = true;
	Achilles_var_CUP_B_CZ = true;
	Achilles_var_CUP_B_GB = true;
	Achilles_var_CUP_B_GER = true;
	Achilles_var_CUP_B_RNZN = true;
	Achilles_var_CUP_B_US = true;
	Achilles_var_CUP_B_US_Army = true;
	Achilles_var_CUP_B_USMC = true;
	Achilles_var_CUP_C_CHERNARUS = true;
	Achilles_var_CUP_C_RU = true;
	Achilles_var_CUP_C_SAHRANI = true;
	Achilles_var_CUP_C_Special = true;
	Achilles_var_CUP_C_TK = true;
	Achilles_var_CUP_I_NAPA = true;
	Achilles_var_CUP_I_PMC_ION = true;
	Achilles_var_CUP_I_RACS = true;
	Achilles_var_CUP_I_TK_GUE = true;
	Achilles_var_CUP_I_UN = true;
	Achilles_var_CUP_O_ChDKZ = true;
	Achilles_var_CUP_O_RU = true;
	Achilles_var_CUP_O_SLA = true;
	Achilles_var_CUP_O_TK = true;
	Achilles_var_CUP_O_TK_MILITIA = true;
	Achilles_var_FIR_AWS_ENEMY_F = true;
	Achilles_var_FIR_AWS_FRND_F = true;
	Achilles_var_GOL_AAC_BLUFOR = true;
	Achilles_var_GOL_AAC_INDEP = true;
	Achilles_var_GOL_AAC_OPFOR = true;
	Achilles_var_IND_C_F = true;
	Achilles_var_IND_F = true;
	Achilles_var_IND_G_F = true;
	Achilles_var_Interactive_F = true;
	Achilles_var_OPF_F = true;
	Achilles_var_OPF_T_F = true;
	Achilles_var_OPF_V_F = true;
	Achilles_var_OPFOR_RUSSIA = true;
	Achilles_var_rhs_faction_insurgents = true;
	Achilles_var_rhs_faction_msv = true;
	Achilles_var_rhs_faction_rva = true;
	Achilles_var_rhs_faction_socom = true;
	Achilles_var_rhs_faction_tv = true;
	Achilles_var_rhs_faction_usaf = true;
	Achilles_var_rhs_faction_usarmy = true;
	Achilles_var_rhs_faction_usarmy_d = true;
	Achilles_var_rhs_faction_usarmy_wd = true;
	Achilles_var_rhs_faction_usmc = true;
	Achilles_var_rhs_faction_usmc_d = true;
	Achilles_var_rhs_faction_usmc_wd = true;
	Achilles_var_rhs_faction_usn = true;
	Achilles_var_rhs_faction_vdv = true;
	Achilles_var_rhs_faction_vdv_45 = true;
	Achilles_var_rhs_faction_vmf = true;
	Achilles_var_rhs_faction_vpvo = true;
	Achilles_var_rhs_faction_vv = true;
	Achilles_var_rhs_faction_vvs = true;
	Achilles_var_rhs_faction_vvs_c = true;
	Achilles_var_Virtual_F = true;
	*/
	// Achilles - Curator Vision Modes
	force achilles_curator_vision_blackhot = false;
	force achilles_curator_vision_blackhotgreencold = false;
	force achilles_curator_vision_blackhotredcold = false;
	force achilles_curator_vision_greenhotcold = false;
	force achilles_curator_vision_nvg = true;
	force achilles_curator_vision_redgreen = false;
	force achilles_curator_vision_redhot = false;
	force achilles_curator_vision_whitehot = true;
	force achilles_curator_vision_whitehotredcold = false;

	// Achilles - Debug
	//	Achilles_Debug_Output_Enabled = false;

	// Achilles - Defaults
	force Achilles_var_setRadioFrequenciesLR_Default = "50";
	force Achilles_var_setRadioFrequenciesSR_Default = "150";

	// Achilles - Icon Selection
	force Achilles_var_iconSelection = "Achilles_var_iconSelection_Ares";

	// Achilles - Modules Interface
	force Achilles_var_moduleTreeCollapse = true;
	force Achilles_var_moduleTreeDLC = true;
	force Achilles_var_moduleTreeHelmet = false;
};

if (isClass(configFile >> "CfgVehicles" >> "diwako_ragdoll")) then {
	// Diwako's ACE Ragdolling
//	force diwako_ragdoll_ai = false;
//	force diwako_ragdoll_ragdolling = false;
};
