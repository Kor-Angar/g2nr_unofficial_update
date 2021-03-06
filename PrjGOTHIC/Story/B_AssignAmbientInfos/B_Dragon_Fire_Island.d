
instance DIA_Dragon_Fire_Island_Exit(C_Info)
{
	npc = Dragon_Fire_Island;
	nr = 999;
	condition = DIA_Dragon_Fire_Island_Exit_Condition;
	information = DIA_Dragon_Fire_Island_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Fire_Island_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Island_Exit_Info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_Dragon_Fire_Island_Hello(C_Info)
{
	npc = Dragon_Fire_Island;
	nr = 5;
	condition = DIA_Dragon_Fire_Island_Hello_Condition;
	information = DIA_Dragon_Fire_Island_Hello_Info;
	important = TRUE;
};


func int DIA_Dragon_Fire_Island_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Island_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_00");	//����, �������. ��� ��� ������� ������� ���, ��� ������ ���� ����� � ����� ����� ������ ����.
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_01");	//��? ���� �� ������ �������, ��, ���������� ���?
	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_02");	//���� ������������ ����, ��� �� ��������� ����� ���� ����� ���������?
	};
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_03");	//�� ����� ������� ����� ��� ���� ��������, � �� ��������� �� ���.
	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_04");	//� ����� ��������� ��������� �� ��������� �� ������ ���������� �������.
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_05");	//��-�. � � �������� ������������� ����� ���� ������.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_06");	//������ ������� ��������� ������. ����� �������� � ����.
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_07");	//�� ����� ������� ������, ������ �����������, �� ���� �� ���� ������ �����.
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	SC_IsWearingInnosEye = FALSE;
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_HallenVonIrdorath,"��� ���� �������� ������. � ��� �� ����� ��� ����� �������. ��� ����� ���� ����� ����������� ����� ��������, ��� ����� �� ���� �������� ��������.");
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};

