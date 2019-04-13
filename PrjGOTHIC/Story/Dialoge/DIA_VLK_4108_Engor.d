
instance DIA_Engor_EXIT(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 999;
	condition = DIA_Engor_EXIT_Condition;
	information = DIA_Engor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Engor_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Engor_HALLO(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_HALLO_Condition;
	information = DIA_Engor_HALLO_Info;
	important = TRUE;
};


func int DIA_Engor_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Engor_HALLO_Info()
{
	AI_Output(self,other,"DIA_Engor_HALLO_13_00");	//��, �� ��� ������, �������� ������� ������ ����� ������?
	AI_Output(other,self,"DIA_Engor_HALLO_15_01");	//��.
	AI_Output(self,other,"DIA_Engor_HALLO_13_02");	//�������. � ����� - � ����������� ��� ����������.
	AI_Output(self,other,"DIA_Engor_HALLO_13_03");	//������ �� �����, ��� ������ �������� �� ���� ���-������ ���������!
	AI_Output(self,other,"DIA_Engor_HALLO_13_04");	//�� ���� � ����� �������� ����������� ������, �� ������ �����������.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"����� �������� ��������� ����� � ����� ��������� ������ �� �������.");
};


instance DIA_Engor_HANDELN(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 10;
	condition = DIA_Engor_HANDELN_Condition;
	information = DIA_Engor_HANDELN_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Engor_HANDELN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Engor_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Engor_HANDELN_Info()
{
	var int McBolzenAmount;
	var int McArrowAmount;
	AI_Output(other,self,"DIA_Engor_HANDELN_15_00");	//������ ��� ���� ������.
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItRw_Bolt,Npc_HasItems(self,ItRw_Bolt));
	McBolzenAmount = Kapitel * 50;
	CreateInvItems(self,ItRw_Bolt,McBolzenAmount);
	Npc_RemoveInvItems(self,ItRw_Arrow,Npc_HasItems(self,ItRw_Arrow));
	McArrowAmount = Kapitel * 50;
	CreateInvItems(self,ItRw_Arrow,McArrowAmount);
	Trade_IsActive = TRUE;
};


instance DIA_Engor_ABOUTPARLAF(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_ABOUTPARLAF_Condition;
	information = DIA_Engor_ABOUTPARLAF_Info;
	description = "�� ������������� �����, ��� � ������?";
};


func int DIA_Engor_ABOUTPARLAF_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlaf_ENGOR))
	{
		return TRUE;
	};
};

func void DIA_Engor_ABOUTPARLAF_Info()
{
	AI_Output(other,self,"DIA_Engor_ABOUTPARLAF_15_00");	//�� ������������� �����, ��� � ������?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_01");	//��� ���. � ���? ��� ������ � ���� ������� ��������?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_02");	//���� ���� ���-�� �����, ���� �������� ������� �� ��� - ��� � ���� ���������.
};


instance DIA_Engor_Ruestung(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_Ruestung_Condition;
	information = DIA_Engor_Ruestung_Info;
	permanent = FALSE;
	description = "� ���� ���� ���-������ ���������� ��� ����?";
};


func int DIA_Engor_Ruestung_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Engor_Ruestung_Info()
{
	AI_Output(other,self,"DIA_Engor_Ruestung_15_00");	//� ���� ���� ���-������ ���������� ��� ����?
	AI_Output(self,other,"DIA_Engor_Ruestung_13_01");	//� ���� ������� ���� ������� ������� - ������� ������� ���������. ����, �������, ���� ��� ���������.
	AI_Output(self,other,"DIA_Engor_Ruestung_13_02");	//��� ��������, ������� ��. �� ���� � ���� ���� ������, �� �������� ��.
};


instance DIA_Engor_RSkaufen(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_RSkaufen_Condition;
	information = DIA_Engor_RSkaufen_Info;
	permanent = TRUE;
	description = "������ ������� ������� ���������. ������: 70/70/20/10. (2500 ������)";
};


var int DIA_Engor_RSkaufen_perm;

func int DIA_Engor_RSkaufen_Condition()
{
	if((other.guild == GIL_MIL) && Npc_KnowsInfo(other,DIA_Engor_Ruestung) && (DIA_Engor_RSkaufen_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Engor_RSkaufen_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,2500))
	{
		AI_Output(other,self,"DIA_Engor_RSkaufen_15_00");	//��� ��� �������.
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_01");	//���, �����, ��� ������� ������� ���� - ��� ��������� ������� �������.
		CreateInvItem(hero,ITAR_MIL_M);
		AI_EquipArmor(hero,ITAR_MIL_M);
		DIA_Engor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_02");	//������� ������� ������.
	};
};


instance DIA_Engor_HELP(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 3;
	condition = DIA_Engor_HELP_Condition;
	information = DIA_Engor_HELP_Info;
	description = "�����, � ����� ������ ���� � ����� ������?";
};


func int DIA_Engor_HELP_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Engor_ABOUTPARLAF))
	{
		return TRUE;
	};
};

func void DIA_Engor_HELP_Info()
{
	AI_Output(other,self,"DIA_Engor_HELP_15_00");	//�����, � ����� ������ ���� � ����� ������?
	AI_Output(self,other,"DIA_Engor_HELP_13_01");	//���... �������, ������ ���? ��� �� �������� �� ������.
	AI_Output(other,self,"DIA_Engor_HELP_15_02");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Engor_HELP_13_03");	//���� ������ �������������� �� ������. ���� �����, ��� � ��� ����� �� �������� ����.
	AI_Output(self,other,"DIA_Engor_HELP_13_04");	//��� ��� ���� ������� ��������� ����, ����� ��� ��������������, ������� ��� �������, � ��� �� ����� ����������. ��, ���? �� �������� ���?
	Info_ClearChoices(DIA_Engor_HELP);
	Info_AddChoice(DIA_Engor_HELP,"� ���� ��� ������� �� ���.",DIA_Engor_HELP_NO);
	Info_AddChoice(DIA_Engor_HELP,"�� ��������, � ������� ���� ����.",DIA_Engor_HELP_YES);
};

func void DIA_Engor_HELP_NO()
{
	AI_Output(other,self,"DIA_Engor_HELP_NO_15_00");	//� ���� ��� ������� �� ���.
	AI_Output(self,other,"DIA_Engor_HELP_NO_13_01");	//����� ����� �� ������� ��� ����� �������?
	MIS_Engor_BringMeat = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void DIA_Engor_HELP_YES()
{
	AI_Output(other,self,"DIA_Engor_HELP_YES_15_00");	//�� ��������, � ������� ���� ����.
	AI_Output(self,other,"DIA_Engor_HELP_YES_13_01");	//��� ������ ������ ������� ��, ����� ��������� ��� ��� �������� ���. �����������, ����� � ���� ����� ��� ����. � ��� ����� ��������.
	Log_CreateTopic(TOPIC_BringMeat,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat,LOG_Running);
	B_LogEntry(TOPIC_BringMeat,"������ ����� ��� ������ ������ ����, ����� ��������� ����� � �����.");
	B_LogEntry(TOPIC_BringMeat,"�������, ��� ��� ����� - �������, ������, ����� ��� ������� ����. ��� ������, ���� �� ��� ����� ���� ������.");
	MIS_Engor_BringMeat = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Engor_BRINGMEAT(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 4;
	condition = DIA_Engor_BRINGMEAT_Condition;
	information = DIA_Engor_BRINGMEAT_Info;
	permanent = TRUE;
	description = "���, � ������ ���� ���-���. (���� ����)";
};


func int DIA_Engor_BRINGMEAT_Condition()
{
	if((MIS_Engor_BringMeat == LOG_Running) && (Meat_Counter < Meat_Amount) && (Npc_HasItems(hero,ItFo_Bacon) || Npc_HasItems(hero,ItFoMuttonRaw) || Npc_HasItems(hero,ItFoMutton) || Npc_HasItems(hero,ItFo_Sausage)))
	{
		return TRUE;
	};
};

func void DIA_Engor_BRINGMEAT_Info()
{
	var int info_ypos;
	var string ConcatRaw;
	var string ConcatMutton;
	var string ConcatBacon;
	var string ConcatSausage;
	var string GesamtFleisch;
	var int RawCounter;
	var int MuttonCounter;
	var int BaconCounter;
	var int SausageCounter;
	info_ypos = 35;
	AI_Output(other,self,"DIA_Engor_BRINGMEAT_15_00");	//���, � ������ ���� ���-���.
	if(Npc_HasItems(other,ItFoMuttonRaw) && (Meat_Counter < Meat_Amount))
	{
		Npc_GetInvItem(other,ItFoMuttonRaw);
		RawCounter = Meat_Amount - Meat_Counter;
		if(Npc_HasItems(other,ItFoMuttonRaw) > RawCounter)
		{
			ConcatRaw = IntToString(RawCounter);
			Meat_Counter += RawCounter;
			Npc_RemoveInvItems(other,ItFoMuttonRaw,RawCounter);
		}
		else
		{
			ConcatRaw = IntToString(Npc_HasItems(other,ItFoMuttonRaw));
			Meat_Counter += Npc_HasItems(other,ItFoMuttonRaw);
			Npc_RemoveInvItems(other,ItFoMuttonRaw,Npc_HasItems(other,ItFoMuttonRaw));
		};
		ConcatRaw = ConcatStrings(ConcatRaw," ������ ������ ���� ������");
		AI_PrintScreen(ConcatRaw,-1,info_ypos,FONT_ScreenSmall,3);
		info_ypos += 3;
	};
	if(Npc_HasItems(other,ItFoMutton) && (Meat_Counter < Meat_Amount))
	{
		Npc_GetInvItem(other,ItFoMutton);
		MuttonCounter = Meat_Amount - Meat_Counter;
		if(Npc_HasItems(other,ItFoMutton) > MuttonCounter)
		{
			ConcatMutton = IntToString(MuttonCounter);
			Meat_Counter += MuttonCounter;
			Npc_RemoveInvItems(other,ItFoMutton,MuttonCounter);
		}
		else
		{
			ConcatMutton = IntToString(Npc_HasItems(other,ItFoMutton));
			Meat_Counter += Npc_HasItems(other,ItFoMutton);
			Npc_RemoveInvItems(other,ItFoMutton,Npc_HasItems(other,ItFoMutton));
		};
		ConcatMutton = ConcatStrings(ConcatMutton," ������ �������� ���� ������");
		AI_PrintScreen(ConcatMutton,-1,info_ypos,FONT_ScreenSmall,3);
		info_ypos += 3;
	};
	if(Npc_HasItems(other,ItFo_Bacon) && (Meat_Counter < Meat_Amount))
	{
		Npc_GetInvItem(other,ItFo_Bacon);
		BaconCounter = Meat_Amount - Meat_Counter;
		if(Npc_HasItems(other,ItFo_Bacon) > BaconCounter)
		{
			ConcatBacon = IntToString(BaconCounter);
			Meat_Counter += BaconCounter;
			Npc_RemoveInvItems(other,ItFo_Bacon,BaconCounter);
		}
		else
		{
			ConcatBacon = IntToString(Npc_HasItems(other,ItFo_Bacon));
			Meat_Counter += Npc_HasItems(other,ItFo_Bacon);
			Npc_RemoveInvItems(other,ItFo_Bacon,Npc_HasItems(other,ItFo_Bacon));
		};
		ConcatBacon = ConcatStrings(ConcatBacon," �������� ������");
		AI_PrintScreen(ConcatBacon,-1,info_ypos,FONT_ScreenSmall,3);
		info_ypos += 3;
	};
	if(Npc_HasItems(other,ItFo_Sausage) && (Meat_Counter < Meat_Amount))
	{
		Npc_GetInvItem(other,ItFo_Sausage);
		SausageCounter = Meat_Amount - Meat_Counter;
		if(Npc_HasItems(other,ItFo_Sausage) > SausageCounter)
		{
			ConcatSausage = IntToString(SausageCounter);
			Meat_Counter += SausageCounter;
			Npc_RemoveInvItems(other,ItFo_Sausage,SausageCounter);
		}
		else
		{
			ConcatSausage = IntToString(Npc_HasItems(other,ItFo_Sausage));
			Meat_Counter += Npc_HasItems(other,ItFo_Sausage);
			Npc_RemoveInvItems(other,ItFo_Sausage,Npc_HasItems(other,ItFo_Sausage));
		};
		ConcatSausage = ConcatStrings(ConcatSausage," ������ ������");
		AI_PrintScreen(ConcatSausage,-1,info_ypos,FONT_ScreenSmall,3);
		info_ypos += 3;
	};
	if(Meat_Amount > Meat_Counter)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_01");	//��� ������ � ��� �������, �� ��� ����� ������.
		GesamtFleisch = IntToString(Meat_Counter);
		GesamtFleisch = ConcatStrings("� ����� ������ ����: ",GesamtFleisch);
		AI_PrintScreen(GesamtFleisch,-1,info_ypos,FONT_ScreenSmall,3);
	};
	if(Meat_Counter >= Meat_Amount)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_02");	//�������, �� ������ ���������� ����. ����� ������ �� ��������� �����.
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_03");	//�� ���� �� �������, ��� � ������ ���� ������ ���� ���-������ ���������!
		MIS_Engor_BringMeat = LOG_SUCCESS;
		B_GivePlayerXP(XP_BringMeat);
		Log_AddEntry(TOPIC_BringMeat,"����� ������� ���� ����. �� �������� ��� ����� ����������� �����.");
	};
};


instance DIA_Engor_Business(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 1;
	condition = DIA_Engor_Business_Condition;
	information = DIA_Engor_Business_Info;
	permanent = FALSE;
	description = "��� ������?";
};


func int DIA_Engor_Business_Condition()
{
	if((Kapitel >= 4) && (MIS_Engor_BringMeat == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Engor_Business_Info()
{
	AI_Output(other,self,"DIA_Engor_Business_15_00");	//��� ������?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_01");	//�������. � �������, ��� ���� �� � ���� ��������� �� �������� ���� �����-������ ������.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_02");	//�������! �������� ������ �� ��������.
	};
	AI_Output(self,other,"DIA_Engor_Business_13_03");	//� ��� ������ ����? �� ������ ���-������ ������?
};


instance DIA_Engor_PICKPOCKET(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 900;
	condition = DIA_Engor_PICKPOCKET_Condition;
	information = DIA_Engor_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(������� ��� ����� ����� �������� ������)";
};


func int DIA_Engor_PICKPOCKET_Condition()
{
//	return C_StealItems(40,Hlp_GetInstanceID(ItWr_Map_OldWorld),0);
	return C_StealItem(40,Hlp_GetInstanceID(ItWr_Map_OldWorld));
};

func void DIA_Engor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engor_PICKPOCKET);
	Info_AddChoice(DIA_Engor_PICKPOCKET,Dialog_Back,DIA_Engor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Engor_PICKPOCKET_DoIt);
};

func void DIA_Engor_PICKPOCKET_DoIt()
{
	CreateInvItem(self,ItWr_Map_OldWorld);
//	B_StealItems(40,Hlp_GetInstanceID(ItWr_Map_OldWorld),1);
	B_StealItem(40,Hlp_GetInstanceID(ItWr_Map_OldWorld));
	Info_ClearChoices(DIA_Engor_PICKPOCKET);
};

func void DIA_Engor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engor_PICKPOCKET);
};

