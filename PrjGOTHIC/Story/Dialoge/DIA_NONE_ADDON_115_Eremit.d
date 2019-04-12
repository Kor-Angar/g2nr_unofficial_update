
instance DIA_Addon_Eremit_EXIT(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 999;
	condition = DIA_Addon_Eremit_EXIT_Condition;
	information = DIA_Addon_Eremit_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Eremit_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Eremit_Hello(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 1;
	condition = DIA_Addon_Eremit_Hello_Condition;
	information = DIA_Addon_Eremit_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Eremit_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_00");	//��� � ����� �����?! � ��� ��, ���� ������, ����� �������?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_01");	//� ����� � ����� ��������� ����� �������, ������ ��� ����� �����!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_02");	//����������� �����, ���������� ������, ��������� �����...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_03");	//��� ������� ��� ��� �������, ��� ��� � ����� �������� ��� �� ����� ������.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_04");	//�����, �������, ���� ����������� ����, �� ������ �������.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_05");	//� ��� ����, ����� ������, ����� �� ����������... ������, �� ��� ��� �� ����������.
};


instance DIA_Addon_Eremit_SeekTafeln(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 2;
	condition = DIA_Addon_Eremit_SeekTafeln_Condition;
	information = DIA_Addon_Eremit_SeekTafeln_Info;
	description = "� ��� �������� ��������...";
};


func int DIA_Addon_Eremit_SeekTafeln_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_SeekTafeln_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_02");	//� ��� �������� ��������. ���� ��� �� ����������?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_06");	//��, � ���� ���� ���� ��������. �� � ���� �� �� �����!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_07");	//��� ������������, ��� � ���� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_08");	//�������, ��������� ���������� �� ��� � �� �������, �� ��������� ������ ��� �����������.
};


var int Eremit_Teach_Once;

instance DIA_Addon_Eremit_Teach(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 3;
	condition = DIA_Addon_Eremit_Teach_Condition;
	information = DIA_Addon_Eremit_Teach_Info;
	permanent = TRUE;
	description = "������ �������� ��������...";
};


func int DIA_Addon_Eremit_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Eremit_SeekTafeln) && (Eremit_Teach_Once == FALSE) && (player_talent_foreignlanguage[LANGUAGE_3] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_03");	//������ �������� ��������...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_25");	//�� ������, ����� � ������ ���� �� ������?
	if(MIS_Eremit_Klamotten != LOG_Success)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_26");	//(������) �� ���� � ���� �� �����! ��� ��� ���� ��������!
	};
	Info_ClearChoices(DIA_Addon_Eremit_Teach);
	Info_AddChoice(DIA_Addon_Eremit_Teach,Dialog_Back,DIA_Addon_Eremit_Teach_No);
	if(player_talent_foreignlanguage[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Eremit_Teach_Yes);
	}
	else if((player_talent_foreignlanguage[LANGUAGE_2] == FALSE) && (player_talent_foreignlanguage[LANGUAGE_1] == TRUE))
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Eremit_Teach_Yes);
	}
	else if((player_talent_foreignlanguage[LANGUAGE_3] == FALSE) && (player_talent_foreignlanguage[LANGUAGE_1] == TRUE) && (player_talent_foreignlanguage[LANGUAGE_2] == TRUE))
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Eremit_Teach_Yes);
	};
};

func void B_Addon_Eremit_TeachLanguage()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_27");	//������ ��� ��� �������� ������. 'G' �������� ��� 'O', 'T' - ��� '�', � 'I' - ��� '�'.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_28");	//���� �� ��� �����, �� � ��� ��������� ������� �������� ������...
	Eremit_Teach_Once = TRUE;
};

func void DIA_Addon_Eremit_Teach_No()
{
	Info_ClearChoices(DIA_Addon_Eremit_Teach);
};

func void DIA_Addon_Eremit_Teach_Yes()
{
	if(player_talent_foreignlanguage[LANGUAGE_3] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_29");	//�� �����, ��� ���� ��� ����-�� ���� �������.
		Eremit_Teach_Once = TRUE;
	}
	else if(player_talent_foreignlanguage[LANGUAGE_2] == TRUE)
	{
		if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if(player_talent_foreignlanguage[LANGUAGE_1] == TRUE)
	{
		if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		B_Addon_Eremit_TeachLanguage();
	};
};


instance DIA_Addon_Eremit_Klamotten(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 4;
	condition = DIA_Addon_Eremit_Klamotten_Condition;
	information = DIA_Addon_Eremit_Klamotten_Info;
	permanent = TRUE;
	description = "� ������ ���� ���-����� ������...";
};


func int DIA_Addon_Eremit_Klamotten_Condition()
{
	if(MIS_Eremit_Klamotten == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_Klamotten_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_01");	//� ������ ���� ���-����� ������...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_19");	//������? ����� �� ���, � ���� �� ���������!
	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
	Info_AddChoice(DIA_Addon_Eremit_Klamotten,Dialog_Back,DIA_Addon_Eremit_Klamotten_BACK);
	if(Npc_HasItems(other,ITAR_PIR_L_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ ������� ������",DIA_Addon_Eremit_Klamotten_PIR_L);
	};
	if(Npc_HasItems(other,ITAR_PIR_M_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� ������� ������",DIA_Addon_Eremit_Klamotten_PIR_M);
	};
	if(Npc_HasItems(other,ITAR_PIR_H_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� �������� �������",dia_addon_eremit_klamotten_pir_h);
	};
	if(Npc_HasItems(other,ITAR_RANGER_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� '������ ����'",DIA_Addon_Eremit_Klamotten_Ranger);
	};
	if(Npc_HasItems(other,ITAR_KDW_L_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ ������ '������ ����'",dia_addon_eremit_klamotten_kdw_l);
	};
	if(Npc_HasItems(other,itar_kdw_h) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� ������ '������ ����'",dia_addon_eremit_klamotten_kdw_h);
	};
	if(Npc_HasItems(other,ITAR_Governor) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ �����������",dia_addon_eremit_klamotten_governor);
	};
	if(Npc_HasItems(other,ITAR_Judge) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ �����",dia_addon_eremit_klamotten_judge);
	};
	if(Npc_HasItems(other,ITAR_Smith) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ �������",dia_addon_eremit_klamotten_smith);
	};
	if(Npc_HasItems(other,ITAR_Barkeeper) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ ���������",dia_addon_eremit_klamotten_barkeeper);
	};
	if(Npc_HasItems(other,ITAR_Vlk_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ ���������� I",DIA_Addon_Eremit_Klamotten_VLK_L);
	};
	if(Npc_HasItems(other,ITAR_Vlk_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ ���������� II",DIA_Addon_Eremit_Klamotten_VLK_M);
	};
	if(Npc_HasItems(other,ITAR_Vlk_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ ���������� III",DIA_Addon_Eremit_Klamotten_VLK_H);
	};
	if(Npc_HasItems(other,ITAR_VlkBabe_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� ���������� I",dia_addon_eremit_klamotten_vlkbabe_l);
	};
	if(Npc_HasItems(other,ITAR_VlkBabe_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� ���������� II",dia_addon_eremit_klamotten_vlkbabe_m);
	};
	if(Npc_HasItems(other,ITAR_VlkBabe_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� ���������� III",dia_addon_eremit_klamotten_vlkbabe_h);
	};
	if(Npc_HasItems(other,ITAR_PAL_Skel) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ���������� ������� ��������",dia_addon_eremit_klamotten_pal_skel);
	};
	if(Npc_HasItems(other,ITAR_Bau_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ ������ �������",DIA_Addon_Eremit_Klamotten_BAU_L);
	};
	if(Npc_HasItems(other,ITAR_Bau_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� ������ �������",dia_addon_eremit_klamotten_bau_m);
	};
	if(Npc_HasItems(other,ITAR_BauBabe_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ ���������� ������",dia_addon_eremit_klamotten_baubabe_l);
	};
	if(Npc_HasItems(other,ITAR_BauBabe_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� ���������� ������",dia_addon_eremit_klamotten_baubabe_m);
	};
	if(Npc_HasItems(other,ITAR_DJG_Crawler) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� �� ����� ���������",DIA_Addon_Eremit_Klamotten_DJG_Crawler);
	};
	if(Npc_HasItems(other,ITAR_Leather_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� �������",DIA_Addon_Eremit_Klamotten_Leather);
	};
	if(Npc_HasItems(other,ITAR_Xardas) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ ������ �����",dia_addon_eremit_klamotten_xardas);
	};
	if(Npc_HasItems(other,ITAR_Lester) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ���� �������",dia_addon_eremit_klamotten_lester);
	};
	if(Npc_HasItems(other,ITAR_Diego) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� �����",dia_addon_eremit_klamotten_diego);
	};
	if(Npc_HasItems(other,ITAR_CorAngar) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������� ������",dia_addon_eremit_klamotten_corangar);
	};
	if(Npc_HasItems(other,ITAR_Prisoner) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ����� ��������",dia_addon_eremit_klamotten_prisoner);
	};
	if(Npc_HasItems(other,ITAR_Dementor) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"���� ������ ������",dia_addon_eremit_klamotten_dementor);
	};
};

func void B_Eremit_Tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_20");	//��������!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_21");	//���-���-���, ��� �� ��� ���� ���������? ��� ������ � ����� ������� �� ��, ��� ��� ���� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_22");	//���, ��� � ���� ���� ������, ��� ��� ������ �������� ��������.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_23");	//�������. � ����� ���� �����.
	B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
	B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,1);
	MIS_Eremit_Klamotten = LOG_Success;
	B_GivePlayerXP(200);
	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
};

func void DIA_Addon_Eremit_Klamotten_BACK()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_24");	//�� ���... ������� �� ���� ���������, � �����... (��������)
	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
};

func void DIA_Addon_Eremit_Klamotten_PIR_L()
{
	B_GiveInvItems(other,self,ITAR_PIR_L_Addon,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_PIR_M()
{
	B_GiveInvItems(other,self,ITAR_PIR_M_Addon,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_pir_h()
{
	B_GiveInvItems(other,self,ITAR_PIR_H_Addon,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_thorus()
{
	B_GiveInvItems(other,self,ITAR_Thorus_Addon,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_orebaron()
{
	B_GiveInvItems(other,self,ITAR_OreBaron_Addon,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_bloodwyn()
{
	B_GiveInvItems(other,self,ITAR_Bloodwyn_Addon,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_raven()
{
	B_GiveInvItems(other,self,ITAR_Raven_Addon,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Ranger()
{
	B_GiveInvItems(other,self,ITAR_RANGER_Addon,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_kdw_l()
{
	B_GiveInvItems(other,self,ITAR_KDW_L_Addon,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_kdw_h()
{
	B_GiveInvItems(other,self,itar_kdw_h,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_governor()
{
	B_GiveInvItems(other,self,ITAR_Governor,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_judge()
{
	B_GiveInvItems(other,self,ITAR_Judge,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_smith()
{
	B_GiveInvItems(other,self,ITAR_Smith,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_barkeeper()
{
	B_GiveInvItems(other,self,ITAR_Barkeeper,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_L()
{
	B_GiveInvItems(other,self,ITAR_Vlk_L,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_M()
{
	B_GiveInvItems(other,self,ITAR_Vlk_M,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_H()
{
	B_GiveInvItems(other,self,ITAR_Vlk_H,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_l()
{
	B_GiveInvItems(other,self,ITAR_VlkBabe_L,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_m()
{
	B_GiveInvItems(other,self,ITAR_VlkBabe_M,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_h()
{
	B_GiveInvItems(other,self,ITAR_VlkBabe_H,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_mil_l()
{
	B_GiveInvItems(other,self,itar_mil_l,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_mil_m()
{
	B_GiveInvItems(other,self,itar_mil_m,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_pal_m()
{
	B_GiveInvItems(other,self,itar_pal_m,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_pal_h()
{
	B_GiveInvItems(other,self,itar_pal_h,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_pal_skel()
{
	B_GiveInvItems(other,self,ITAR_PAL_Skel,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BAU_L()
{
	B_GiveInvItems(other,self,ITAR_Bau_L,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_bau_m()
{
	B_GiveInvItems(other,self,ITAR_Bau_M,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_baubabe_l()
{
	B_GiveInvItems(other,self,ITAR_BauBabe_L,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_baubabe_m()
{
	B_GiveInvItems(other,self,ITAR_BauBabe_M,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_sld_l()
{
	B_GiveInvItems(other,self,itar_sld_l,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_SLD_M()
{
	B_GiveInvItems(other,self,itar_sld_m,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_sld_h()
{
	B_GiveInvItems(other,self,itar_sld_h,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_DJG_Crawler()
{
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_djg_l()
{
	B_GiveInvItems(other,self,itar_djg_l,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_djg_m()
{
	B_GiveInvItems(other,self,itar_djg_m,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_djg_h()
{
	B_GiveInvItems(other,self,itar_djg_h,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_nov_l()
{
	B_GiveInvItems(other,self,itar_nov_l,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_kdf_l()
{
	B_GiveInvItems(other,self,itar_kdf_l,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_kdf_h()
{
	B_GiveInvItems(other,self,itar_kdf_h,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Leather()
{
	B_GiveInvItems(other,self,ITAR_Leather_L,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BDT_M()
{
	B_GiveInvItems(other,self,itar_bdt_m,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BDT_H()
{
	B_GiveInvItems(other,self,itar_bdt_h,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_xardas()
{
	B_GiveInvItems(other,self,ITAR_Xardas,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_lester()
{
	B_GiveInvItems(other,self,ITAR_Lester,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_diego()
{
	B_GiveInvItems(other,self,ITAR_Diego,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_corangar()
{
	B_GiveInvItems(other,self,ITAR_CorAngar,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_prisoner()
{
	B_GiveInvItems(other,self,ITAR_Prisoner,1);
	B_Eremit_Tatsache();
};

func void dia_addon_eremit_klamotten_dementor()
{
	B_GiveInvItems(other,self,ITAR_Dementor,1);
	B_Eremit_Tatsache();
};


instance DIA_Addon_Eremit_PERM(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 99;
	condition = DIA_Addon_Eremit_PERM_Condition;
	information = DIA_Addon_Eremit_PERM_Info;
	permanent = TRUE;
	description = "��� �� ����� ������?";
};


func int DIA_Addon_Eremit_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_04");	//��� �� ����� ������?
	if(MIS_Eremit_Klamotten == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_09");	//(�����) � ��� ������ ���. ���, ������, ����������� - ���.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_10");	//������������, ��� � ������ � ����� - ������� ����������...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_11");	//������, ������...
		AI_Output(other,self,"DIA_Addon_Eremit_Doppelt_15_01");	//��?
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_12");	//������ � �����, ��� �� ���� � ����� ������.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_13");	//� �� ���� �� ����, �� ������ ����...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_14");	//� ������ � ���� ����� ������� ������ �������� �������.
		MIS_Eremit_Klamotten = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_15");	//���� � ����������...
		if(MIS_Eremit_Klamotten == LOG_Success)
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_18");	//�� ���� �������� ��� ������ ��� ����� �������� ������...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_16");	//�����, ��� ����� ����� �����, ��� � ������!
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_17");	//���� ��� ������.
		};
	};
};

