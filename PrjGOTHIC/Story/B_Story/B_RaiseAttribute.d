
func void B_RaiseRealAttributeLearnCounter(var C_Npc oth,var int attrib,var int points)
{
	if(attrib == ATR_STRENGTH)
	{
		oth.aivar[REAL_STRENGTH] += points;
	}
	else if(attrib == ATR_DEXTERITY)
	{
		oth.aivar[REAL_DEXTERITY] += points;
	}
	else if(attrib == ATR_MANA_MAX)
	{
		oth.aivar[REAL_MANA_MAX] += points;
	};
};

func void B_RaiseAttribute(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] += points;
		concatText = ConcatStrings(PRINT_LearnSTR,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] += points;
		if((oth.attribute[ATR_DEXTERITY] >= 90) && !Npc_GetTalentSkill(oth,NPC_TALENT_ACROBAT))
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
			PrintScreen(PRINT_Addon_AcrobatBonus,-1,53,FONT_Screen,2);
			Snd_Play("LevelUp");
		};
		concatText = ConcatStrings(PRINT_LearnDEX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] += points;
		oth.attribute[ATR_MANA] += points;
		concatText = ConcatStrings(PRINT_LearnMANA_MAX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] += points;
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
//	�����������: ������������� �����, ��� � �������� ��� ��������
	if(IgnoreBonuses == FALSE)
	{
		B_RaiseRealAttributeLearnCounter(oth,attrib,points);
	};
};

