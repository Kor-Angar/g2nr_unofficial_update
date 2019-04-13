
func void B_LogEntry(var string topic,var string entry)
{
	Log_AddEntry(topic,entry);
	PrintScreen(PRINT_NewLogEntry,-1,YPOS_LOGENTRY,FONT_ScreenSmall,2);
	Snd_Play("LogEntry");
};

func void B_CheckDynamicText()
{
	if(Hammer_Once == FALSE)
	{
		TEXT_LousHammer_Setting = PRINT_UnknownEffect;
	}
	else
	{
		TEXT_LousHammer_Setting = "������ �� ���� �������� �������, ����� ���������.";
	};
	if(Zeitspalt_Used == FALSE)
	{
		TEXT_Zeitspalt_Setting = PRINT_UnknownEffect;
	}
	else
	{
		TEXT_Zeitspalt_Setting = "���������� �������.";
	};
	if(MegaDrink_Used == FALSE)
	{
		TEXT_MegaDrink_Setting = PRINT_UnknownEffect;
		COUNT_MegaDrink_Setting = 0;
		TEXT_MegaDrink_Setting2 = " ";
	}
	else
	{
		TEXT_MegaDrink_Setting2 = "��������� ������������� ���������.";
		TEXT_MegaDrink_Setting = "�������� � ���� ��� ��������:";
		COUNT_MegaDrink_Setting = STRorDEX_MegaDrink;
	};
	if(Neoras_SCUsedDragonEggDrink == FALSE)
	{
		TEXT_DragonEggDrinkNeoras_Setting = PRINT_UnknownEffect;
		COUNT_DragonEggDrinkNeoras_Setting = 0;
	}
	else
	{
		TEXT_DragonEggDrinkNeoras_Setting = NAME_Bonus_Str;
		COUNT_DragonEggDrinkNeoras_Setting = 3;
	};
	/*if(Player_KnowsSchnellerHering == FALSE)
	{
		TEXT_SchnellerHering_Setting = "�������� �������������!";
		TEXT_SchnellerHering_Setting2 = "������ ����������, �������� �������� �������.";
		COUNT_SchnellerHering_Setting = 0;
	}
	else
	{
		TEXT_SchnellerHering_Setting = "�������� �������� ��������.";
		TEXT_SchnellerHering_Setting2 = NAME_Duration;
		COUNT_SchnellerHering_Setting = Time_SchnellerHering / 60000;
	};*/
};

