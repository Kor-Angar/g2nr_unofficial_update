
func int B_TeachPlayerTalentTakeAnimalTrophy(var C_Npc slf,var C_Npc oth,var int trophy)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy,"������ � ����:");
	if(trophy == TROPHY_Teeth)
	{
		player_talent_takeanimaltrophy[TROPHY_Teeth] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...�������� ����� �� ������� ��������.");
	};
	if(trophy == TROPHY_Claws)
	{
		player_talent_takeanimaltrophy[TROPHY_Claws] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...�������� ����� �� ������� ��������.");
	};
	if(trophy == TROPHY_Fur)
	{
		player_talent_takeanimaltrophy[TROPHY_Fur] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...������� ����� � ������� ��������.");
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		player_talent_takeanimaltrophy[TROPHY_ReptileSkin] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...������� ����� � ��������.");
	};
	if(trophy == TROPHY_Heart)
	{
		player_talent_takeanimaltrophy[TROPHY_Heart] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...�������� ������ �� ������� ������� � �������.");
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		player_talent_takeanimaltrophy[TROPHY_ShadowHorn] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...�������� ��� � ������� ����������.");
	};
	if(trophy == TROPHY_FireTongue)
	{
		player_talent_takeanimaltrophy[TROPHY_FireTongue] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...�������� ���� � ������� �������� ������.");
	};
	if(trophy == TROPHY_BFWing)
	{
		player_talent_takeanimaltrophy[TROPHY_BFWing] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...�������� ������ � ������� �������� ���.");
	};
	if(trophy == TROPHY_BFSting)
	{
		player_talent_takeanimaltrophy[TROPHY_BFSting] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...�������� ���� � ������� �������� ���.");
	};
	if(trophy == TROPHY_Mandibles)
	{
		player_talent_takeanimaltrophy[TROPHY_Mandibles] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...�������� ��������� � ������� ��������.");
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		player_talent_takeanimaltrophy[TROPHY_CrawlerPlate] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...������� ������� � ������� ���������.");
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		player_talent_takeanimaltrophy[TROPHY_DrgSnapperHorn] = TRUE;
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...�������� ���� � ������� �������� ���������.");
	};
	if(trophy == TROPHY_DragonScale)
	{
		player_talent_takeanimaltrophy[TROPHY_DragonScale] = TRUE;
		CreateInvItems(SwampDragon,ItAt_DragonScale,12);
		CreateInvItems(RockDragon,ItAt_DragonScale,12);
		CreateInvItems(FireDragon,ItAt_DragonScale,12);
		CreateInvItems(IceDragon,ItAt_DragonScale,12);
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... ������� ����� � ������� ��������.");
	};
	if(trophy == TROPHY_DragonBlood)
	{
		player_talent_takeanimaltrophy[TROPHY_DragonBlood] = TRUE;
		CreateInvItems(SwampDragon,ItAt_DragonBlood,2);
		CreateInvItems(RockDragon,ItAt_DragonBlood,2);
		CreateInvItems(FireDragon,ItAt_DragonBlood,2);
		CreateInvItems(IceDragon,ItAt_DragonBlood,2);
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... �������� ����� �� ������� ��������.");
	};
	PrintScreen(PRINT_LearnTakeAnimalTrophy,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	return TRUE;
};

