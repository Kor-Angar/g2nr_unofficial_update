
instance DIA_Peck_EXIT(C_Info)
{
	npc = MIL_324_Peck;
	nr = 999;
	condition = DIA_Peck_EXIT_Condition;
	information = DIA_Peck_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Peck_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Peck_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Peck_PICKPOCKET(C_Info)
{
	npc = MIL_324_Peck;
	nr = 900;
	condition = DIA_Peck_PICKPOCKET_Condition;
	information = DIA_Peck_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Key;
};


func int DIA_Peck_PICKPOCKET_Condition()
{
//	return C_StealItems(60,Hlp_GetInstanceID(ItKe_City_Tower_05),1);
	if(Npc_HasItems(self,ItKe_City_Tower_05))
	{
		return C_StealItem(60,Hlp_GetInstanceID(ItKe_City_Tower_05));
	}
	else
	{
		return FALSE;
	};
};

func void DIA_Peck_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
	Info_AddChoice(DIA_Peck_PICKPOCKET,Dialog_Back,DIA_Peck_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Peck_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Peck_PICKPOCKET_DoIt);
};

func void DIA_Peck_PICKPOCKET_DoIt()
{
//	B_StealItems(60,Hlp_GetInstanceID(ItKe_City_Tower_05),1);
	B_StealItem(60,Hlp_GetInstanceID(ItKe_City_Tower_05));
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
};

func void DIA_Peck_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
};


instance DIA_Peck_HEY(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_HEY_Condition;
	information = DIA_Peck_HEY_Info;
	permanent = TRUE;
	description = "��, �� ��� ������� ���?";
};


func int DIA_Peck_HEY_Condition()
{
	if((MIS_Andre_Peck != LOG_Running) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Peck_HEY_Info()
{
	AI_Output(other,self,"DIA_Peck_HEY_15_00");	//��, �� ��� ������� ���?
	AI_Output(self,other,"DIA_Peck_HEY_12_01");	//��������, � �����. ������ ���� � �����.
	AI_StopProcessInfos(self);
};


instance DIA_Peck_FOUND_PECK(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_FOUND_PECK_Condition;
	information = DIA_Peck_FOUND_PECK_Info;
	permanent = FALSE;
	description = "��, ���� ���� ������������ �����.";
};


func int DIA_Peck_FOUND_PECK_Condition()
{
	if((MIS_Andre_Peck == LOG_Running) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Peck_FOUND_PECK_Info()
{
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_00");	//��, ���� ���� ������������ �����.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_01");	//��� ���� �����? �� ����� �� ������, � �����?
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_02");	//��� ����� ������, ��� ��� ����������� � �������.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_03");	//����, ���� ������ ����� ���������.
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_04");	//�����, ����� ��� ���� ���� ����.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_05");	//��-�-�... ����. �����, � ��� ��� - �� ����� ������ ����������� �����, �� ������ ���, ��� � ��� �����.
	self.aivar[AIV_IgnoresFakeGuild] = FALSE;
	self.aivar[AIV_ToughGuy] = FALSE;
	self.aivar[AIV_ToughGuyNewsOverride] = FALSE;
	self.aivar[AIV_IGNORE_Murder] = FALSE;
	self.aivar[AIV_IGNORE_Theft] = FALSE;
	self.aivar[AIV_IGNORE_Sheepkiller] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STORAGE");
	Npc_ExchangeRoutine(Vanja,"ALONE");
};


func void B_GetWeaponFromPeckCh3()
{
	AI_Output(self,other,"DIA_Peck_Add_12_03");	//������, ��� �� �������. ��� ��������� ��������� ����� ������� ������� �� ��������� �����.
	AI_Output(self,other,"DIA_Peck_Add_12_04");	//��� �� ������ �� �����������. (������� ����)
	AI_Output(self,other,"DIA_Peck_Add_12_05");	//���, ������.
	B_GiveInvItems(self,other,ItMw_Rubinklinge,1);
};

instance DIA_Peck_WEAPON(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_WEAPON_Condition;
	information = DIA_Peck_WEAPON_Info;
	permanent = TRUE;
	description = "� ������ �� �������.";
};


var int DIA_Peck_WEAPON_perm;
var int DIA_Peck_WEAPON2_perm;

func int DIA_Peck_WEAPON_Condition()
{
	if((other.guild == GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (DIA_Peck_WEAPON_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Peck_WEAPON_Info()
{
	AI_Output(other,self,"DIA_Peck_WEAPON_15_00");	//� ������ �� �������.
	if(Npc_KnowsInfo(other,DIA_Andre_FOUND_PECK))
	{
		if(MIS_Andre_Peck == LOG_Running)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//����� ������� � ����� � ������ ���.
		}
		else
		{
			if(MIS_Andre_Peck == LOG_OBSOLETE)
			{
				AI_Output(self,other,"DIA_Peck_WEAPON_12_02");	//����������, ��� ������. ��� ����� ����. � ��� ����� ���.
				AI_Output(self,other,"DIA_Peck_WEAPON_12_03");	//�� �� ������ �����, ��� � ��� � ������� ������. ������, �� ���������� ������. ���, ����� ���� ���.
				AI_Output(self,other,"DIA_Peck_Add_12_00");	//��� ������, ��� � ���� ����.
				B_GiveInvItems(self,hero,ItMw_Schwert1,1);
			}
			else if(MIS_Andre_Peck == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Peck_WEAPON_12_04");	//� �� ������ ���� �����. ��� ������ �����, ��� � ��� � ������� ������, �?
				AI_Output(self,other,"DIA_Peck_WEAPON_12_05");	//� ������ �� ������ �������� �� ���� ���... ������, �� �������� ���. ���. � ������ ����� � �����!
				B_GiveInvItems(self,hero,ItMw_1h_MISC_Sword,1);
			};
			DIA_Peck_WEAPON_perm = TRUE;
			AI_Output(self,other,"DIA_Peck_WEAPON_12_06");	//���� ���� ����� ������ �������, ��� � ��������� �� �����.
		};
	}
	else if(Kapitel >= 3)
	{
		B_GetWeaponFromPeckCh3();
		DIA_Peck_WEAPON_perm = TRUE;
		DIA_Peck_WEAPON2_perm = TRUE;
	};
	AI_StopProcessInfos(self);
};

func void B_Peck_LeckMich()
{
	AI_Output(self,other,"DIA_Peck_Add_12_07");	//������� ��� �������!
};


instance DIA_Peck_WEAPON2(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_WEAPON2_Condition;
	information = DIA_Peck_WEAPON2_Info;
	permanent = TRUE;
	description = "� ���� ��� ������ ������� ��� ����?";
};


func int DIA_Peck_WEAPON2_Condition()
{
	if((other.guild == GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (DIA_Peck_WEAPON_perm == TRUE) && (DIA_Peck_WEAPON2_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Peck_WEAPON2_Info()
{
	AI_Output(other,self,"DIA_Peck_Add_15_01");	//� ���� ��� ������ ������� ��� ����?
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_06");	//� �� �����, ��� �� ����� �� ���� ����� �����.
		B_Peck_LeckMich();
	}
	else if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//���� ���...
	}
	else
	{
		B_GetWeaponFromPeckCh3();
		DIA_Peck_WEAPON2_perm = TRUE;
	};
};


instance DIA_Peck_PERM(C_Info)
{
	npc = MIL_324_Peck;
	nr = 998;
	condition = DIA_Peck_PERM_Condition;
	information = DIA_Peck_PERM_Info;
	permanent = TRUE;
	description = "� ����� ��� � �������?";
};


func int DIA_Peck_PERM_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Peck_WEAPON) || ((other.guild != GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)))
	if(Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)
	{
		return TRUE;
	};
};

func void DIA_Peck_PERM_Info()
{
	AI_Output(other,self,"DIA_Peck_PERM_15_00");	//� ����� ��� � �������?
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		B_Peck_LeckMich();
	}
	else if(Kapitel != 3)
	{
		AI_Output(self,other,"DIA_Peck_PERM_12_01");	//��, � � �����?
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_02");	//�� ������. ���� ������� ��� ��������. � ���� �������, ��� ����� ���������� ���������� ������ ������ �� ������ �����.
				AI_Output(self,other,"DIA_Peck_PERM_12_03");	//��� ���-�� �� ����� ������� ��������� ������ ����� ������� ������.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_04");	//�������! �� ������ �� �����. ���� ����� ���� �������, ��� ����� ������������ �� ������� �������.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_05");	//� ����, ��� �� �������, �� � ���� �� ��������� ���� ������ � ���� �����������.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Peck_PERM_12_06");	//� ����� ���, ��� ��� ���� �� �������� ������ �������.
			AI_Output(other,self,"DIA_Peck_PERM_15_07");	//������?
			AI_Output(self,other,"DIA_Peck_PERM_12_08");	//�������� ������ ��� �� ��������� ��. ��� �� �� ����� ������ ����� ���� � �������� ��������� �� ���, ��� �� ������� ������ �� ���.
			AI_Output(self,other,"DIA_Peck_PERM_12_09");	//��� ���� ����� ������� �� �����. � ���� ������ �� ���� � ���, � ���� ��� ����� ��������.
		};
	};
};

