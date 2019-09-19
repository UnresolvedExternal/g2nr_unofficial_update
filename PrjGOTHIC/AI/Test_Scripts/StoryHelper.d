
instance ItPo_Story(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Story;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[0] = "����� Raven Video I";
};


func void UseItPo_Story()
{
	b_ravensescapeintotempelavi();
};


instance SH(Npc_Default)
{
	name[0] = "�������� �� ������";
	guild = GIL_NONE;
	id = 9999;
	voice = 15;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	B_GiveNpcTalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player,-1);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_9999;
};


func void Rtn_Start_9999()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"XXX");
	TA_Stand_ArmsCrossed(23,0,8,0,"XXX");
};


instance StoryHelper_Exit(C_Info)
{
	npc = sh;
	nr = 999;
	condition = StoryHelper_Exit_Condition;
	information = StoryHelper_Exit_Info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int StoryHelper_Exit_Condition()
{
	return TRUE;
};

func void StoryHelper_Exit_Info()
{
	AI_StopProcessInfos(self);
};

func void b_build_settings_diag()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
	Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_PatchSettings_BACK);
	if(Helmets_Enabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����� �� ��������",StoryHelper_Helmets);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����� � �������",StoryHelper_Helmets);
	};
	/*�� �������
	if(HonestStatCalculation == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ������� ������ ��������� ��������",StoryHelper_HonestStatCalculation);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ������� ������ ��������� ��������",StoryHelper_HonestStatCalculation);
	};*/
	if(EnterNW_Kapitel4 == FALSE)
	{
		if(OriginalAntipaladins == FALSE)
		{
			Info_AddChoice(StoryHelper_PatchSettings,"��������� ��������� ������������� �����",StoryHelper_Antipaladins);
		}
		else
		{
			Info_AddChoice(StoryHelper_PatchSettings,"�������� ��������� ������������� �����",StoryHelper_Antipaladins);
		};
	};
	if(AddonDisabled == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����������� ����������� ��� ������",StoryHelper_Addon);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����������� ����������� ��� ������",StoryHelper_Addon);
	};
	if(GuildlessMode == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����������� ����������� ��� �������",StoryHelper_Guildless);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����������� ����������� ��� �������",StoryHelper_Guildless);
	};
	if(!Npc_KnowsInfo(other,DIA_Coragon_GiveBook) && !Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		if(ClassicLehmarBook == FALSE)
		{
			Info_AddChoice(StoryHelper_PatchSettings,"�������� ����� ��������� � ������� � ��������",StoryHelper_LehmarBook);
		}
		else
		{
			Info_AddChoice(StoryHelper_PatchSettings,"��������� ����� ��������� � ������� � ��������",StoryHelper_LehmarBook);
		};
	};
	if(TradersHaveLimitedAmmo == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����� ������ ����� � ������ � ���������",StoryHelper_Limit);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����� ������ ����� � ������ � ���������",StoryHelper_Limit);
	};
	if(Dont_Fix_Unlim == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����������� ����� � �������� � ���������",StoryHelper_Unlimfix);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����������� ����� � �������� � ���������",StoryHelper_Unlimfix);
	};
	if(NpcWantToFlee == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����� �������� � ��",StoryHelper_Flee);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����� �������� � ��",StoryHelper_Flee);
	};
	if(IgnoreBonuses == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ������������� ������� ��� ��������",StoryHelper_Bonuses);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ������������� ������� ��� ��������",StoryHelper_Bonuses);
	};
	If(RandomGoblinBerries == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ��������� ���������� ����� � ���������",StoryHelper_GoblinBerries);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ��������� ���������� ����� � ���������",StoryHelper_GoblinBerries);
	};
	If(InfiniteApples == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ����������� ������",StoryHelper_Apples);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ����������� ������",StoryHelper_Apples);
	};
	If(XP_Static == FALSE)
	{
		Info_AddChoice(StoryHelper_PatchSettings,"�������� ������������� ���� �� ������",StoryHelper_XP);
	}
	else
	{
		Info_AddChoice(StoryHelper_PatchSettings,"��������� ������������� ���� �� ������",StoryHelper_XP);
	};
};
	
instance StoryHelper_PatchSettings(C_Info)
{
	npc = sh;
//	npc = NONE_100_Xardas;
	nr = 995;
	condition = StoryHelper_PatchSettings_Condition;
	information = StoryHelper_PatchSettings_Info;
	important = FALSE;
	permanent = TRUE;
	description = "(��������� �������������� ����������)";
};


func int StoryHelper_PatchSettings_Condition()
{
	return TRUE;
};

func void StoryHelper_PatchSettings_Info()
{
	b_build_settings_diag();
};

func void StoryHelper_Limit()
{
	if(TradersHaveLimitedAmmo == TRUE)
	{
		TradersHaveLimitedAmmo = FALSE;
		PrintScreen("����� ��������",-1,-1,FONT_Screen,2);
	}
	else
	{
		TradersHaveLimitedAmmo = TRUE;
		PrintScreen("����� �������",-1,-1,FONT_Screen,2);
	};
	b_build_settings_diag();
};

func void StoryHelper_Flee()
{
	if(NpcWantToFlee == TRUE)
	{
		NpcWantToFlee = FALSE;
		PrintScreen("����� �������� ��������",-1,-1,FONT_Screen,2);
	}
	else
	{
		NpcWantToFlee = TRUE;
		PrintScreen("����� �������� �������",-1,-1,FONT_Screen,2);
	};
	b_build_settings_diag();
};

func void StoryHelper_Unlimfix()
{
	if(Dont_Fix_Unlim == TRUE)
	{
		Dont_Fix_Unlim = FALSE;
		PrintScreen("����� � �������� ����������",-1,-1,FONT_Screen,2);
	}
	else
	{
		Dont_Fix_Unlim = TRUE;
		PrintScreen("����� � �������� ����������",-1,-1,FONT_Screen,2);
	};
	b_build_settings_diag();
};

func void StoryHelper_Bonuses()
{
	if(IgnoreBonuses == TRUE)
	{
		IgnoreBonuses = FALSE;
		PrintScreen("��������: ������ ����� ������",-1,-1,FONT_Screen,3);
	}
	else
	{
		IgnoreBonuses = TRUE;
		PrintScreen("������ ������ ����� �� ������",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_GoblinBerries()
{
	if(RandomGoblinBerries == TRUE)
	{
		RandomGoblinBerries = FALSE;
		PrintScreen("������������� ���������� ���� � ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		RandomGoblinBerries = TRUE;
		PrintScreen("��������� ���������� ���� � ���������",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Apples()
{
	if(InfiniteApples == TRUE)
	{
		InfiniteApples = FALSE;
		PrintScreen("����������� ������ ����������",-1,-1,FONT_Screen,3);
	}
	else
	{
		InfiniteApples = TRUE;
		PrintScreen("������ ����������",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Helmets()
{
	if(Helmets_Enabled == TRUE)
	{
		PrintScreen("����� � ������� ����� ������� (��������)",-1,-1,FONT_Screen,3);
		Npc_RemoveInvItem(hero,ITHE_PAL_M);
		Npc_RemoveInvItem(hero,ITHE_PAL_H);
		Npc_RemoveInvItem(hero,ITHE_DJG_M);
		Npc_RemoveInvItem(hero,ITHE_DJG_H);
		if(Npc_HasItems(hero,ITAR_PALN_M))
		{
			Npc_RemoveInvItem(hero,ITAR_PALN_M);
			CreateInvItems(hero,ITAR_PAL_M,1);
		};
		if(Npc_HasItems(hero,ITAR_PALN_H))
		{
			Npc_RemoveInvItem(hero,ITAR_PALN_H);
			CreateInvItems(hero,ITAR_PAL_H,1);
		};
		if(Npc_HasItems(hero,ITAR_DJGN_M))
		{
			Npc_RemoveInvItem(hero,ITAR_DJGN_M);
			CreateInvItems(hero,ITAR_DJG_M,1);
		};
		if(Npc_HasItems(hero,ITAR_DJGN_H))
		{
			Npc_RemoveInvItem(hero,ITAR_DJGN_H);
			CreateInvItems(hero,ITAR_DJG_H,1);
		};
		Helmets_Enabled = FALSE;
	}
	else
	{
		PrintScreen("����� � ������� ���������",-1,-1,FONT_Screen,3);
		if(Npc_HasItems(hero,ITAR_PAL_M))
		{
			Npc_RemoveInvItem(hero,ITAR_PAL_M);
			CreateInvItems(hero,ITAR_PALN_M,1);
			CreateInvItems(hero,ITHE_PAL_M,1);
		};
		if(Npc_HasItems(hero,ITAR_PAL_H))
		{
			Npc_RemoveInvItem(hero,ITAR_PAL_H);
			CreateInvItems(hero,ITAR_PALN_H,1);
			CreateInvItems(hero,ITHE_PAL_H,1);
		};
		if(Npc_HasItems(hero,ITAR_DJG_M))
		{
			Npc_RemoveInvItem(hero,ITAR_DJG_M);
			CreateInvItems(hero,ITAR_DJGN_M,1);
			CreateInvItems(hero,ITHE_DJG_M,1);
		};
		if(Npc_HasItems(hero,ITAR_DJG_H))
		{
			Npc_RemoveInvItem(hero,ITAR_DJG_H);
			CreateInvItems(hero,ITAR_DJGN_H,1);
			CreateInvItems(hero,ITHE_DJG_H,1);
		};
		Helmets_Enabled = TRUE;
	};
	b_build_settings_diag();
};

func void StoryHelper_LehmarBook()
{
	if(ClassicLehmarBook == TRUE)
	{
		ClassicLehmarBook = FALSE;
		PrintScreen("����� ��������� ��������",-1,-1,FONT_Screen,3);
	}
	else
	{
		ClassicLehmarBook = TRUE;
		PrintScreen("����� ��������� ��� � ���������",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Guildless()
{
	if(GuildlessMode == TRUE)
	{
		GuildlessMode = FALSE;
		PrintScreen("����������� ��� ������� ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		GuildlessMode = TRUE;
		PrintScreen("����������� ��� ������� ��������",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Addon()
{
	if(AddonDisabled == TRUE)
	{
		AddonDisabled = FALSE;
		PrintScreen("����������� ��� ������ ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		AddonDisabled = TRUE;
		PrintScreen("����������� ��� ������ ��������",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_Antipaladins()
{
	if(OriginalAntipaladins == TRUE)
	{
		OriginalAntipaladins = FALSE;
		OrkElite_AntiPaladin_Level = 50;
		OrkElite_AntiPaladin_Strength = 140;
		OrkElite_AntiPaladin_HP = 550;
		OrkElite_AntiPaladin_Protection = 170;
		PrintScreen("��������� ������������ ����� ��������",-1,-1,FONT_Screen,3);
	}
	else
	{
		OriginalAntipaladins = TRUE;
		OrkElite_AntiPaladin_Level = 45;
		OrkElite_AntiPaladin_Strength = 125;
		OrkElite_AntiPaladin_HP = 450;
		OrkElite_AntiPaladin_Protection = 160;
		PrintScreen("��������� ������������ ����� ���������",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};

func void StoryHelper_XP()
{
	if(XP_Static == TRUE)
	{
		XP_Static = FALSE;
		if(Kapitel == 1)
		{
			XP_Ambient = XP_AmbientKap1;
		};
		if(Kapitel == 2)
		{
			XP_Ambient = XP_AmbientKap2;
		};
		if(Kapitel == 3)
		{
			XP_Ambient = XP_AmbientKap3;
		};
		if(Kapitel == 4)
		{
			XP_Ambient = XP_AmbientKap4;
		};
		if(Kapitel == 5)
		{
			XP_Ambient = XP_AmbientKap5;
		};
		if(Kapitel == 6)
		{
			XP_Ambient = XP_AmbientKap6;
		};
		PrintScreen("��������: ������������ ���� �� ������",-1,-1,FONT_Screen,3);
		b_build_settings_diag();
	}
	else
	{
		Info_ClearChoices(StoryHelper_PatchSettings);
		Info_AddChoice(StoryHelper_PatchSettings,Dialog_Back,StoryHelper_XP_Back);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 300 (����� 6)",StoryHelper_XP_6);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 250 (����� 5)",StoryHelper_XP_5);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 200 (����� 4)",StoryHelper_XP_4);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 150 (����� 3)",StoryHelper_XP_3);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 100 (����� 2)",StoryHelper_XP_2);
		Info_AddChoice(StoryHelper_PatchSettings,"XP_Ambient = 50  (����� 1)",StoryHelper_XP_1);
	};
};

func void StoryHelper_XP_Back()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_6()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap6;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 300 (����� 6)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_5()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap5;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 250 (����� 5)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_4()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap4;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 200 (����� 4)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_3()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap3;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 150 (����� 3)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_2()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap2;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 100 (����� 2)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

func void StoryHelper_XP_1()
{
	XP_Static = TRUE;
	XP_Ambient = XP_AmbientKap1;
	PrintScreen("������ ������ ����� �� �����������",-1,40,FONT_Screen,3);
	PrintScreen("XP_Ambient = 50 (����� 1)",-1,45,FONT_Screen,3);
	Info_ClearChoices(StoryHelper_PatchSettings);
	b_build_settings_diag();
};

/*func void StoryHelper_HonestStatCalculation()
{
	if(HonestStatCalculation == TRUE)
	{
		HonestStatCalculation = FALSE;
		PrintScreen("������ ��������� �������� ��� � ���������",-1,-1,FONT_Screen,3);
	}
	else
	{
		HonestStatCalculation = TRUE;
		PrintScreen("������� ������ ��������� �������� �������",-1,-1,FONT_Screen,3);
	};
	b_build_settings_diag();
};*/

func void StoryHelper_PatchSettings_BACK()
{
	Info_ClearChoices(StoryHelper_PatchSettings);
};

/////////////////////////

instance StoryHelper_INFO1(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO1_Condition;
	information = StoryHelper_INFO1_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_1;
};


func int StoryHelper_INFO1_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO1_Info()
{
	Info_ClearChoices(StoryHelper_INFO1);
	Info_AddChoice(StoryHelper_INFO1,Dialog_Back,StoryHelper_BACK1);
	Info_AddChoice(StoryHelper_INFO1,KapAnfang,StoryHelper_KAPITEL1ANFANG);
	Info_AddChoice(StoryHelper_INFO1,"����� ����� � ������ ������� � ��������� (������ � ������)",StoryHelper_SATURAS);
	Info_AddChoice(StoryHelper_INFO1,"����� ��� � ����������",StoryHelper_Cavalorn);
};

func void StoryHelper_SATURAS()
{
	MIS_Addon_Lares_Ornament2Saturas = LOG_Running;
	CreateInvItems(other,ItMi_Ornament_Addon,1);
	SC_KnowsRanger = TRUE;
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
};

func void StoryHelper_Cavalorn()
{
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	//�������� ������ ��� �������
	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
	//������ ��������, ����������� ������ ��������
	MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
	//��� �� ��������� ����?
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	//������ ����� :)
	CreateInvItems(hero,ItRi_Ranger_Addon,1);	
	//����� �������� �����
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_RUNNING;
	//...� �������� ���������� � ���� �� ���
	B_StartotherRoutine(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	//����� ������� ����� ������
	CreateInvItems(hero,ItWr_Map_NewWorld_Ornaments_Addon,1);	
	AI_StopProcessInfos(self);
};

func void StoryHelper_BACK1()
{
	Info_ClearChoices(StoryHelper_INFO1);
};

func void StoryHelper_KAPITEL1ANFANG()
{
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO2(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO2_Condition;
	information = StoryHelper_INFO2_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_2;
};


func int StoryHelper_INFO2_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO2_Info()
{
	Info_ClearChoices(StoryHelper_INFO2);
	Info_AddChoice(StoryHelper_INFO2,Dialog_Back,StoryHelper_BACK2);
	Info_AddChoice(StoryHelper_INFO2,KapAnfang,StoryHelper_KAPITEL2ANFANG);
};

func void StoryHelper_BACK2()
{
	Info_ClearChoices(StoryHelper_INFO2);
};

func void StoryHelper_KAPITEL2ANFANG()
{
	Torwache_305.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_StartOtherRoutine(Lothar,"START");
	CreateInvItems(hero,ItKe_Pass_MIS,1);
	MIS_OLDWORLD = LOG_Running;
	B_Kapitelwechsel(2,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO2);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO3(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO3_Condition;
	information = StoryHelper_INFO3_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_3;
};


func int StoryHelper_INFO3_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO3_Info()
{
	Info_ClearChoices(StoryHelper_INFO3);
	Info_AddChoice(StoryHelper_INFO3,Dialog_Back,StoryHelper_BACK3);
	Info_AddChoice(StoryHelper_INFO3,KapAnfang,StoryHelper_KAPITEL3ANFANG);
};

func void StoryHelper_BACK3()
{
	Info_ClearChoices(StoryHelper_INFO3);
};

func void StoryHelper_KAPITEL3ANFANG()
{
	MIS_OLDWORLD = LOG_Running;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OLDWORLD_ZEN);
	B_Kapitelwechsel(3,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO3);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO4(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO4_Condition;
	information = StoryHelper_INFO4_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_4;
};


func int StoryHelper_INFO4_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO4_Info()
{
	Info_ClearChoices(StoryHelper_INFO4);
	Info_AddChoice(StoryHelper_INFO4,Dialog_Back,StoryHelper_BACK4);
	Info_AddChoice(StoryHelper_INFO4,KapAnfang,StoryHelper_KAPITEL4ANFANG);
};

func void StoryHelper_BACK4()
{
	Info_ClearChoices(StoryHelper_INFO4);
};

func void StoryHelper_KAPITEL4ANFANG()
{
	MIS_OLDWORLD = LOG_Running;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OLDWORLD_ZEN);
	B_Kapitelwechsel(3,NEWWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye,-1,-1,FONT_Screen,2);
	CreateInvItems(self,ItMi_InnosEye_MIS,1);
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	B_Kapitelwechsel(4,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO4);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO5(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO5_Condition;
	information = StoryHelper_INFO5_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_5;
};


func int StoryHelper_INFO5_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO5_Info()
{
	Info_ClearChoices(StoryHelper_INFO5);
	Info_AddChoice(StoryHelper_INFO5,Dialog_Back,StoryHelper_BACK5);
	Info_AddChoice(StoryHelper_INFO5,KapAnfang,StoryHelper_KAPITEL5ANFANG);
};

func void StoryHelper_BACK5()
{
	Info_ClearChoices(StoryHelper_INFO5);
};

func void StoryHelper_KAPITEL5ANFANG()
{
	MIS_OLDWORLD = LOG_Running;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OLDWORLD_ZEN);
	B_Kapitelwechsel(3,NEWWORLD_ZEN);
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye,-1,-1,FONT_Screen,2);
	CreateInvItems(hero,ItMi_InnosEye_MIS,1);
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	B_Kapitelwechsel(4,NEWWORLD_ZEN);
	CreateInvItems(hero,ItAt_IcedragonHeart,1);	//����� ��� ���� � ��� �� ��������!
	MIS_AllDragonsDead = TRUE;
	B_Kapitelwechsel(5,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO5);
	AI_StopProcessInfos(self);
};


instance StoryHelper_INFO6(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO6_Condition;
	information = StoryHelper_INFO6_Info;
	important = FALSE;
	permanent = TRUE;
	description = KapWechsel_6;
};


func int StoryHelper_INFO6_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO6_Info()
{
	Info_ClearChoices(StoryHelper_INFO6);
	Info_AddChoice(StoryHelper_INFO6,Dialog_Back,StoryHelper_BACK6);
	Info_AddChoice(StoryHelper_INFO6,KapAnfang,StoryHelper_KAPITEL6ANFANG);
};

func void StoryHelper_BACK6()
{
	Info_ClearChoices(StoryHelper_INFO6);
};

func void StoryHelper_KAPITEL6ANFANG()
{
	B_Kapitelwechsel(6,NEWWORLD_ZEN);
	Info_ClearChoices(StoryHelper_INFO6);
	AI_StopProcessInfos(self);
};

