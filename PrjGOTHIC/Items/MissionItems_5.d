
instance ItWr_XardasLetterToOpenBook_MIS(C_Item)
{
	name = "������ ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasLetterToOpenBook;
	scemeName = "MAP";
	description = name;
};


func void Use_XardasLetterToOpenBook()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� �������, ��� ���� �� �������� � ������ �������� ������� ���������� ���.");
	Doc_PrintLines(nDocID,0,"� ��������.");
	Doc_PrintLines(nDocID,0,"���� ��� ������ ���, ��� � �����������, �� ������ ������ ������ ������� ��������.");
	Doc_PrintLines(nDocID,0,"� �����, ��� �� ����� ��������, ���������� ��� ����������� ���� �����.");
	Doc_PrintLines(nDocID,0,"� ������ ��� ����������, ������ ������ ��� ������ ���������� ��.");
	Doc_PrintLines(nDocID,0,"�� ������ ������� �� ����!");
	Doc_PrintLines(nDocID,0,"��� ����� ��������� ����� '����� ��������'. ������ �� ������ �� ����!");
	Doc_PrintLines(nDocID,0,"� ���� ������ ���� ����� ������ ����.");
	Doc_PrintLines(nDocID,0,"� �� ����� ������ ���� � ����� ��������� ������. ������ �� ������ ���������� �������� ���.");
	Doc_PrintLines(nDocID,0,"�� ��� ����������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                             �������");
	Doc_Show(nDocID);
	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"� ���� ������ ������� ������� ��� �����, ����������� ����� ������� ��������.");
		MIS_Xardas_SCCanOpenIrdorathBook = TRUE;
	};
};


instance ItKe_MonastarySecretLibrary_Mis(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
//	visual = "ItKe_Key_02.3ds";
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�� ����� '������� ��������'.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};

instance ItWr_HallsofIrdorath_Mis(C_Item)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
//	visual = "ItWr_Book_02_05.3ds";
	visual = "ItWr_Book_03_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
//	text[5] = NAME_Value;
//	count[5] = value;
	on_state[0] = Use_HallsofIrdorath;
};


func void Use_HallsofIrdorath()
{
	if(MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
	{
		B_Say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,ItWr_HallsofIrdorath_Open_Mis,1);
		CreateInvItems(hero,ItKe_MonastarySecretLibrary_Mis,1);
		CreateInvItems(hero,ItWr_UseLampIdiot_Mis,1);
		Print(PRINT_IrdorathBookHiddenKey);
		B_GivePlayerXP(XP_HallsofIrdorathIsOpen);
		ItWr_HallsofIrdorathIsOpen = TRUE;
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"� ���� ������� ����� ��������. � ��� ���������� ��������� ��������� � �������� ����. ��� �����, ��� ��� ����� ����� � � ������������ ��������.");
	}
	else
	{
		CreateInvItems(hero,ItWr_HallsofIrdorath_Mis,1);
		Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ItWr_HallsofIrdorath_Open_Mis(C_Item)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
//	visual = "ItWr_Book_02_05.3ds";
	visual = "ItWr_Book_03_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
//	text[5] = NAME_Value;
//	count[5] = value;
	on_state[0] = Use_HallsofIrdorath_Open;
};


func void Use_HallsofIrdorath_Open()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_MAGE_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_MAGE_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... � � ������ ���� � ���������� ��������� ������, ����� �������� ��� ������ � ������ �������.");
	Doc_PrintLines(nDocID,0,"���� �� ��� ������ ������ �� ���� �������, ��� ������, ��������, ���������� �� ��.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"� ������ ��� ����� ������ ��, ��� ��� ����� �����-�� ������������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"�� ������ ������, � ������ ���������� ���� �������� ��� ����������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"���� ���� ��������� ��������� �����.");
	Doc_Show(nDocID);
	if(ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"� ������ ����� ��������. � ��� ����������� ��������� ����������. ��� ������ ���� ���-�� �����, � �������� ���������.");
		ItWr_SCReadsHallsofIrdorath = TRUE;
	};
};


instance ItWr_XardasSeamapBook_Mis(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
//	text[5] = NAME_Value;
//	count[5] = value;
	on_state[0] = Use_XardasSeamapBook_Mis;
};


func void Use_XardasSeamapBook_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"... ������ � ����� ������, ��� ������, � ������� ���� ���� - ������� ��������. ��� ��������� �� �������, �������� �� ������ ��������. ������� ������� � ���� ������ ������ �������� ...");
	Doc_PrintLine(nDocID,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(nDocID,0,"... ��� ��� �������, ���, ������, ��� ���� ���� �� �������� ��� ����-������. ��� ���������� �������� ����� ������, � � ���� ����� ������ ����������. ���� �� ��� ����� � ��� ����. ��� �������� ������ ���������, ��� ������ �� ����������� ��� ����������� ����� ...");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"... ���������� �������, ������, �� �� ��� �� ���������. � ����� ��� ������� � ��������� ��� ���� � ������ �������. ����� � ��� ����� ������� ������ �������. � ������ ���� ������������, ����������� ������������� ����. ���������� �� ����������� �� ��������� � ���������, ��� ��������� ������ ����� �� ...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(nDocID,0,"... � �������� ���� �������� ���������� ���������! ����� ��������� ������, ��� ����������� ��� ������, ������� �� ������ ������������. ������ ��� ����� �����. ��� ������� ��������� ��������� ������ ����������, ������� � ������� �����, �� ������ ������.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"� �������, ��� ��������� ����� �������� �� ����� �����, ������� � ������� � ���� ��������� ���������� ��� ����.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... ������ � ������. �� �� ����� ����������� ������. ��� ������ ������ �����������, ��� ���������� �����, �� ���������� � ���������� ����� ������ ��������� ����� � ���� ����. � ������ ����� ����������, ����� ��� ���� �����.");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(nDocID,0,"... � ����� �����, ����� �� ������ ����. ������, ������ � ���� ���� ���������������� ��� ��������. ��� ������ ����, ������, ���������� ��. ��������� ������, � ��� ���������� ��������� � ������ �����. ��� ����� ����� ��� ��� ���, �� �� �����, ������, ��� ������.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"� �� �� ���� ������, ����� ���� � ��������� �� ���, ��� ������ ����� ������ ���� � ���� ����.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... � ������ ������� �������� � ����� � ���, ��� ������� ����������� ������ ������� ����������� ��������. ������, � ������� �� ����, ��� ��������� ����������� �����������. � ������� ������ � ���������, ���, �� ������ ������. ��� �����, ����� ����� �������� � ����� ������� - ����� ����, ���� ��������.");
	};
	Doc_Show(nDocID);
};


instance ItWr_UseLampIdiot_Mis(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItWr_UseLampIdiot_Mis;
	scemeName = "MAP";
	description = name;
	text[0] = "�� ����� '������� ��������'.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItWr_UseLampIdiot_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"               ����� ����� ����");
	Doc_PrintLine(nDocID,0,"               ������ �������.");
/*	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");	*/
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Seamap_Irdorath(C_Item)
{
	name = "������� ����� ������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
//	visual = "ItWr_Map_01.3DS";
	visual = "ItWr_Map_DI.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Seamap_Irdorath;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Seamap_Irdorath()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(nDocID);
	if((MIS_ShipIsFree == FALSE) && (Kapitel < 6))
	{
		B_Say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if(MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic(Topic_Ship,LOG_MISSION);
		Log_SetTopicStatus(Topic_Ship,LOG_Running);
		B_LogEntry(Topic_Ship,"������, � ������ ��������� �� ����� ��������� ���������� �������. �� ��� ����� ��� ����� �������, ������� � �������.");
		B_GivePlayerXP(XP_SCKnowsWayToIrdorath);
		MIS_SCKnowsWayToIrdorath = TRUE;
	};
};


instance ITWr_ForgedShipLetter_MIS(C_Item)
{
	name = "����������� �������������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseITWr_ForgedShipLetter_MIS;
	scemeName = "MAP";
	description = name;
	text[0] = "������ � ������������� ����������";
	text[1] = "�� ������������ �������� ���������.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseITWr_ForgedShipLetter_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������������� ����������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"���� �������� �������� ������������ ������ �������� ������������� ����������� ������� ������� ����� ������ � ������� ��������������� ������� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    ����������� ������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItKe_OC_MainGate_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� �� ����� ������� �����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Ship_Levelchange_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� �� ����������� �����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
//	visual = "ItMi_Flask.3ds";
	visual = "ItPo_Special_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "����� ������";
	text[1] = PRINT_UnknownEffect;
//	text[1] = "???";
//	count[1] = Mana_Essenz;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_PotionOfDeath()
{
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		Npc_ChangeAttribute(self,ATR_STRENGTH,5);
		self.aivar[REAL_STRENGTH] += 5;
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
		self.aivar[REAL_DEXTERITY] += 5;
		PrintScreen(PRINT_LearnSTR5,-1,43,FONT_Screen,2);
		PrintScreen(PRINT_LearnDEX5,-1,48,FONT_Screen,2);
		PrintScreen(PRINT_FullyHealed,-1,53,FONT_Screen,2);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",Time_Speed);
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};


instance ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
//	visual = "ItMi_Flask.3ds";
	visual = "ItPo_Special_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "����� ������";
	text[0] = "��� ����� �������� ����� ���� ������� �������������.";
	text[1] = "����� ������ ��������� ���, ������ ���� ������.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAm_AmulettOfDeath_Mis(C_Item)
{
	name = "������������ ���� ������";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
//	visual = "ItAm_Prot_Fire_01.3ds";
	visual = "ItAm_AmulettOfDeath_Mis.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip = UnEquip_ItAm_AmulettOfDeath_Mis;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
//	text[2] = "���� ������ �������� ���������";
//	text[3] = "�� ���� ���� �����.";
	text[0] = "���� ������ �������� ��������� �� ���� ���� �����.";
	text[1] = NAME_Prot_Edge;
	count[1] = 30;
	text[2] = NAME_Prot_Point;
	count[2] = 30;
	text[3] = NAME_Prot_Fire;
	count[3] = 30;
	text[4] = NAME_Prot_Magic;
	count[4] = 30;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] += 30;
	self.protection[PROT_BLUNT] += 30;
	self.protection[PROT_POINT] += 30;
	self.protection[PROT_FIRE] += 30;
	self.protection[PROT_MAGIC] += 30;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void UnEquip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] -= 30;
	self.protection[PROT_BLUNT] -= 30;
	self.protection[PROT_POINT] -= 30;
	self.protection[PROT_FIRE] -= 30;
	self.protection[PROT_MAGIC] -= 30;
};


instance ItPo_HealRandolph_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealRandolph;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "��������� �� ��������";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void Use_HealRandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};

