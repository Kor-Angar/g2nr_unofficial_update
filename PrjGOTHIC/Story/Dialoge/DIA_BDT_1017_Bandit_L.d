
instance DIA_1017_BANDIT_EXIT(C_Info)
{
	npc = BDT_1017_Bandit_L;
	nr = 999;
	condition = DIA_1017_BANDIT_EXIT_Condition;
	information = DIA_1017_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_1017_BANDIT_EXIT_Condition()
{
	return TRUE;
};

func void DIA_1017_BANDIT_EXIT_Info()
{
	if(Npc_KnowsInfo(hero,DIA_1017_BANDIT_AMBUSH))
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_00");	//� ����������� ����. ���� � �� ���� ����, ��� ����� ����. ��� ��� �� �� ���������� ��� ������.
	}
	else
	{
		B_Say(self,other,"$EnemyKilled");
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_1017_BANDIT_AMBUSH(C_Info)
{
	npc = BDT_1017_Bandit_L;
	nr = 2;
	condition = DIA_1017_BANDIT_AMBUSH_Condition;
	information = DIA_1017_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1017_BANDIT_AMBUSH_Condition()
{
	return TRUE;
};

func void DIA_1017_BANDIT_AMBUSH_Info()
{
	B_Say(self,other,"$IGetYouStill");
	//B_Say(self,other,"$ABS_GOOD");
	//B_Say(self,other,"$ABS_GOOD");
	//B_Say(self,other,"$ABS_GOOD");
	AI_Output(other,self,"DIA_Attila_Willkommen_15_01");	//��� �� � ��� ���� ����� �� ����?
	B_Say(self,other,"$SpareMe");
	AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00");	//��� ������ ���� �� ���?
	AI_Output(self,other,"DIA_Dexter_Hallo_09_05");	//����� � ������� ��������� �� ������ ��������, ������� ���������� ���� � �������� ��� �������.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_06");	//� ��� �����, ��� ��� �����, �� ���������� ���... ������... ��������� �� ����.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_07");	//�� ��� ���� ������ ���� � ���������, ���������� ��� ��� �����. � �� ��������� �������, ���� ��������� ������������ ������������.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_08");	//�� ��������� ��� ���� ������. �� ����� ���� �� ������ � ��������� ������ ������� �� ���� ������.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_09");	//��, � ��� ��� ���� ������? ���� �� � ���������, �� ���� �� ����!
	AI_Output(other,self,"DIA_Dexter_Wo_15_00");	//��� ��� ����� ����� ��������?
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_01");	//� �����, �� ���-�� � ������ ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_02");	//���� ������ �����, � �� �� ����. �� ��� �����, ��� �������! � ��� ���� ����.
	};
	//AI_UseMob(self,"BENCH",-1);
};

