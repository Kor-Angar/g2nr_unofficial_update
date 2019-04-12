
func int B_TeachPlayerTalentSmith(var C_Npc slf,var C_Npc oth,var int waffe)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith,"����� �������� ������, ������ ����� ��� ����� ����� �����. � ������ �������� ������� �� � ���� ���������� �����, � ����� ������� ����� �� ����������. ������ ������ �������� ������� ������ ����������, ��������� ������ ������ ��������. ");
	if(waffe == WEAPON_Common)
	{
		player_talent_smith[WEAPON_Common] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"��� '���������� ����' ��� �� ����� ������� ������������.");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		player_talent_smith[WEAPON_1H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"��� '�������� ������� ����' ��� ����� 1 ����� ����.");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		player_talent_smith[WEAPON_2H_Special_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"��� '���������� ������� ����' ��� ����� 2 ����� ����.");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		player_talent_smith[WEAPON_1H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"��� '����������� ������� ����' ��� ����� 2 ����� ����.");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		player_talent_smith[WEAPON_2H_Special_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"��� '�������� ���������� ������� ����' ��� ����� 3 ����� ����.");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		player_talent_smith[WEAPON_1H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"��� '������� ������� ����' ��� ����� 3 ����� ����.");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		player_talent_smith[WEAPON_2H_Special_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"��� '�������� ������� ������� ����' ��� ����� 4 ����� ����.");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		player_talent_smith[WEAPON_1H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"��� '������� ������ ��������' ��� ����� 4 ����� ���� � 5 �������� ����� �������.");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		player_talent_smith[WEAPON_2H_Special_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"��� '�������� ������� ������ ��������' ��� ����� 5 ����� ���� � 5 �������� ����� �������.");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		player_talent_smith[WEAPON_1H_Harad_01] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"������ � ���� �������� ���������� ���.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		player_talent_smith[WEAPON_1H_Harad_02] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"������ � ���� �������� ���������� ������� ���.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		player_talent_smith[WEAPON_1H_Harad_03] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"������ � ���� �������� ��������� ������.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		player_talent_smith[WEAPON_1H_Harad_04] = TRUE;
		B_LogEntry(TOPIC_TalentSmith,"����� ������� ��� ������ ����� '��� ��������' - ������ �� ������ ������� � ����!");
	};
	PrintScreen(PRINT_LearnSmith,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

