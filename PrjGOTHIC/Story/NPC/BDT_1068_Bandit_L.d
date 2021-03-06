
instance BDT_1068_Bandit_L(Npc_Default)
{
	name[0] = NAME_Bandit;
	guild = GIL_BDT;
	id = 1068;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Normal01,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1068;
};


func void Rtn_Start_1068()
{
	TA_Sleep(0,2,8,0,"NW_CASTLEMINE_TOWER_08");
	TA_Sit_Chair(8,0,0,2,"NW_CASTLEMINE_TOWER_06");
};

func void Rtn_Attack_1068()
{
	TA_Stand_WP(0,2,8,0,"NW_CASTLEMINE_TOWER_04");
	TA_Stand_WP(8,0,0,2,"NW_CASTLEMINE_TOWER_04");
};

