
instance DIA_Balthasar_EXIT(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 999;
	condition = DIA_Balthasar_EXIT_Condition;
	information = DIA_Balthasar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Balthasar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Balthasar_HALLO(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 3;
	condition = DIA_Balthasar_HALLO_Condition;
	information = DIA_Balthasar_HALLO_Info;
	description = "��� ����?";
};


func int DIA_Balthasar_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_01");	//��, ����� ���� �� �����. ������� ���� ������ ������, �������, ������� ��� �������?
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//� �� ������.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_03");	//��. �������. �� � ���� ��� �� ��� �����, ��� ������, ���������? � � ��� ����� ��� ��� ���� ������.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_04");	//�� ���� ����� �� ������, ��� ���� ������� ������������ ������, ������?
};


instance DIA_Balthasar_WASMACHSTDU(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 4;
	condition = DIA_Balthasar_WASMACHSTDU_Condition;
	information = DIA_Balthasar_WASMACHSTDU_Info;
	description = "� ��� �� ��� �����������?";
};


func int DIA_Balthasar_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Balthasar_WASMACHSTDU_15_00");	//� ��� �� ��� �����������?
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_01");	//��, � ������� ����. � ��� ���� ����� ���� ���������.
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_02");	//��� �������� ����� �������� � ����� ����. ���� �� ������ � ���� �����������, ��� ������ �� ����� ���� ������.
};


instance DIA_Addon_Balthasar_Rangerbandits(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 5;
	condition = DIA_Addon_Balthasar_Rangerbandits_Condition;
	information = DIA_Addon_Balthasar_Rangerbandits_Info;
	description = "�� �� ����� ���������� ����� ��������?";
};


func int DIA_Addon_Balthasar_Rangerbandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_HALLO) && ((MIS_Vatras_FindTheBanditTrader == LOG_Running) || (SC_KnowsLuciaCaughtByBandits == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Balthasar_Rangerbandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Balthasar_Rangerbandits_15_00");	//�� �� ����� ���������� ����� ��������?
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_01");	//�����. ��� ������ ����� ���� � ����� ������ � ����������� � ��� �� �����.
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_02");	//� ����� � ��� ���� �������� ���������� ������. ��������� ��� ���, ��� ����� ���������� �������� ����� � ������.
	};
	if(SC_KnowsLuciaCaughtByBandits == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_03");	//� ���� ����� ���� �� ����������, ��� ����� ����� � ��� ������� �������.
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_04");	//�������, ��� �� ��������� �� ���.
	};
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_05");	//����� �����, ��� �� ����� �� ���� �����.
};


instance DIA_Balthasar_AERGERMITNACHBARN(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 5;
	condition = DIA_Balthasar_AERGERMITNACHBARN_Condition;
	information = DIA_Balthasar_AERGERMITNACHBARN_Info;
	description = "� ��� �� �������� � ��������?";
};


func int DIA_Balthasar_AERGERMITNACHBARN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_WASMACHSTDU) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (!Npc_IsDead(BalthasarSheep1) || !Npc_IsDead(BalthasarSheep2) || !Npc_IsDead(BalthasarSheep3)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_AERGERMITNACHBARN_Info()
{
	AI_Output(other,self,"DIA_Balthasar_AERGERMITNACHBARN_15_00");	//� ��� �� �������� � ��������?
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_01");	//����� � ���� ����� �������� ���� ������ � ��������. ������� � ����� ���� ���� �� ������� ��������� ������ ����.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_02");	//���� �� ���������, �� ������, ������, ��������� ������������� ����������, ������ ��� ���� ��� �������, ����� ����� ���� ���� ���.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_03");	//�� �������, ��� ����� ������ �������, ���� ����� ����� ���� �� ��� ���������.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_04");	//�� ����� ������ ��������, ��� �������� ���� ���� �� ���, ������� � ������ �� ���� �� �����.
};


instance DIA_Balthasar_WOBENGAR(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 10;
	condition = DIA_Balthasar_WOBENGAR_Condition;
	information = DIA_Balthasar_WOBENGAR_Info;
	description = "��� � ���� ������� �� ��� ������������ �������� � ����� �������?";
};


func int DIA_Balthasar_WOBENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WOBENGAR_Info()
{
	AI_Output(other,self,"DIA_Balthasar_WOBENGAR_15_00");	//��� � ���� ������� �� ��� ������������ �������� � ����� �������?
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_01");	//��� �� ���� ������ �� �����������.
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_02");	//���� ��� �� ��������� �������, �� ������� ������� �����. �� ���, ������, � ��������� ������������ �������� � ������.
};


instance DIA_Balthasar_TALKTOBENGAR(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 6;
	condition = DIA_Balthasar_TALKTOBENGAR_Condition;
	information = DIA_Balthasar_TALKTOBENGAR_Info;
	description = "��������, ��� ����� ���������� � ��������.";
};


func int DIA_Balthasar_TALKTOBENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (!Npc_IsDead(BalthasarSheep1) || !Npc_IsDead(BalthasarSheep2) || !Npc_IsDead(BalthasarSheep3)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_TALKTOBENGAR_Info()
{
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_00");	//��������, ��� ����� ���������� � ��������.
	AI_Output(self,other,"DIA_Balthasar_TALKTOBENGAR_05_01");	//�� �������� ��� ��� ����? �� ��� �� �� �� ������� ���, ���� � ����, � �� ���� ������� �������, ������?
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//���������.
	Log_CreateTopic(TOPIC_BalthasarsSchafe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe,LOG_Running);
	B_LogEntry(TOPIC_BalthasarsSchafe,"������ ������ �������� ������� ���������� ����� ���� �� ��� ������������ ���������.");
	MIS_Balthasar_BengarsWeide = LOG_Running;
};


instance DIA_Balthasar_BENGARUEBERREDET(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 8;
	condition = DIA_Balthasar_BENGARUEBERREDET_Condition;
	information = DIA_Balthasar_BENGARUEBERREDET_Info;
	description = "�� ������ ����� ������ ����� ���� �� �������� �������.";
};


func int DIA_Balthasar_BENGARUEBERREDET_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Balthasar_TALKTOBENGAR) && (MIS_Balthasar_BengarsWeide == LOG_SUCCESS) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (!Npc_IsDead(BalthasarSheep1) || !Npc_IsDead(BalthasarSheep2) || !Npc_IsDead(BalthasarSheep3)))
	if(Npc_KnowsInfo(other,DIA_Balthasar_TALKTOBENGAR) && (MIS_Balthasar_BengarsWeide == LOG_SUCCESS) && (!Npc_IsDead(BalthasarSheep1) || !Npc_IsDead(BalthasarSheep2) || !Npc_IsDead(BalthasarSheep3)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_BENGARUEBERREDET_Info()
{
	AI_Output(other,self,"DIA_Balthasar_BENGARUEBERREDET_15_00");	//�� ������ ����� ������ ����� ���� �� �������� �������. � ��������� � ���.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_01");	//�������. � ����������� ���� ����� ������.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_02");	//���, ������ ��� ������ ����� � ���� ���� �������������.
	B_GiveInvItems(self,other,ItAt_SheepFur,10);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BengarsWeide");
	B_GivePlayerXP(XP_Balthasar_BengarsWeide);
//	Wld_InsertNpc(Sheep,"NW_BIGMILL_FARM3_BALTHASAR");
//	Wld_InsertNpc(Sheep,"NW_BIGMILL_FARM3_BALTHASAR");
//	Wld_InsertNpc(Hammel,"NW_BIGMILL_FARM3_BALTHASAR");
	BalthasarSheep1 = Hlp_GetNpc(Balthasar_Sheep1);
	if(Hlp_IsValidNpc(BalthasarSheep1) && !Npc_IsDead(BalthasarSheep1))
	{
		//AI_StartState(BalthasarSheep1,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
		BalthasarSheep1.wp = "NW_BIGMILL_FARM3_BALTHASAR";
		BalthasarSheep1.start_aistate = ZS_MM_AllScheduler;
		B_StartOtherRoutine(BalthasarSheep1,"NewFarm");
	};
	BalthasarSheep2 = Hlp_GetNpc(Balthasar_Sheep2);
	if(Hlp_IsValidNpc(BalthasarSheep2) && !Npc_IsDead(BalthasarSheep2))
	{
		//AI_StartState(BalthasarSheep2,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
		BalthasarSheep2.wp = "NW_BIGMILL_FARM3_BALTHASAR";
		BalthasarSheep2.start_aistate = ZS_MM_AllScheduler;
		B_StartOtherRoutine(BalthasarSheep2,"NewFarm");
	};
	BalthasarSheep3 = Hlp_GetNpc(Balthasar_Sheep3);
	if(Hlp_IsValidNpc(BalthasarSheep3) && !Npc_IsDead(BalthasarSheep3))
	{
		//AI_StartState(BalthasarSheep3,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
		BalthasarSheep3.wp = "NW_BIGMILL_FARM3_BALTHASAR";
		BalthasarSheep3.start_aistate = ZS_MM_AllScheduler;
		B_StartOtherRoutine(BalthasarSheep3,"NewFarm");
	};
	BalthasarMovedToBengar = TRUE;
};


instance DIA_Balthasar_PERMKAP1(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 70;
	condition = DIA_Balthasar_PERMKAP1_Condition;
	information = DIA_Balthasar_PERMKAP1_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Balthasar_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Balthasar_PERMKAP1_15_00");	//��� � �������?
	Npc_PerceiveAll(self);
//	if((Wld_DetectNpc(self,Balthasar_Sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 4000)) || (Wld_DetectNpc(self,Balthasar_Sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 4000)) || (Wld_DetectNpc(self,Balthasar_Sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 4000)) || (Wld_DetectNpc(self,Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 4000)) || (Wld_DetectNpc(self,Hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 4000)))
	if(!Npc_IsDead(BalthasarSheep1) && !Npc_IsDead(BalthasarSheep2) && !Npc_IsDead(BalthasarSheep3))
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_01");	//��� �� �� ��� ����������. �������, ��� �������.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_02");	//������� ������� �������. � �� ���� ����� ���� ����!
		if(!Npc_IsDead(Sekob))
		{
			AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_03");	//� �����, ����� ����� � ������ � ����������.
		};
		AI_StopProcessInfos(self);
		if((Kapitel < 3) || (TOPIC_END_SekobDMT == TRUE))
		{
			BalthasarMovedToBengar = FALSE;
			Npc_ExchangeRoutine(self,"Start");
		};
	};
};


instance DIA_Balthasar_PICKPOCKET(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 900;
	condition = DIA_Balthasar_PICKPOCKET_Condition;
	information = DIA_Balthasar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Balthasar_PICKPOCKET_Condition()
{
	return C_Beklauen(10,10);
};

func void DIA_Balthasar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
	Info_AddChoice(DIA_Balthasar_PICKPOCKET,Dialog_Back,DIA_Balthasar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Balthasar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Balthasar_PICKPOCKET_DoIt);
};

func void DIA_Balthasar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
};

func void DIA_Balthasar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
};

