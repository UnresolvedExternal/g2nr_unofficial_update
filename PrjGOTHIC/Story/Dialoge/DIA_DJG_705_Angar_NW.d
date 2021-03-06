
instance DIA_Angar_NW_KAP5_EXIT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 999;
	condition = DIA_Angar_NW_KAP5_EXIT_Condition;
	information = DIA_Angar_NW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Angar_NW_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Angar_NW_AllDragonsDead(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 59;
	condition = DIA_Angar_NW_AllDragonsDead_Condition;
	information = DIA_Angar_NW_AllDragonsDead_Info;
	description = "��� ����?";
};


func int DIA_Angar_NW_AllDragonsDead_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_AllDragonsDead_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_01");	//������, �� ���� ��� ����� ������ �������� ����, ���� ��� ����������� � ��� ���, ��� � ������� ������ ��������.
	if(Angar_IsOnBoard != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_02");	//� �������� �����. �� ������ �����, ��� ����� ����, ���� � ���� �����������.
	};
};


instance DIA_Angar_NW_KnowWhereEnemy(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_KnowWhereEnemy_Condition;
	information = DIA_Angar_NW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "� ��������� �������� �������. �� ������ �������������� �� ���?";
};


func int DIA_Angar_NW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Angar_IsOnBoard == FALSE) && Npc_KnowsInfo(other,DIA_Angar_NW_AllDragonsDead))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_00");	//� ��������� �������� �������. �� ������ �������������� �� ���?
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_01");	//��� ������ � ���� �� ������ ��������, ��� �����. ����� �� ����������?
	if(SCToldAngarHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"����� ����� ��� ������ ����, ��� ��������� ��� � ������ ��������. �� ��������� �������������� �� ��� � �������������� ������.");
		SCToldAngarHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_02");	//� ���� ������ ���������� �����, ����� ��������� ��������. ��������, � �������� � ���� �����.
		AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_03");	//������. �� ������, ��� ����� ����.
	}
	else
	{
		Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy,"� ��� ���� �����, ����� ������ �����.",DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy,"��� � ������. ���������� ���.",DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00");	//��� � ������. ���������� ���.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01");	//��� ���.
	B_JoinShip(self);
};

func void DIA_Angar_NW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_No_15_00");	//� ��� ���� �����, ����� ������ �����.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01");	//������.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};


instance DIA_Angar_NW_LeaveMyShip(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_LeaveMyShip_Condition;
	information = DIA_Angar_NW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "��������� ����� � ������ �� ����� �������� ����.";
};


func int DIA_Angar_NW_LeaveMyShip_Condition()
{
	if((Angar_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_LeaveMyShip_15_00");	//��������� ����� � ������ �� ����� �������� ����.
	AI_Output(self,other,"DIA_Angar_NW_LeaveMyShip_04_01");	//������. � ����� �����. �����, ��� ���� ����� �����.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Angar_NW_StillNeedYou(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_StillNeedYou_Condition;
	information = DIA_Angar_NW_StillNeedYou_Info;
	permanent = TRUE;
	description = "����������� �� ����.";
};


func int DIA_Angar_NW_StillNeedYou_Condition()
{
	if(((Angar_IsOnBoard == LOG_OBSOLETE) || (Angar_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		if(Angar_WasOnBoard == TRUE)
		{
			DIA_Angar_NW_StillNeedYou.description = "����������� �� ����.";
		}
		else
		{
			DIA_Angar_NW_StillNeedYou.description = "�� ����� ���.";
		};
		return TRUE;
	};
};

func void DIA_Angar_NW_StillNeedYou_Info()
{
	if(Angar_WasOnBoard == TRUE)
	{
		AI_Output(other,self,"DIA_Angar_NW_StillNeedYou_15_00");	//����������� �� ����.
		AI_Output(self,other,"DIA_Angar_NW_StillNeedYou_04_01");	//�� ���� ����, ��� �. ������� �������������� ���� ������ �� �� ��������. �������� �����.
	}
	else
	{
		DIA_Common_INeedYou();
		AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01");	//��� ���.
	};
	B_JoinShip(self);
};


instance DIA_Angar_NW_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 900;
	condition = DIA_Angar_NW_PICKPOCKET_Condition;
	information = DIA_Angar_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Angar_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(47,34);
};

func void DIA_Angar_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,Dialog_Back,DIA_Angar_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_NW_PICKPOCKET_DoIt);
};

func void DIA_Angar_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};

func void DIA_Angar_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};


instance DIA_Angar_NW_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 7;
	condition = DIA_Angar_NW_FOUNDAMULETT_Condition;
	information = DIA_Angar_NW_FOUNDAMULETT_Info;
	description = "� ����� ���� ������.";
};


func int DIA_Angar_NW_FOUNDAMULETT_Condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
};


instance DIA_Angar_SCTellsAngarAboutMadPsi2_NW(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 8;
	condition = DIA_Angar_SCTellsAngarAboutMadPsi2_NW_Condition;
	information = DIA_Angar_SCTellsAngarAboutMadPsi2_NW_Info;
	description = "�������� ������� ���� ���������� ����.";
};


func int DIA_Angar_SCTellsAngarAboutMadPsi2_NW_Condition()
{
	if((SC_KnowsMadPsi == TRUE) && (Angar_KnowsMadPsi == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_NW_Info()
{
	B_SCTellsAngarAboutMadPsi();
	B_SCTellsAngarAboutMadPsi2();
};

