
instance DIA_Wasili_EXIT(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 999;
	condition = DIA_Wasili_EXIT_Condition;
	information = DIA_Wasili_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wasili_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wasili_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wasili_HALLO(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 1;
	condition = DIA_Wasili_HALLO_Condition;
	information = DIA_Wasili_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wasili_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && ((VisibleGuild(other) == GIL_NONE) || (VisibleGuild(other) == GIL_NOV)))
	{
		return TRUE;
	};
};

func void DIA_Wasili_HALLO_Info()
{
	AI_Output(self,other,"DIA_Wasili_HALLO_01_00");	//���� �� ����� ������������ ����� ���� � ����-������. �� ����������� ����������� ���-������ ����� ������, �������?
};


instance DIA_Wasili_Job(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 1;
	condition = DIA_Wasili_Job_Condition;
	information = DIA_Wasili_Job_Info;
	permanent = FALSE;
	description = "��� �� �����������?";
};


func int DIA_Wasili_Job_Condition()
{
	return TRUE;
};

func void DIA_Wasili_Job_Info()
{
	AI_Output(other,self,"DIA_Wasili_Job_15_00");	//��� �� �����������?
	AI_Output(self,other,"DIA_Wasili_Job_01_01");	//���� �����, ����� � �������� ��� ��������, ������������ �� ��� ������.
	AI_Output(self,other,"DIA_Wasili_Job_01_02");	//�� ������, ��� ���-������ ��������. �� ��� ����� � �� ���� ������.
	AI_Output(self,other,"DIA_Wasili_Job_01_03");	//����������� �� ������� �� ��������� - ������ ����������� �� �������.
	AI_Output(self,other,"DIA_Wasili_Job_01_04");	//��� ������ ������� ���, ��� �� ������� ��������. ������ �� ������� ��������.
};


instance DIA_Wasili_Sammler(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 4;
	condition = DIA_Wasili_Sammler_Condition;
	information = DIA_Wasili_Sammler_Info;
	permanent = FALSE;
	description = "��� � �������, ����� ����� ����� ������.";
};


func int DIA_Wasili_Sammler_Condition()
{
	return TRUE;
};

func void DIA_Wasili_Sammler_Info()
{
	AI_Output(other,self,"DIA_Wasili_Sammler_15_00");	//��� � �������, ����� ����� ����� ������.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_01");	//��� �����, � ������� ��� ����� ����� ������. ���� ��������������� ������ ��������.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_02");	//������� �������, ����� ����, ���� �� ����� ��������� ���� ����� ���������. ��� ������ �������� ������ ����.
	AI_Output(other,self,"DIA_Wasili_Sammler_15_03");	//� ���, ��������?
	AI_Output(self,other,"DIA_Wasili_Sammler_01_04");	//� ������� ������ ������.
	MIS_Wasili_BringOldCoin = LOG_Running;
};


instance DIA_Wasili_FirstOldCoin(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 5;
	condition = DIA_Wasili_FirstOldCoin_Condition;
	information = DIA_Wasili_FirstOldCoin_Info;
	permanent = TRUE;
	description = "� ���� ���� ��������� �������.";
};


var int Wasili_BringOldCoin_NoMore;

func int DIA_Wasili_FirstOldCoin_Condition()
{
	if((MIS_Wasili_BringOldCoin == LOG_Running) && (WasilisOldCoinOffer == 0) && Npc_HasItems(other,ItMi_OldCoin) && (Wasili_BringOldCoin_NoMore == FALSE))
	{
		return TRUE;
	};
};


var int WasilisOldCoinOffer;
var int FirstOldCoin_angebotenXP_OneTime;
var int DIA_Wasili_FirstOldCoin_mehr_OneTime;

func void DIA_Wasili_FirstOldCoin_Info()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_15_00");	//� ���� ���� ��������� �������.
	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_01");	//���. ������ ���.
	};
	B_GiveInvItems(other,self,ItMi_OldCoin,1);
	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_02");	//��, ��. �� ����� ����� �� ������� �� ��������� ����.
	};
	if(DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_03");	//� ������� ���� �� ��� ���� ������� ������. ������ ��� �� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_04");	//�� ������, ��� � ����� ��������� �� ���, ���. ���� ������� ������. � �� ������ ������.
	};
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
	Info_AddChoice(DIA_Wasili_FirstOldCoin,"���, � ����� ������� �� ����.",DIA_Wasili_FirstOldCoin_nein);
	Info_AddChoice(DIA_Wasili_FirstOldCoin,"����� ������������. ��� ������ ����?",DIA_Wasili_FirstOldCoin_mehr);
	Info_AddChoice(DIA_Wasili_FirstOldCoin,"������������.",DIA_Wasili_FirstOldCoin_ok);
	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		B_GivePlayerXP(XP_BringOldCoin);
		FirstOldCoin_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Wasili_FirstOldCoin_ok()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ok_15_00");	//������������.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_01");	//������.
	if(WasilisOldCoinOffer == 2)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_02");	//��� 2 ������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_03");	//���� ������� ��� �������, �� ������, ��� ���� �����.
		WasilisOldCoinOffer = 1;
	};
	CreateInvItems(self,ItMi_Gold,WasilisOldCoinOffer);
	B_GiveInvItems(self,other,ItMi_Gold,WasilisOldCoinOffer);
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_mehr()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_mehr_15_00");	//����� ������������. ��� ������ ����?
	if(DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_01");	//�� ������! � ��� �� ����� �� ���! ����������.
		DIA_Wasili_FirstOldCoin_mehr_OneTime = TRUE;
		B_GiveInvItems(self,other,ItMi_OldCoin,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_02");	//����. ����. ������. 2 ������� ������ �� ������ ��������� �������, ��� �� ��������� ��� - ��� ��� ��������� �����������.
		WasilisOldCoinOffer = 2;
		Info_AddChoice(DIA_Wasili_FirstOldCoin,"� ����� ������, 3 ���� �� �������.",DIA_Wasili_FirstOldCoin_ZumTeufel);
	};
};

func void DIA_Wasili_FirstOldCoin_nein()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_nein_15_00");	//���, � ����� ������� �� ����.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_nein_01_01");	//��� ��� ���� ����������. �� ��� ���������.
	B_GiveInvItems(self,other,ItMi_OldCoin,1);
	WasilisOldCoinOffer = 0;
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_ZumTeufel()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ZumTeufel_15_00");	//� ����� ������, 3 ���� �� �������.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ZumTeufel_01_01");	//������ � �����, �������.
	AI_StopProcessInfos(self);
	Wasili_BringOldCoin_NoMore = TRUE;
	WasilisOldCoinOffer = 0;
};


var int OldCoinCounter;

instance DIA_Wasili_BringOldCoin(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 5;
	condition = DIA_Wasili_BringOldCoin_Condition;
	information = DIA_Wasili_BringOldCoin_Info;
	permanent = TRUE;
	description = "����� ��� ��������� �������?";
};


func int DIA_Wasili_BringOldCoin_Condition()
{
	if((WasilisOldCoinOffer > 0) && Npc_HasItems(other,ItMi_OldCoin) && (Wasili_BringOldCoin_NoMore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wasili_BringOldCoin_Info()
{
	var int OldCoinCount;
	var int OldCoinGold;
	OldCoinCount = Npc_HasItems(other,ItMi_OldCoin);
	AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_00");	//����� ��� ��������� �������?
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_01");	//�������. � ���� ���� ���?
	if(OldCoinCount == 1)
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_02");	//����.
	}
	else
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_03");	//���������.
	};
	B_GiveInvItems(other,self,ItMi_OldCoin,OldCoinCount);
	Npc_RemoveInvItems(self,ItMi_OldCoin,Npc_HasItems(self,ItMi_OldCoin));
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_04");	//�������. ��� ���� ������. ������� ��� ���, ��� �������.
	OldCoinGold = OldCoinCount * WasilisOldCoinOffer;
	CreateInvItems(self,ItMi_Gold,OldCoinGold);
	B_GiveInvItems(self,other,ItMi_Gold,OldCoinGold);
	B_GivePlayerXP(XP_BringOldCoin * OldCoinCount);
	OldCoinCounter += OldCoinCount;
};


instance DIA_Wasili_PERM(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 900;
	condition = DIA_Wasili_PERM_Condition;
	information = DIA_Wasili_PERM_Info;
	permanent = TRUE;
	description = "����� �� ������� ������ �������?";
};


func int DIA_Wasili_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wasili_Job))
	{
		return TRUE;
	};
};

func void DIA_Wasili_PERM_Info()
{
	AI_Output(other,self,"DIA_Wasili_PERM_15_00");	//����� �� ������� ������ �������?
	if(Kapitel <= 2)
	{
		if(PETZCOUNTER_Farm_Theft > 0)
		{
			AI_Output(self,other,"DIA_Wasili_PERM_01_01");	//�� ������ � ����: ����� ����?
		};
		AI_Output(self,other,"DIA_Wasili_PERM_01_02");	//���� �����! �� � �� ���� ������!
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Wasili_PERM_01_03");	//��������� ���� �����, ���� �� ��������� ��������� � ���.
		AI_Output(self,other,"DIA_Wasili_PERM_01_04");	//�� ��� ���� � ������ ���� � ���������, ��� ��� � �� ��������� ���.
		AI_Output(self,other,"DIA_Wasili_PERM_01_05");	//�� � �����, ��� �� ������.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_06");	//���. ��������� ����� ���.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_07");	//��������, ������, ��������� �������� ������.
		AI_Output(self,other,"DIA_Wasili_perm_01_08");	//� �� ��������, ���� �� � ��� ����� ������� ������ ��� ������� �����.
	};
};


instance DIA_Wasili_PICKPOCKET(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 900;
	condition = DIA_Wasili_PICKPOCKET_Condition;
	information = DIA_Wasili_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Wasili_PICKPOCKET_Condition()
{
	return C_Beklauen(55,90);
};

func void DIA_Wasili_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
	Info_AddChoice(DIA_Wasili_PICKPOCKET,Dialog_Back,DIA_Wasili_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wasili_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wasili_PICKPOCKET_DoIt);
};

func void DIA_Wasili_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
};

func void DIA_Wasili_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
};

