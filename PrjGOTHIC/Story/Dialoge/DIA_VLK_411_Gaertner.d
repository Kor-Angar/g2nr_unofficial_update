
instance DIA_Gaertner_EXIT(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 999;
	condition = DIA_Gaertner_EXIT_Condition;
	information = DIA_Gaertner_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gaertner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Gaertner_PICKPOCKET(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 900;
	condition = DIA_Gaertner_PICKPOCKET_Condition;
	information = DIA_Gaertner_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Gaertner_PICKPOCKET_Condition()
{
	return C_Beklauen(40,50);
};

func void DIA_Gaertner_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET,Dialog_Back,DIA_Gaertner_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gaertner_PICKPOCKET_DoIt);
};

func void DIA_Gaertner_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};

func void DIA_Gaertner_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};


instance DIA_Gaertner_Job(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Job_Condition;
	information = DIA_Gaertner_Job_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Gaertner_Job_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_Job_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Job_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Gaertner_Job_09_01");	//� �� ��� �������? � �������� � �������� �� ���� �����.
	AI_Output(other,self,"DIA_Gaertner_Job_15_02");	//��, ������, ������ ������� ������?
	AI_Output(self,other,"DIA_Gaertner_Job_09_03");	//��, � �������� ��, ����� ��� ��� � ���������� ��������.
	AI_Output(self,other,"DIA_Gaertner_Job_09_04");	//�����-�� ���� ���� ������ ��������� � ������� �� ��, ��� � ��������� ������ �����.
	AI_Output(self,other,"DIA_Gaertner_Job_09_05");	//�� �������, �����������, ����� ��� ��������, � ���� �������� �����.
	AI_Output(self,other,"DIA_Gaertner_Job_09_06");	//�� �������� ���� ��� ���� ���� �����. � � ������ ������� ����.
};


instance DIA_Gaertner_Plants(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Plants_Condition;
	information = DIA_Gaertner_Plants_Info;
	permanent = FALSE;
	description = "�� ����������� �����-������ �����?";
};


func int DIA_Gaertner_Plants_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Job))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Plants_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Plants_15_00");	//�� ����������� �����-������ �����?
	AI_Output(self,other,"DIA_Gaertner_Plants_09_01");	//��, �������. � ��������� �������� ����� � �������� �������. ����� � ������� ������ �������� �����, �� ��� �� ����������� �����.
	AI_Output(self,other,"DIA_Gaertner_Plants_09_02");	//� ������ ��� ������ ����������. ��� ���, ���� ������ ���-�� ������...
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"�������� ����������� ����� ������� ��� ���-����� ��������.");
};


instance DIA_Gaertner_Trade(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Trade_Condition;
	information = DIA_Gaertner_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Gaertner_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Plants))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Trade_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Trade_15_00");	//������ ��� ���� ������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Gaertner_Krautabak(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_Krautabak_Condition;
	information = DIA_Gaertner_Krautabak_Info;
	permanent = FALSE;
	description = "� ���� ���� �������� �����. ������ ����������?";
};


func int DIA_Gaertner_Krautabak_Condition()
{
	if(Npc_HasItems(other,ItMi_SumpfTabak) && Wld_IsTime(6,45,21,45) && Npc_KnowsInfo(other,DIA_Gaertner_Plants))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Krautabak_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Krautabak_15_00");	//� ���� ���� �������� �����. ������ ����������?
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_01");	//���� �� ����... �, �����, �����. ������ �������.
	B_GiveInvItems(other,self,ItMi_SumpfTabak,1);
	Npc_RemoveInvItem(self,ItMi_SumpfTabak);
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_02");	//���... ���-���....
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_03");	//������� �����. ���-�� ��� ����������� ������ ���.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Gaertner_Sign(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 7;
	condition = DIA_Gaertner_Sign_Condition;
	information = DIA_Gaertner_Sign_Info;
	permanent = FALSE;
	description = DIALOG_SecretSign;
};


func int DIA_Gaertner_Sign_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Job) && (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	CreateInvItems(self,ItKe_Lockpick,3);
	AI_Output(self,other,"DIA_Gaertner_Sign_09_00");	//������ �� ���� �� ���. � � ���� ��������� ���� ���-����� ����������.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_01");	//� ��������� ����� ����� ���� ��������� ������, ������� ����������� �������� �������������.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_02");	//���� ������ ��� ����� ������ ���� ����.
};

instance DIA_Gaertner_FreeLockpicks(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 8;
	condition = DIA_Gaertner_FreeLockpicks_Condition;
	information = DIA_Gaertner_FreeLockpicks_Info;
	permanent = FALSE;
	description = "� ���� ������ ��� �������...";
};


func int DIA_Gaertner_FreeLockpicks_Condition()
{
	if(!Npc_HasItems(other,ItKe_Lockpick) && !Npc_HasItems(self,ItKe_Lockpick) && Npc_KnowsInfo(other,DIA_Gaertner_Sign))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_FreeLockpicks_Info()
{
	B_Say(other,self,"$NoMorePicks");
	B_Say(self,other,"$ABS_GOOD");
	CreateInvItems(self,ItKe_Lockpick,3);
	B_GiveInvItems(self,other,ItKe_Lockpick,3);
};

