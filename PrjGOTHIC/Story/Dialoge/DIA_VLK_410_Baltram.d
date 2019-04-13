
func void B_BaltramRangerCheck()
{
	var C_Item EqArm;
	EqArm = Npc_GetEquippedArmor(other);
	if((SC_KnowsBaltramAsRanger == FALSE) && ((SCIsWearingRangerRing == TRUE) || (Hlp_IsItem(EqArm,ITAR_RANGER_Addon))))
	{
		SC_KnowsBaltramAsRanger = TRUE;
	};
};
	
instance DIA_Baltram_EXIT(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 999;
	condition = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Baltram_EXIT_Info()
{
	B_BaltramRangerCheck();
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////

instance DIA_Baltram_Sperre(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_Sperre_Condition;
	information = DIA_Baltram_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Baltram_Sperre_Condition()
{
	B_BaltramRangerCheck();
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		if((SCIsWearingRangerRing == TRUE) && (MIS_Lares_BringRangerToMe == LOG_Running))
		{
			return FALSE;
		}
		else if(SC_KnowsBaltramAsRanger == TRUE)
		{
			return FALSE;
		}
		else if(Npc_KnowsInfo(hero,DIA_Addon_Baltram_LaresAbloese))
		{
			return FALSE;
		};
		return TRUE;
	};
};

func void DIA_Baltram_Sperre_Info()
{
	AI_Output(self,other,"DIA_Baltram_Sperre_01_00");	//���� ���� �����? �� ����������� �� ��������������� �������. � �� ���� ����� � ����� ������� ���!
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////

instance DIA_Baltram_Hallo(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_Hallo_Condition;
	information = DIA_Baltram_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_Nagur_Bote == FALSE))
	{
		if(Canthar_Sperre == TRUE)
		{
			if((SCIsWearingRangerRing == TRUE) && (MIS_Lares_BringRangerToMe == LOG_Running))
			{
				return TRUE;
			};
			return FALSE;
		};
		return TRUE;
	};
};

func void DIA_Baltram_Hallo_Info()
{
	B_BaltramRangerCheck();
	if(((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) || (SC_KnowsBaltramAsRanger == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//����� ����������, ���������, ���� ����� ��������. �� ������ ��������� ���������������?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//�����, ��� ��� �������� ������������ ����. � ��������� ������ � ���� ��� ���� ����������.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//�� ����� � ��� ����� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//���� �� ������ ������ � ���� �������� �������, �� ������ ��������.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//� �� ������ ������� ������ � ���, ���������! �� ��� ���� ��������.
	};
};


instance DIA_Addon_Baltram_LaresAbloese(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 1;
	condition = DIA_Addon_Baltram_LaresAbloese_Condition;
	information = DIA_Addon_Baltram_LaresAbloese_Info;
	important = TRUE;
};


func int DIA_Addon_Baltram_LaresAbloese_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SCIsWearingRangerRing == TRUE) && (MIS_Lares_BringRangerToMe == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_00");	//������ �� ��� ������������� �� ���� ��������?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_01");	//� ������� � ���� ���� ������ ����.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_02");	//�� ���� ���� ����� ��������?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_03");	//� ���, ���� ���?
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_04");	//� ������ �������� ����, ��� ��������� � ����� ����� �����, ����� ��� �������.
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_05");	//������. � ��������, ����� ��� �������.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_06");	//�������.
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry(TOPIC_Addon_BringRangerToLares,"��������, �������� �� �������� �������, �����������, ����� ������ ������� �� ��� �����. ����� ����� �������� ������ ����� ������.");
	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};


instance DIA_Baltram_Job(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 3;
	condition = DIA_Baltram_Job_Condition;
	information = DIA_Baltram_Job_Info;
	permanent = FALSE;
	description = "� ���� ���� ������ ��� ����?";
};


func int DIA_Baltram_Job_Condition()
{
	if((MIS_Nagur_Bote != LOG_Running) && (MIS_Nagur_Bote != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Job_Info()
{
	B_BaltramRangerCheck();
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//� ���� ���� ������ ��� ����?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//���, � ���� ��� ���� ������� �� ����������. �������� ���������� � ������� ����������.
};


instance DIA_Baltram_Trick(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_Trick_Condition;
	information = DIA_Baltram_Trick_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Trick_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Nagur_Bote == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Trick_Info()
{
	B_BaltramRangerCheck();
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//�� ����� ������?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//�������, � ��� �����?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//��� ������� �� ���������� �� ��������, � � ��� �������� �� ������� �����.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//� �� ������� �� ���������� ��� ������?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//� ��� ���� 50 ������� �����.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//�������, � ��������.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//������, ������ ����� �����, ��� ���� ������ �. �� �������� ���� �����. ������� ��� ���.
	MIS_Baltram_ScoutAkil = LOG_Running;
	B_LogEntry(TOPIC_Nagur,"�������� ����� ���� � �������� �������� �� ����������. ������ � ������ ��������� ��� ������� � ����� �����.");
	Log_CreateTopic(TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Baltram,LOG_Running);
	B_LogEntry(TOPIC_Baltram,"���� � ������� ��������� ��� �������, �� �������� ��� 50 ������� �����.");
};


var int Baltram_TradeLOG;

instance DIA_Baltram_WAREZ(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_WAREZ_Condition;
	information = DIA_Baltram_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Baltram_WAREZ_Condition()
{
	if((SC_KnowsBaltramAsRanger == TRUE) || ((MIS_BaltramTrade != LOG_Running) && (MIS_BaltramTrade != LOG_FAILED)))
	{
		return TRUE;
	};
};

func void DIA_Baltram_WAREZ_Info()
{
	B_BaltramRangerCheck();
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//������ ��� ���� ������.
	B_GiveTradeInv(self);
	if(Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"�������� ������� ���������� �� �������� �������.");
		Baltram_TradeLOG = TRUE;
	};
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//�� �� ������ ���������, ����� ��� ����� ��� ������. ������ ��� ���� �� ��������� ���� ��������.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//���-�� �������� ����������� ������ ���� ���������!
	};
	Trade_IsActive = TRUE;
	if((MIS_BaltramTrade != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (SC_KnowsBaltramAsRanger == FALSE))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//�����, ��� ��, ������ �� ���� �� �������.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//������?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//������� �� �������� �������� � ���� ���������, � ����� ������ ���� ���, ��� ����� ������ �� ���������.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//������ ����������, �� ���������� ���� ���� ��������.
		MIS_BaltramTrade = LOG_FAILED;
		Trade_IsActive = FALSE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Baltram_Skip(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Addon_Baltram_Skip_Condition;
	information = DIA_Addon_Baltram_Skip_Info;
	description = "������, �� �������� � ��������?";
};


func int DIA_Addon_Baltram_Skip_Condition()
{
	if(SCKnowsBaltramAsPirateTrader == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_Skip_Info()
{
	B_BaltramRangerCheck();
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_00");	//(���������) ������, �� �������� � ��������?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_01");	//(���������) ���? ��� ���� ��� ������?
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_02");	//� ������� � ����� �� ���. ������, �� ���� ���� � ����� �����.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_03");	//��� �� ��� ���� ������? ������� ������ �������. ������ �������������, ��� �����.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"�� �� ������, ��� ���� ����� ��������?",DIA_Addon_Baltram_Skip_erwischen);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"�� �������� �� ��� ���������!",DIA_Addon_Baltram_Skip_MIL);
};

func void DIA_Addon_Baltram_Skip_Back()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Back_15_00");	//��� ���, ��� � ����� ������.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_MIL_15_00");	//�� �������� �� ��� ���������!
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_MIL_01_01");	//��������! ����� � �������� ���� ���, ��� � ����, � �� �� ������� ���� ��������, ������?
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"� ��� �� �� ��������?",DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"��� �� ������ � �������?",DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_erwischen()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_erwischen_15_00");	//�� �� ������, ��� ���� ����� ��������?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_01");	//� �������, ��� ����� ��������. �� �� ���� �������, �����?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_02");	//�������, ��� �� ������ ������� ��� �� �����.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"� ��� �� �� ��������?",DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"��� �� ������ � �������?",DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_was()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_was_15_00");	//� ��� �� �� ��������?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_01");	//� ��������, � �������� �� ���.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_02");	//� �� ��� ������� �� ��� ������ ��� �� ��������.
	Info_AddChoice(DIA_Addon_Baltram_Skip,"��� ���, ��� � ����� ������.",DIA_Addon_Baltram_Skip_Back);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"� �� ��� ��������� ������ ������ ����.",DIA_Addon_Baltram_Skip_Ich);
};

func void DIA_Addon_Baltram_Skip_Ich()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Ich_15_00");	//(����������) � �� ��� ��������� ������ ������ ����.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_01");	//��� ���� �� ������������. � ������ �� ���� ������� �� ������.
	CreateInvItems(self,ItMi_Packet_Baltram4Skip_Addon,1);
	B_GiveInvItems(self,other,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_02");	//���, ������ ���� ����� � ������� �����, ��� �� ���� ��� ��� ����� ������ ����.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_03");	//��� ������� ��� �������.
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,"�������� ��� ��� �����. � ������ ������� ��� �����.");
	MIS_Addon_Baltram_Paket4Skip = LOG_Running;
};

func void DIA_Addon_Baltram_Skip_pirat()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_pirat_15_00");	//��� �� ������ � �������?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_01");	//��� ����� � ��������� ����� �������.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_02");	//��������� � ����, ������� ���� ����� ������ �� �������.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_03");	//������ �������� �� ������. ��� � �������, ���� ������ - ��������� ����������.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_04");	//������ � ������, ��� ������� ��� ����.
};


instance DIA_Addon_Baltram_SkipsRum(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Addon_Baltram_SkipsRum_Condition;
	information = DIA_Addon_Baltram_SkipsRum_Info;
	description = "� ������ ���. �� ���� ��� ��� ����� ��� �������.";
};


func int DIA_Addon_Baltram_SkipsRum_Condition()
{
	if((Skip_Rum4Baltram == TRUE) && (MIS_Addon_Baltram_Paket4Skip == LOG_Running) && (Npc_HasItems(other,ItFo_Addon_Rum) >= 2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_SkipsRum_Info()
{
	B_BaltramRangerCheck();
	AI_Output(other,self,"DIA_Addon_Baltram_SkipsRum_15_00");	//� ������ ���. �� ���� ��� ��� ����� ��� �������.
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_01");	//(�������) ���������� ����������... ��� �� � ���� ��������? �����, ����� �� ����.
	B_GiveInvItems(other,self,ItFo_Addon_Rum,2);
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_02");	//��� �, ����� ��������� � ���� �� ����. �����, ����� ������.
	CreateInvItems(self,ItMi_Gold,10);
	B_GiveInvItems(self,other,ItMi_Gold,10);
	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Baltram_AkilsHof(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_AkilsHof_Condition;
	information = DIA_Baltram_AkilsHof_Info;
	permanent = FALSE;
	description = "��� ��� ����� ����� �����?";
};


func int DIA_Baltram_AkilsHof_Condition()
{
	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info()
{
	B_BaltramRangerCheck();
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//��� ��� ����� ����� �����?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//��� ������ ������� �� ��������� �����, ������� ������, ������� �� ���-������.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//������ �� ������� �������� ��������. ����� �� ����������� �� ���, �� ��� ������� ������ ����� �����.
};


instance DIA_Baltram_Lieferung(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Baltram_Lieferung_Condition;
	information = DIA_Baltram_Lieferung_Info;
	permanent = FALSE;
	description = "� ������ ����� �� �����.";
};


func int DIA_Baltram_Lieferung_Condition()
{
	if(Npc_HasItems(other,ItMi_BaltramPaket))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Lieferung_Info()
{
	B_BaltramRangerCheck();
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//� ������ ����� �� �����.
	B_GiveInvItems(other,self,ItMi_BaltramPaket,1);
	Npc_RemoveInvItem(self,ItMi_BaltramPaket);
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//�����������. ������ � ����� ����� ��������� ������� ����������. ��� ���� 50 ������� �����.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP(XP_Baltram_ScoutAkil);
	CreateInvItems(self,ItFo_Cheese,5);
	CreateInvItems(self,ItFo_Apple,10);
	CreateInvItems(self,ItFo_Beer,5);
	CreateInvItems(self,ItFo_Bacon,5);
	CreateInvItems(self,ItFo_Sausage,5);
};


instance DIA_Baltram_LetUsTrade(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_LetUsTrade_Condition;
	information = DIA_Baltram_LetUsTrade_Info;
	permanent = FALSE;
	description = "�����, ��� ����� ���������� ������?";
};


func int DIA_Baltram_LetUsTrade_Condition()
{
	if(MIS_BaltramTrade == LOG_FAILED)
	{
		if(SC_KnowsBaltramAsRanger == FALSE)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func void DIA_Baltram_LetUsTrade_Info()
{
	B_BaltramRangerCheck();
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//�����, ��� ����� ���������� ������?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//��������, ���� �� ��������� ��� 10 �������� � 10 ������� ����, ����� � ����� ����� ����� � ����� ����.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//� ��������.
	MIS_BaltramTrade = LOG_Running;
};


var int BaltramEnoughBacon;
var int BaltramEnoughWine;

instance DIA_Baltram_HaveYourWarez(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_HaveYourWarez_Condition;
	information = DIA_Baltram_HaveYourWarez_Info;
	permanent = TRUE;
	description = "� ������ ��, ��� �� ������.";
};


func int DIA_Baltram_HaveYourWarez_Condition()
{
	if((MIS_BaltramTrade == LOG_Running) && (MIS_BaltramTrade != LOG_SUCCESS))
	{
		if(SC_KnowsBaltramAsRanger == FALSE)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func void DIA_Baltram_HaveYourWarez_Info()
{
	var string concatText;
	B_BaltramRangerCheck();
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//� ������ ��, ��� �� ������.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//������.
	if(Npc_HasItems(other,ItFo_Bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//�� ������������ �� 10 ��������. �����������, ����� �������� ��.
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};
	if(Npc_HasItems(other,ItFo_Wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//� ��� ������ 10 ������� ����? �� ���, ����� ��� ���?
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	if((BaltramEnoughBacon == TRUE) && (BaltramEnoughWine == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//����, ����� �� ������ ������� ��������, �� � ���� ����� �� ���������� ��������������.
		Npc_RemoveInvItems(other,ItFo_Bacon,10);
		CreateInvItems(self,ItFo_Bacon,10);
		Npc_RemoveInvItems(other,ItFo_Wine,10);
		CreateInvItems(self,ItFo_Wine,10);
		concatText = ConcatStrings(IntToString(20),PRINT_ItemsGegeben);
		AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		MIS_BaltramTrade = LOG_SUCCESS;
		B_GivePlayerXP(XP_BaltramTrade);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//������ ����� �� ������ ��� ����� ����.
	};
};


instance DIA_Baltram_PICKPOCKET(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 900;
	condition = DIA_Baltram_PICKPOCKET_Condition;
	information = DIA_Baltram_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Baltram_PICKPOCKET_Condition()
{
	return C_Beklauen(76,175);
};

func void DIA_Baltram_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,Dialog_Back,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

