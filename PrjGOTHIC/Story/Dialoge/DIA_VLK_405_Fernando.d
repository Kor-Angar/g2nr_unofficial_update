
instance DIA_Fernando_EXIT(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 999;
	condition = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Fernando_PICKPOCKET(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 900;
	condition = DIA_Fernando_PICKPOCKET_Condition;
	information = DIA_Fernando_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Fernando_PICKPOCKET_Condition()
{
//	if(C_StealItems(50,Hlp_GetInstanceID(ItSe_GoldPocket100),1) && (NpcObsessedByDMT_Fernando == FALSE))
	if(Npc_HasItems(self,ItSe_GoldPocket100) && (NpcObsessedByDMT_Fernando == FALSE))
	{
//		return TRUE;
		return C_StealItem(50,Hlp_GetInstanceID(ItSe_GoldPocket100));
	}
	else
	{
		return FALSE;
	};
};

func void DIA_Fernando_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	Info_AddChoice(DIA_Fernando_PICKPOCKET,Dialog_Back,DIA_Fernando_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fernando_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fernando_PICKPOCKET_DoIt);
};

func void DIA_Fernando_PICKPOCKET_DoIt()
{
//	B_StealItems(50,Hlp_GetInstanceID(ItSe_GoldPocket100),1);
	B_StealItem(50,Hlp_GetInstanceID(ItSe_GoldPocket100));
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
};

func void DIA_Fernando_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
};


instance DIA_Fernando_Hello(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent = FALSE;
	description = "��� ���� ����?";
};


func int DIA_Fernando_Hello_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Hello_Info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//�� �������, ����� ����� ������. ����� ������ ��� ��� �����, ������� ���� �������.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//����������� �������� ���� � ������, � ��� ������� ���������� �� �� �������.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//� �� �������� ���� ��� ���������� ���� � ������ ������.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//�� ������ �� �������� �� ��������, � ��� ���������� ������������ ������ �� �������� � ���, ��� �������� ��������.
};


instance DIA_Fernando_Perm(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 850;
	condition = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent = TRUE;
	description = "� ��� �� ������ ������������� �� �����?";
};


func int DIA_Fernando_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Perm_Info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//� ��� �� ������ ������������� �� �����?
	if(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_Perm_14_00");	//���� �����. �� � ����� ������, ������� ������ � ������ �� ���������. ��� �����.
	}
	else if(!Npc_KnowsInfo(other,DIA_Fernando_Success))
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//�����! ������ � ���� ������ �� ���� ������������ �����. �� ���� � �� ����� ����� �������� ������, ����� ��� ���� �������� ������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//� �������. ��� ������ ��������� ����� ���� � ��������� �������� �� ����� ���������������� �������.
	};
};


instance DIA_Fernando_Minental(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 2;
	condition = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fernando_Minental_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (MIS_OLDWORLD == LOG_Running) && (Kapitel == 2) && (EnterOW_Kapitel2 == FALSE) && (Fernando_HatsZugegeben == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Minental_Info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//��, �� - ������� �������. �� ���� ������������� � ������ ��������, ��?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//�?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//� ���� ���������� ���� ������. �� ��������� ��� ������ � ���, ��� ��� ���������� � �����, � �� ��� � ��� ����...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//... ������ ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//... ������, ������� ������� ���� ��������� ����.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//� ��������, ��� ����� �������.
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Fernando,LOG_Running);
	B_LogEntry(TOPIC_Fernando,"�������� �������� ����� �����, ��� ������� ���� � ����� � ������ ��������.");
};


instance DIA_Addon_Fernando_BanditTrader(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Addon_Fernando_BanditTrader_Condition;
	information = DIA_Addon_Fernando_BanditTrader_Info;
	permanent = TRUE;
	description = "�� �������� ������ ��������.";
};


func int DIA_Addon_Fernando_BanditTrader_Condition()
{
//	if((FernandoBlame_noPerm == FALSE) && (Vatras_ToMartin == TRUE) && Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE) && (Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))))
	if((FernandoBlame_noPerm == FALSE) && (MIS_Vatras_FindTheBanditTrader == LOG_Running) && Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE) && (Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fernando_BanditTrader_Info()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//�� �������� ������ ��������.
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//��� ��� ������ ��! �� ���� �����! � �������� ���� ��������� �� ���.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//������� ���� �������� ������ �����, � � �����, ��� ���� �� ���� �������� � ��������� �����.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//(���) ������, ��� ����� ��� ������.
		FernandoBlame_noPerm = TRUE;
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//(����������) ������ ��� �� ��� �����?
		FernandoMajorEvidenceCount = 0;
		if(Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//�� ������ ��������� �������, ������� � ����� � ��������, ����� ���� �������.
			FernandoMajorEvidenceCount += 3;
		};
		if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//� �������� � ����� ������ ������� ������� ��������� ��������. �� - ������� ��������.
			FernandoMajorEvidenceCount += 1;
			if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
			{
				AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//� �� �����, ������� ���� � ��������, ����� ���� ��������.
				FernandoMajorEvidenceCount += 1;
			};
		}
		else if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//�� �����, ������� ���� � ��������, ����� ���� ��������.
			FernandoMajorEvidenceCount += 1;
		};
		if(FernandoMajorEvidenceCount < 2)
		{
			AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//�?
			AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//�-�...
			if((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF))
			{
				B_Say(self,other,"$SpareMe");
			}
			else
			{
				B_Say(self,other,"$NOTNOW");
			};
			B_NpcClearObsessionByDMT(self);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//������ ���� �� �����������. � ���� �������.
			B_LogEntry(TOPIC_Addon_Bandittrader,"������� �������� �������� �������, ��� ��������� ������ ��������.");
			B_GivePlayerXP(XP_Addon_Fernando_HatsZugegeben);
			FernandoBlame_noPerm = TRUE;
			Fernando_HatsZugegeben = TRUE;
			AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//(��������) � �� ����� ����� ������! ������ ���!
			AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//(��������) ������� � �������� �� ������ ���. ���� � ���� ��� �������, � ��� ���� ��� ���� ������������ �������.
			AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//(��������) �� ����� ������� ����� ������������ � ���� �������� ����� ����, ���� � �� ������ �� ������.
			AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//(��������) �� �� ������ �������� ����! � ����� ���� ������ �������������.
			Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"������� �� ��� ���������, ���� � ���� ������?",DIA_Addon_Fernando_BanditTrader_preis);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"� ����� ���������� ���������.",DIA_Addon_Fernando_BanditTrader_mil);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"�� ������� ����� ���� �� �������. �� ������ �������������� � ������ ������.",DIA_Addon_Fernando_BanditTrader_Uptown);
		};
	};
};

func void DIA_Addon_Fernando_BanditTrader_Uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//�� ������� ����� ���� �� �������. �� ������ �������������� � ������ ������.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//�� ��������� ������� �� ���� ����� �������.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//�� � ���� ��������� ��������! ���� � �� ���� �������, ���� ����� �������� ������� �� ���� �����.
};

func void DIA_Addon_Fernando_BanditTrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//� ����� ���������� ���������.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//�� �� ������ ��� ���������!
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//��� ��� ����. ��� �������.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//�, �����! � ������!
	B_NpcClearObsessionByDMT(self);
};

func void DIA_Addon_Fernando_BanditTrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//������� �� ��� ���������, ���� � ���� ������?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//���� � ���� ���� �������. ����� � ��������� �� �����.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//������, 200 ������� � ������ ������?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//����� ������ �������. �� ���, �� ������ ��� ���� �����?
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"���, �������, � ������� �� ����.",DIA_Addon_Fernando_BanditTrader_nein);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"�� ������, � ��������.",DIA_Addon_Fernando_BanditTrader_ja);
};

func void DIA_Addon_Fernando_BanditTrader_ja()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_ja_15_00");	//�� ������, � ��������.
	B_GivePlayerXP(XP_Ambient);
	FernandoMajorEvidenceCount = 0;
	if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
	{
		Npc_RemoveInvItems(other,ItMw_Addon_BanditTrader,Npc_HasItems(other,ItMw_Addon_BanditTrader));
	};
	if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
	{
		Npc_RemoveInvItem(other,ItRi_Addon_BanditTrader);
		FernandoMajorEvidenceCount += 1;
	};
	if(Npc_HasItems(other,ItWr_Addon_BanditTrader))
	{
		Npc_RemoveInvItem(other,ItWr_Addon_BanditTrader);
		FernandoMajorEvidenceCount += 1;
	};
	AI_PrintScreen(PRINT_Addon_EvidenceGiven,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//������, ��� ������.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//� ������. �� � �������.
	if(FernandoMajorEvidenceCount < 2)
	{
		CreateInvItems(self,ItRi_Prot_Point_01,1);
		B_GiveInvItems(self,other,ItRi_Prot_Point_01,1);
	}
	else
	{
		CreateInvItems(self,ItRi_Prot_Total_00,1);
		B_GiveInvItems(self,other,ItRi_Prot_Total_00,1);
		MIS_Martin_FindTheBanditTrader = LOG_FAILED;
		MIS_Vatras_FindTheBanditTrader = LOG_FAILED;
		B_LogEntry(TOPIC_Addon_Bandittrader,"� ����� �� ���������� �������� � ������ � ����� ��� ��� �����.");
		B_CheckLog();
	};
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

func void DIA_Addon_Fernando_BanditTrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//���, �������, � ������� �� ����.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//��� ������. �� ������������: ���� �� ���� ������, ���� �� ������������.
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};


instance DIA_Fernando_Success(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent = FALSE;
	description = "� ��� � ������ ��������.";
};


func int DIA_Fernando_Success_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Fernando_Minental))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Success_Info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//� ��� � ������ ��������.
	if((Fernando_ImKnast == FALSE) && (NpcObsessedByDMT_Fernando == FALSE))
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP(XP_Ambient);
		AI_Output(self,other,"DIA_Fernando_Success_14_01");	//�? ��� ��� ������� ����?
		AI_Output(other,self,"DIA_Fernando_Success_15_02");	//����� ��������, ��� ����� ������ ����� �����-������ ��������� ������ ����. ���� �� ��� ������� ����� �������.
		AI_Output(self,other,"DIA_Fernando_Success_14_03");	//����� �� ����� ����! ��� ��������, ��� � �������...
		AI_Output(other,self,"DIA_Fernando_Success_15_04");	//��� ������ ����� ������?
		if((Fernando_HatsZugegeben == FALSE) || (MIS_Vatras_FindTheBanditTrader == LOG_FAILED))
		{
			AI_Output(self,other,"DIA_Fernando_Success_14_05");	//��, ��, ���� ��������������...
			if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//���, ����� ���� ������ ������.
				B_GiveInvItems(self,other,ItMi_RuneBlank,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//��� ���� ������.
				B_GiveInvItems(self,other,ItRi_Hp_02,1);
			};
		}
		else
		{
			B_Say(self,other,"$NOTNOW");
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
//		Log_SetTopicStatus(TOPIC_Fernando,LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_Fernando,LOG_FAILED);
		B_LogEntry(TOPIC_Fernando,"�������� ������ �� ��������� � ����������. � ����� �� ��� �� ��� �� ��������.");
	};
};


instance DIA_Fernando_Obsession(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 30;
	condition = DIA_Fernando_Obsession_Condition;
	information = DIA_Fernando_Obsession_Info;
	description = "��� � �������?";
};


func int DIA_Fernando_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Fernando == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Obsession_Info()
{
	AI_Output(other,self,"DIA_Joe_Perm_15_00");	//��� � �������?
	B_NpcObsessedByDMT(self);
};


instance DIA_Fernando_Heilung(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = DIA_Fernando_Heilung_Condition;
	information = DIA_Fernando_Heilung_Info;
	permanent = TRUE;
	description = "�� �������!";
};


func int DIA_Fernando_Heilung_Condition()
{
	if((NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Heilung_Info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//�� �������!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//�����. ����� ����������.
	B_NpcClearObsessionByDMT(self);
};

