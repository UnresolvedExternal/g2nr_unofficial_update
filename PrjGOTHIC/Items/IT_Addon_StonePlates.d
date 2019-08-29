
const int STR_StPlLevel1 = 2;
const int STR_StPlLevel2 = 4;
const int STR_StPlLevel3 = 6;
const int DEX_StPlLevel1 = 2;
const int DEX_StPlLevel2 = 4;
const int DEX_StPlLevel3 = 6;
const int HPMax_StPlLevel1 = 5;
const int HPMax_StPlLevel2 = 10;
const int HPMax_StPlLevel3 = 15;
const int ManaMax_StPlLevel1 = 2;
const int ManaMax_StPlLevel2 = 4;
const int ManaMax_StPlLevel3 = 6;
const int OneH_StPlLevel1 = 2;
const int OneH_StPlLevel2 = 4;
const int OneH_StPlLevel3 = 6;
const int TwoH_StPlLevel1 = 2;
const int TwoH_StPlLevel2 = 4;
const int TwoH_StPlLevel3 = 6;
const int Bow_StPlLevel1 = 2;
const int Bow_StPlLevel2 = 4;
const int Bow_StPlLevel3 = 6;
const int CrsBow_StPlLevel1 = 2;
const int CrsBow_StPlLevel2 = 4;
const int CrsBow_StPlLevel3 = 6;
const int Value_StonePlateMagic = 100;
const int value_StonePlateCommon = 5;
var int StoneplateItem;
var int StoneplateLevel;
const int StrStonePlate = 2;
const int DexStonePlate = 3;
const int HitPointStonePlate = 4;
const int ManaStonePlate = 5;
const int OneHStonePlate = 6;
const int TwoHStonePlate = 7;
const int BowStonePlate = 8;
const int CrsBowStonePlate = 9;

const string StPl_MagicAuraText = "��� �������� �������� �������� ���������� ����.";
const string StPl_StandardText = "";

func void B_CannotUse_Addon()
{
	var int rnd;
	rnd = Hlp_Random(100);
	if(rnd <= 20)
	{
		B_Say(self,self,"$COUGH");
	}
	else if(rnd >= 80)
	{
		B_Say(self,self,"$HUI");
	};
};

func int C_SCHasStPlSkill()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		return FALSE;
	};
	if(StoneplateLevel == 1)
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
		{
			return TRUE;
		};
	}
	else if(StoneplateLevel == 2)
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
		{
			return TRUE;
		};
	}
	else if(StoneplateLevel == 3)
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
		{
			return TRUE;
		};
	};
};

func void Use_StonePlate()
{
	var string concatText;
	if(!C_SCHasStPlSkill())
	{
		B_CannotUse_Addon();
		B_Say(self,self,"$CANTREADTHIS");
		AI_Waitms(self,500);
	}
	else
	{
		if(StoneplateItem == StrStonePlate)
		{
			concatText = PRINT_LearnSTR;
			if(StoneplateLevel == 1)
			{
				B_RaiseAttribute(self,ATR_STRENGTH,STR_StPlLevel1);
				concatText = ConcatStrings(concatText,IntToString(STR_StPlLevel1));
//				B_Say(self,self,"STONEPLATE_1");
			}
			else if(StoneplateLevel == 2)
			{
				B_RaiseAttribute(self,ATR_STRENGTH,STR_StPlLevel2);
				concatText = ConcatStrings(concatText,IntToString(STR_StPlLevel2));
//				B_Say(self,self,"STONEPLATE_2");
			}
			else if(StoneplateLevel == 3)
			{
				B_RaiseAttribute(self,ATR_STRENGTH,STR_StPlLevel3);
				concatText = ConcatStrings(concatText,IntToString(STR_StPlLevel3));
//				B_Say(self,self,"STONEPLATE_3");
			};
		}
		else if(StoneplateItem == DexStonePlate)
		{
			concatText = PRINT_LearnDEX;
			if(StoneplateLevel == 1)
			{
				B_RaiseAttribute(self,ATR_DEXTERITY,DEX_StPlLevel1);
				concatText = ConcatStrings(concatText,IntToString(DEX_StPlLevel1));
//				B_Say(self,self,"STONEPLATE_1");
			}
			else if(StoneplateLevel == 2)
			{
				B_RaiseAttribute(self,ATR_DEXTERITY,DEX_StPlLevel2);
				concatText = ConcatStrings(concatText,IntToString(DEX_StPlLevel2));
//				B_Say(self,self,"STONEPLATE_2");
			}
			else if(StoneplateLevel == 3)
			{
				B_RaiseAttribute(self,ATR_DEXTERITY,DEX_StPlLevel3);
				concatText = ConcatStrings(concatText,IntToString(DEX_StPlLevel3));
//				B_Say(self,self,"STONEPLATE_3");
			};
		}
		else if(StoneplateItem == HitPointStonePlate)
		{
			concatText = PRINT_Learnhitpoints_MAX;
			if(StoneplateLevel == 1)
			{
				B_RaiseAttribute(self,ATR_HITPOINTS_MAX,HPMax_StPlLevel1);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMax_StPlLevel1);
				concatText = ConcatStrings(concatText,IntToString(HPMax_StPlLevel1));
//				B_Say(self,self,"STONEPLATE_1");
			}
			else if(StoneplateLevel == 2)
			{
				B_RaiseAttribute(self,ATR_HITPOINTS_MAX,HPMax_StPlLevel2);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMax_StPlLevel2);
				concatText = ConcatStrings(concatText,IntToString(HPMax_StPlLevel2));
//				B_Say(self,self,"STONEPLATE_2");
			}
			else if(StoneplateLevel == 3)
			{
				B_RaiseAttribute(self,ATR_HITPOINTS_MAX,HPMax_StPlLevel3);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMax_StPlLevel3);
				concatText = ConcatStrings(concatText,IntToString(HPMax_StPlLevel3));
//				B_Say(self,self,"STONEPLATE_3");
			};
		}
		else if(StoneplateItem == ManaStonePlate)
		{
			concatText = PRINT_LearnMANA_MAX;
			if(StoneplateLevel == 1)
			{
				B_RaiseAttribute(self,ATR_MANA_MAX,ManaMax_StPlLevel1);
//				Npc_ChangeAttribute(self,ATR_MANA,ManaMax_StPlLevel1);
				concatText = ConcatStrings(concatText,IntToString(ManaMax_StPlLevel1));
//				B_Say(self,self,"STONEPLATE_1");
			}
			else if(StoneplateLevel == 2)
			{
				B_RaiseAttribute(self,ATR_MANA_MAX,ManaMax_StPlLevel2);
//				Npc_ChangeAttribute(self,ATR_MANA,ManaMax_StPlLevel2);
				concatText = ConcatStrings(concatText,IntToString(ManaMax_StPlLevel2));
//				B_Say(self,self,"STONEPLATE_2");
			}
			else if(StoneplateLevel == 3)
			{
				B_RaiseAttribute(self,ATR_MANA_MAX,ManaMax_StPlLevel3);
//				Npc_ChangeAttribute(self,ATR_MANA,ManaMax_StPlLevel3);
				concatText = ConcatStrings(concatText,IntToString(ManaMax_StPlLevel3));
//				B_Say(self,self,"STONEPLATE_3");
			};
		}
		else if(StoneplateItem == OneHStonePlate)
		{
			if(Current1HBonus > 0)
			{
				Current1HBonusRemoved = Current1HBonus;
				if(Current1HBonus == 1)
				{
					UnEquip_1H_01();
				}
				else if(Current1HBonus == 2)
				{
					UnEquip_1H_02();
				}
				else if(Current1HBonus == 3)
				{
					UnEquip_1H_03();
				}
				else if(Current1HBonus == 4)
				{
					UnEquip_1H_04();
				}
				else if(Current1HBonus == 5)
				{
					UnEquip_1H_05();
				}
				else if(Current1HBonus == 6)
				{
					UnEquip_1H_06();
				}
				else if(Current1HBonus == 7)
				{
					UnEquip_1H_07();
				}
				else if(Current1HBonus == 8)
				{
					UnEquip_1H_08();
				}
				else if(Current1HBonus == 9)
				{
					UnEquip_1H_09();
				}
				else if(Current1HBonus == 10)
				{
					UnEquip_1H_10();
				};
			};
			if(MorgansRing == TRUE)
			{
				UnEquip_MorgansRing();
				MorgansRingUnequippedForTablet = TRUE;
			};
			if(hero.HitChance[NPC_TALENT_1H] < 100)
			{
				concatText = PRINT_Learn1H;
				if(StoneplateLevel == 1)
				{
					B_RaiseFightTalent(self,NPC_TALENT_1H,OneH_StPlLevel1);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(OneH_StPlLevel1));
				}
				else if(StoneplateLevel == 2)
				{
					B_RaiseFightTalent(self,NPC_TALENT_1H,OneH_StPlLevel2);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(OneH_StPlLevel2));
				}
				else if(StoneplateLevel == 3)
				{
					B_RaiseFightTalent(self,NPC_TALENT_1H,OneH_StPlLevel3);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(OneH_StPlLevel3));
				};
				PrintScreen(concatText,-1,-1,FONT_Screen,2);
				Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
				Snd_Play("SFX_HealObsession");
			}
			else
			{
				PrintScreen("���������� ��������� ����������!",-1,-1,FONT_Screen,2);
				Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
				B_Say(self,self,"$PickBroke");
				AI_Waitms(self,500);
			};
			if(MorgansRingUnequippedForTablet == TRUE)
			{
				Equip_MorgansRing();
				MorgansRingUnequippedForTablet = FALSE;
			};
			if(Current1HBonusRemoved > 0)
			{
				if(Current1HBonusRemoved == 1)
				{
					Equip_1H_01();
				}
				else if(Current1HBonusRemoved == 2)
				{
					Equip_1H_02();
				}
				else if(Current1HBonusRemoved == 3)
				{
					Equip_1H_03();
				}
				else if(Current1HBonusRemoved == 4)
				{
					Equip_1H_04();
				}
				else if(Current1HBonusRemoved == 5)
				{
					Equip_1H_05();
				}
				else if(Current1HBonusRemoved == 6)
				{
					Equip_1H_06();
				}
				else if(Current1HBonusRemoved == 7)
				{
					Equip_1H_07();
				}
				else if(Current1HBonusRemoved == 8)
				{
					Equip_1H_08();
				}
				else if(Current1HBonusRemoved == 9)
				{
					Equip_1H_09();
				}
				else if(Current1HBonusRemoved == 10)
				{
					Equip_1H_10();
				};
				Current1HBonusRemoved = 0;
			};
		}
		else if(StoneplateItem == TwoHStonePlate)
		{
			if(Current2HBonus > 0)
			{
				Current2HBonusRemoved = Current2HBonus;
				if(Current2HBonus == 1)
				{
					UnEquip_2H_01();
				}
				else if(Current2HBonus == 2)
				{
					UnEquip_2H_02();
				}
				else if(Current2HBonus == 3)
				{
					UnEquip_2H_03();
				}
				else if(Current2HBonus == 4)
				{
					UnEquip_2H_04();
				}
				else if(Current2HBonus == 5)
				{
					UnEquip_2H_05();
				}
				else if(Current2HBonus == 6)
				{
					UnEquip_2H_06();
				}
				else if(Current2HBonus == 7)
				{
					UnEquip_2H_07();
				}
				else if(Current2HBonus == 8)
				{
					UnEquip_2H_08();
				}
				else if(Current2HBonus == 9)
				{
					UnEquip_2H_09();
				}
				else if(Current2HBonus == 10)
				{
					UnEquip_2H_10();
				};
			};
			if(hero.HitChance[NPC_TALENT_2H] < 100)
			{
				concatText = PRINT_Learn2H;
				if(StoneplateLevel == 1)
				{
					B_RaiseFightTalent(self,NPC_TALENT_2H,TwoH_StPlLevel1);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(TwoH_StPlLevel1));
				}
				else if(StoneplateLevel == 2)
				{
					B_RaiseFightTalent(self,NPC_TALENT_2H,TwoH_StPlLevel2);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(TwoH_StPlLevel2));
				}
				else if(StoneplateLevel == 3)
				{
					B_RaiseFightTalent(self,NPC_TALENT_2H,TwoH_StPlLevel3);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(TwoH_StPlLevel3));
				};
				PrintScreen(concatText,-1,-1,FONT_Screen,2);
				Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
				Snd_Play("SFX_HealObsession");
			}
			else
			{
				PrintScreen("���������� ��������� ����������!",-1,-1,FONT_Screen,2);
				Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
				B_Say(self,self,"$PickBroke");
				AI_Waitms(self,500);
			};
			if(Current2HBonusRemoved > 0)
			{
				if(Current2HBonusRemoved == 1)
				{
					Equip_2H_01();
				}
				else if(Current2HBonusRemoved == 2)
				{
					Equip_2H_02();
				}
				else if(Current2HBonusRemoved == 3)
				{
					Equip_2H_03();
				}
				else if(Current2HBonusRemoved == 4)
				{
					Equip_2H_04();
				}
				else if(Current2HBonusRemoved == 5)
				{
					Equip_2H_05();
				}
				else if(Current2HBonusRemoved == 6)
				{
					Equip_2H_06();
				}
				else if(Current2HBonusRemoved == 7)
				{
					Equip_2H_07();
				}
				else if(Current2HBonusRemoved == 8)
				{
					Equip_2H_08();
				}
				else if(Current2HBonusRemoved == 9)
				{
					Equip_2H_09();
				}
				else if(Current2HBonusRemoved == 10)
				{
					Equip_2H_10();
				};
				Current2HBonusRemoved = 0;
			};
		}
		else if(StoneplateItem == BowStonePlate)
		{
			if(hero.HitChance[NPC_TALENT_BOW] < 100)
			{
				concatText = PRINT_LearnBow;
				if(StoneplateLevel == 1)
				{
					B_RaiseFightTalent(self,NPC_TALENT_BOW,Bow_StPlLevel1);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(Bow_StPlLevel1));
				}
				else if(StoneplateLevel == 2)
				{
					B_RaiseFightTalent(self,NPC_TALENT_BOW,Bow_StPlLevel2);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(Bow_StPlLevel2));
				}
				else if(StoneplateLevel == 3)
				{
					B_RaiseFightTalent(self,NPC_TALENT_BOW,Bow_StPlLevel3);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(Bow_StPlLevel3));
				};
				PrintScreen(concatText,-1,-1,FONT_Screen,2);
				Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
				Snd_Play("SFX_HealObsession");
			}
			else
			{
				PrintScreen("���������� ��������� ����������!",-1,-1,FONT_Screen,2);
				Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
				B_Say(self,self,"$PickBroke");
				AI_Waitms(self,500);
			};
		}
		else if(StoneplateItem == CrsBowStonePlate)
		{
			if(hero.HitChance[NPC_TALENT_CROSSBOW] < 100)
			{
				concatText = PRINT_LearnCrossbow;
				if(StoneplateLevel == 1)
				{
					B_RaiseFightTalent(self,NPC_TALENT_CROSSBOW,CrsBow_StPlLevel1);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(CrsBow_StPlLevel1));
				}
				else if(StoneplateLevel == 2)
				{
					B_RaiseFightTalent(self,NPC_TALENT_CROSSBOW,CrsBow_StPlLevel2);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(CrsBow_StPlLevel2));
				}
				else if(StoneplateLevel == 3)
				{
					B_RaiseFightTalent(self,NPC_TALENT_CROSSBOW,CrsBow_StPlLevel3);
					concatText = ConcatStrings(concatText," + ");
					concatText = ConcatStrings(concatText,IntToString(CrsBow_StPlLevel3));
				};
				PrintScreen(concatText,-1,-1,FONT_Screen,2);
				Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
				Snd_Play("SFX_HealObsession");
			}
			else
			{
				PrintScreen("���������� ��������� ����������!",-1,-1,FONT_Screen,2);
				Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
				B_Say(self,self,"$PickBroke");
				AI_Waitms(self,500);
			};
		};
		if((StoneplateItem != OneHStonePlate) && (StoneplateItem != TwoHStonePlate) && (StoneplateItem != BowStonePlate) && (StoneplateItem != CrsBowStonePlate))
		{
			PrintScreen(concatText,-1,-1,FONT_Screen,2);
			Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
			Snd_Play("SFX_HealObsession");
		};
	};
	StoneplateItem = 0;
	StoneplateLevel = 0;
};


prototype Prototype_StonePlate(C_Item)
{
	name = "�������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_StonePlateMagic;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	text[2] = StPl_MagicAuraText;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_StrStonePlate1_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ���� I";
	on_state[0] = Use_StrStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};


func void Use_StrStonePlate1()
{
	StoneplateItem = StrStonePlate;
	StoneplateLevel = 1;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_StrStonePlate1_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_StrStonePlate2_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ���� II";
	on_state[0] = Use_StrStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};


func void Use_StrStonePlate2()
{
	StoneplateItem = StrStonePlate;
	StoneplateLevel = 2;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_StrStonePlate2_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_StrStonePlate3_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ���� III";
	on_state[0] = Use_StrStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
};


func void Use_StrStonePlate3()
{
	StoneplateItem = StrStonePlate;
	StoneplateLevel = 3;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_StrStonePlate3_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_DexStonePlate1_Addon(Prototype_StonePlate)
{
	description = "�������� �������� �������� I";
	on_state[0] = Use_DexStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};


func void Use_DexStonePlate1()
{
	StoneplateItem = DexStonePlate;
	StoneplateLevel = 1;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_DexStonePlate1_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_DexStonePlate2_Addon(Prototype_StonePlate)
{
	description = "�������� �������� �������� II";
	on_state[0] = Use_DexStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};


func void Use_DexStonePlate2()
{
	StoneplateItem = DexStonePlate;
	StoneplateLevel = 2;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_DexStonePlate2_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_DexStonePlate3_Addon(Prototype_StonePlate)
{
	description = "�������� �������� �������� III";
	on_state[0] = Use_DexStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_02.3DS";
};


func void Use_DexStonePlate3()
{
	StoneplateItem = DexStonePlate;
	StoneplateLevel = 3;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_DexStonePlate3_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_HitPointStonePlate1_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ��������� ���� I";
	on_state[0] = Use_HitPointStonePlate1;
//	visual = "ItMi_StonePlate_PowerUp_03.3DS";
	visual = "ItMi_StonePlate_PowerUp_06.3DS";
};


func void Use_HitPointStonePlate1()
{
	StoneplateItem = HitPointStonePlate;
	StoneplateLevel = 1;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_HitPointStonePlate1_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_HitPointStonePlate2_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ��������� ���� II";
	on_state[0] = Use_HitPointStonePlate2;
//	visual = "ItMi_StonePlate_PowerUp_03.3DS";
	visual = "ItMi_StonePlate_PowerUp_06.3DS";
};


func void Use_HitPointStonePlate2()
{
	StoneplateItem = HitPointStonePlate;
	StoneplateLevel = 2;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_HitPointStonePlate2_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_HitPointStonePlate3_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ��������� ���� III";
	on_state[0] = Use_HitPointStonePlate3;
//	visual = "ItMi_StonePlate_PowerUp_03.3DS";
	visual = "ItMi_StonePlate_PowerUp_06.3DS";
};


func void Use_HitPointStonePlate3()
{
	StoneplateItem = HitPointStonePlate;
	StoneplateLevel = 3;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_HitPointStonePlate3_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_ManaStonePlate1_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ����� I";
	on_state[0] = Use_ManaStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_ManaStonePlate1()
{
	StoneplateItem = ManaStonePlate;
	StoneplateLevel = 1;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_ManaStonePlate1_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_ManaStonePlate2_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ����� II";
	on_state[0] = Use_ManaStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_ManaStonePlate2()
{
	StoneplateItem = ManaStonePlate;
	StoneplateLevel = 2;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_ManaStonePlate2_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_ManaStonePlate3_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ����� III";
	on_state[0] = Use_ManaStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_ManaStonePlate3()
{
	StoneplateItem = ManaStonePlate;
	StoneplateLevel = 3;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_ManaStonePlate3_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_OneHStonePlate1_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ����������� ������ I";
	on_state[0] = Use_OneHStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_OneHStonePlate1()
{
	StoneplateItem = OneHStonePlate;
	StoneplateLevel = 1;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_OneHStonePlate1_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_OneHStonePlate2_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ����������� ������ II";
	on_state[0] = Use_OneHStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_OneHStonePlate2()
{
	StoneplateItem = OneHStonePlate;
	StoneplateLevel = 2;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_OneHStonePlate2_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_OneHStonePlate3_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ����������� ������ III";
	on_state[0] = Use_OneHStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_OneHStonePlate3()
{
	StoneplateItem = OneHStonePlate;
	StoneplateLevel = 3;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_OneHStonePlate3_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_TwoHStonePlate1_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ���������� ������ I";
	on_state[0] = Use_TwoHStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};


func void Use_TwoHStonePlate1()
{
	StoneplateItem = TwoHStonePlate;
	StoneplateLevel = 1;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_TwoHStonePlate1_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_TwoHStonePlate2_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ���������� ������ II";
	on_state[0] = Use_TwoHStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};


func void Use_TwoHStonePlate2()
{
	StoneplateItem = TwoHStonePlate;
	StoneplateLevel = 2;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_TwoHStonePlate2_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_TwoHStonePlate3_Addon(Prototype_StonePlate)
{
	description = "�������� �������� ���������� ������ III";
	on_state[0] = Use_TwoHStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_05.3DS";
};


func void Use_TwoHStonePlate3()
{
	StoneplateItem = TwoHStonePlate;
	StoneplateLevel = 3;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_TwoHStonePlate3_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_BowStonePlate1_Addon(Prototype_StonePlate)
{
	description = "�������� �������� �������� �� ���� I";
	on_state[0] = Use_BowStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_BowStonePlate1()
{
	StoneplateItem = BowStonePlate;
	StoneplateLevel = 1;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_BowStonePlate1_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_BowStonePlate2_Addon(Prototype_StonePlate)
{
	description = "�������� �������� �������� �� ���� II";
	on_state[0] = Use_BowStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_BowStonePlate2()
{
	StoneplateItem = BowStonePlate;
	StoneplateLevel = 2;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_BowStonePlate2_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_BowStonePlate3_Addon(Prototype_StonePlate)
{
	description = "�������� �������� �������� �� ���� III";
	on_state[0] = Use_BowStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_03.3DS";
};


func void Use_BowStonePlate3()
{
	StoneplateItem = BowStonePlate;
	StoneplateLevel = 3;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_BowStonePlate3_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_CrsBowStonePlate1_Addon(Prototype_StonePlate)
{
	description = "�������� �������� �������� �� �������� I";
	on_state[0] = Use_CrsBowStonePlate1;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_CrsBowStonePlate1()
{
	StoneplateItem = CrsBowStonePlate;
	StoneplateLevel = 1;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_CrsBowStonePlate1_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_CrsBowStonePlate2_Addon(Prototype_StonePlate)
{
	description = "�������� �������� �������� �� �������� II";
	on_state[0] = Use_CrsBowStonePlate2;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_CrsBowStonePlate2()
{
	StoneplateItem = CrsBowStonePlate;
	StoneplateLevel = 2;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_CrsBowStonePlate2_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};


instance ItWr_CrsBowStonePlate3_Addon(Prototype_StonePlate)
{
	description = "�������� �������� �������� �� �������� III";
	on_state[0] = Use_CrsBowStonePlate3;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
};


func void Use_CrsBowStonePlate3()
{
	StoneplateItem = CrsBowStonePlate;
	StoneplateLevel = 3;
	if(!C_SCHasStPlSkill())
	{
//		CreateInvItem(hero,ItWr_CrsBowStonePlate3_Addon);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_STONEPLATE.MDS",500);
	};
	Use_StonePlate();
};

func int C_ScHasColoredStonePlate()
{
	if(Npc_HasItems(hero,ItMi_Addon_Stone_01))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItMi_Addon_Stone_02))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItMi_Addon_Stone_03))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItMi_Addon_Stone_04))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItMi_Addon_Stone_05))
	{
		return TRUE;
	};
};

func int C_ScHasMagicStonePlate()
{
	if(Npc_HasItems(hero,ItWr_StrStonePlate1_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_StrStonePlate2_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_StrStonePlate3_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_DexStonePlate1_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_DexStonePlate2_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_DexStonePlate3_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_HitPointStonePlate1_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_HitPointStonePlate2_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_HitPointStonePlate3_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_ManaStonePlate1_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_ManaStonePlate2_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_ManaStonePlate3_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_OneHStonePlate1_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_OneHStonePlate2_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_OneHStonePlate3_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_TwoHStonePlate1_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_TwoHStonePlate2_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_TwoHStonePlate3_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_BowStonePlate1_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_BowStonePlate2_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_BowStonePlate3_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_CrsBowStonePlate1_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_CrsBowStonePlate2_Addon))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItWr_CrsBowStonePlate3_Addon))
	{
		return TRUE;
	};
};

