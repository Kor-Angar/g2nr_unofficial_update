
const int SPL_Cost_Charm = 50;
const int SPL_Damage_Charm = 0;

instance Spell_Charm(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectRange = 1000;
	damage_per_level = SPL_Damage_Charm;
	damagetype = DAM_MAGIC;
};


func int Spell_Logic_Charm(var int manaInvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)) || (self.attribute[ATR_MANA] >= SPL_Cost_Charm))
	{
		if(Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Ignaz))
		{
			if((other.aivar[AIV_NpcSawPlayerCommit] != CRIME_NONE) && (MIS_Ignaz_Charm == LOG_Running))
			{
				if(Charm_Test == FALSE)
				{
					B_LogEntry(TOPIC_Ignaz,"�������, ���������� ���������! �, ������, �������� ��� ����������.");
				};
				Charm_Test = TRUE;
			};
			B_DeletePetzCrime(other);
			other.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
			other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
			if(Wld_GetGuildAttitude(other.guild,self.guild) != ATT_HOSTILE)
			{
				if(Npc_GetAttitude(other,self) == ATT_HOSTILE)
				{
					Npc_SetTempAttitude(other,Wld_GetGuildAttitude(other.guild,self.guild));
				};
			};
		};
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Canthar)) && (other.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
		{
			other.aivar[AIV_LastFightComment] = TRUE;
		};
		/*if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_431_Kardif)) && (Kardif_Beaten == TRUE))
		{
			Kardif_Beaten = FALSE;
		};
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Halvor)) && (Halvor_Beaten == TRUE))
		{
			Halvor_Beaten = FALSE;
		};
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(VLK_476_Fenia)) && (Fenia_Beaten == TRUE))
		{
			Fenia_Beaten = FALSE;
		};
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Brahim)) && (Brahim_Beaten == TRUE))
		{
			Brahim_Beaten = FALSE;
		};
		if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Ignaz)) && (Ignaz_Beaten == TRUE))
		{
			Ignaz_Beaten = FALSE;
		};*/
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Charm()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Charm;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

