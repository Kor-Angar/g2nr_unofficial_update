
instance DIA_Addon_Lucia_EXIT(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 999;
	condition = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_EXIT_Info()
{
	B_EquipTrader(self);
	EnteredBanditsCamp = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lucia_PICKPOCKET(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 900;
	condition = DIA_Addon_Lucia_PICKPOCKET_Condition;
	information = DIA_Addon_Lucia_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80_Female;
};


func int DIA_Addon_Lucia_PICKPOCKET_Condition()
{
	return C_Beklauen(80,100);
};

func void DIA_Addon_Lucia_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lucia_PICKPOCKET,Dialog_Back,DIA_Addon_Lucia_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lucia_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Lucia_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lucia_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
};

func void DIA_Addon_Lucia_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
};


instance DIA_Addon_Lucia_Hi(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Addon_Lucia_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Addon_Lucia_Hi_16_01");	//��������. ���� ���� ����� ���, ������ � �����. � ���� �� ������ ������, �� �� ��������� � ������� ��������.
};


instance DIA_Addon_Lucia_was(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent = FALSE;
	description = "� ��� �� �� ����� �����?";
};


func int DIA_Addon_Lucia_was_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_was_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_was_15_00");	//� ��� �� �� ����� �����?
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_01");	//��, ���� � ��� �������. ���� �� ������ �������� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_02");	//� �������, ��� ������������ ������� ����, ������� ��� ��������...
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_03");	//��� ��� ������ �� ���� ������� �������. � ���� ���� �������, ���� � ����� ���.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_04");	//��-�... ���� ����� ����������� ��� ���. � ����� ������ � �������. ���� ��������, �� ������������� ����� ���� ����.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"� ����� � ���� ������ �������.");
};


instance DIA_Addon_Lucia_Khorinis(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent = FALSE;
	description = "�� �� ��������, �����?";
};


func int DIA_Addon_Lucia_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bromor_Lucia) || (Nadja_GaveLuciaInfo == TRUE) || Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_00");	//�� �� ��������, �����?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_01");	//��, �� ���������. ����� � ���� ��� ���� ����������.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_02");	//���� � ����� ��������� ������� � ������������, ��� ��� ����� ���� ���-�� �������.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_03");	//�� �����... (�������) ���, �������. ����� ����, ��� ��-�� ����, ��� �� �� �������... �����, � ����� ������, � ��� ������ ���������.
	if((MIS_LuciasLetter != FALSE) || (SC_KnowsLuciaCaughtByBandits != FALSE) || (Nadja_GaveLuciaInfo != FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_06");	//� �������� � �������!
		AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//������?
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_05");	//�� ����! ����� ������� ������� ����, �� ���� �� ��������� ��� ������.
//		TOPIC_END_Lucia = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
	TOPIC_END_Lucia = TRUE;
};


instance DIA_Addon_Lucia_Jetzt(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Jetzt_Condition;
	information = DIA_Addon_Lucia_Jetzt_Info;
	permanent = FALSE;
	description = "��� �� ����������� ������?";
};


func int DIA_Addon_Lucia_Jetzt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Khorinis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Jetzt_15_00");	//��� �� ����������� ������?
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_01");	//���������. ���� � ������� �����, �� ������, ������ � ����������.
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_02");	//�� ��� ����� ������? � �����, ��� ��� �������!
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_03");	//(�������) ������... ����� �������� � ������ �������... ���� � ���� ���� ���. ������ ����� �� �������.
};


instance DIA_Addon_Lucia_Paladine(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent = FALSE;
	description = "�� �� �����-�� ������ ���������, �����?";
};


func int DIA_Addon_Lucia_Paladine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_15_00");	//�� �� �����-�� ������ ���������, �����?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_01");	//���� ���������-�����, ������� ������ ���� ����? ���, �� �����.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_02");	//���� ����� � ��� ������� ������ �����, � ��� ������� ����� ���� �� �����.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_03");	//� ��� ��� �� �� ����. � �� ���������� �����, ���� ��� ������� ������� ����� � ������� ���� �� �������.
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_DJG))
	{
		Info_ClearChoices(DIA_Addon_Lucia_Paladine);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"(����������)",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"�� �������� ��������� �� ��� ������, ������� �������� ����� ������.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"�������� - ��� ����� ������. ��� �� ������.",DIA_Addon_Lucia_Paladine_MURDER);
	};
};

func void DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WAHL_15_00");	//�� �������� ��������� �� ��� ������, ������� �������� ����� ������.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_01");	//� ����, ��� ���� ���� �������� ���� ����.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_02");	//� ���� ����� �������� ����. �� ��������, ��� ���� �� ���.
	Info_AddChoice(DIA_Addon_Lucia_Paladine,"�� �����-������ ����-������ �������?",DIA_Addon_Lucia_Paladine_KILL);
};

func void DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_KILL_15_00");	//�� �����-������ ����-������ �������?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_01");	//���, � ����� ����� ����.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_02");	//����� ��������� �������� � ����� ��������� �����.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_03");	//����� ������ � ����� ������������ ������ �������� �����, ������ ��� ������.
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WEIB_15_00");	//�� ���������� ������, ������ ������?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_01");	//���, ��� ��! ������ ��������� ���� �������������� ��� ������.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_02");	//�� � �� �� ������� �� ����������� � ������������ ����������� ������.
};

func void DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_MURDER_15_00");	//�������� - ��� ����� ������. ��� �� ������.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01");	//� ��� � ����? �� �� ����� ����� - ��� ��, ��� �� ����� �������� � �������.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_02");	//������������ ������� � ���, ��� ��� ������� ������ ������, ������ ��� ����� ������.
	Info_AddChoice(DIA_Addon_Lucia_Paladine,"�� ���������� ������, ������ ������?",DIA_Addon_Lucia_Paladine_WEIB);
};


instance DIA_Addon_Lucia_Attentat(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 9;
	condition = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Lucia_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Lucia_Attentat_16_00");	//������.
};


instance DIA_Addon_Lucia_Trade(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 99;
	condition = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "��� ��� ���-������ ������.";
};


func int DIA_Addon_Lucia_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Trade_Info()
{
	if(Lucia_flag == TRUE)
	{
		B_ClearAlchemyInv(self);
		if(Lucia_flasks > 0)
		{
			CreateInvItems(self,ItMi_Flask,Lucia_flasks);
		};
		Lucia_flag = FALSE;
	};
	AI_Output(other,self,"DIA_Addon_Lucia_Trade_15_00");	//��� ��� ���-������ ������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Addon_Lucia_lernen(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 19;
	condition = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent = FALSE;
	description = "�� ������ ���� ����-������ �������?";
};


func int DIA_Addon_Lucia_lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_lernen_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_lernen_15_00");	//�� ������ ���� ����-������ �������?
	AI_Output(self,other,"DIA_Addon_Lucia_lernen_16_01");	//(�������) � ��������. � ���� ������ ���� ��������� ��������.
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"����� ����� ������ ��� ����� ����� ������.");
};


instance DIA_Addon_Lucia_TEACH(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 101;
	condition = DIA_Addon_Lucia_TEACH_Condition;
	information = DIA_Addon_Lucia_TEACH_Info;
	permanent = TRUE;
	description = "� ���� ����� ����� ������.";
};


func int DIA_Addon_Lucia_TEACH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_lernen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_TEACH_15_00");	//� ���� ����� ����� ������.
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
};

func void DIA_Addon_Lucia_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

func void DIA_Addon_Lucia_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

