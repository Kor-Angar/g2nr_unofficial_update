
func void ZS_Dead()
{
	var C_Item readyweap;
	readyweap = Npc_GetReadiedWeapon(other);
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StopLookAt(self);
	AI_StopPointAt(self);
	B_GiveDeathXP(other,self);
	if(C_IAmCanyonRazor(self))
	{
		CanyonRazorBodyCount += 1;
		if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
		{
			B_CountCanyonRazor();
		};
	};
	if(Greg_Rejected == TRUE)
	{
		if(C_AmIDexterBandit(self))
		{
			DexterBanditsBodyCount += 1;
			if(DexterBanditsBodyCount >= 19)
			{
				B_Greg_ComesToDexterLater();
			};
		};
	}
	else
	{
		B_Greg_ComesToDexter();
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if(Npc_GetDistToNpc(self,other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= 50;
//			B_MagicHurtNpc(self,other,50);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DiegoOW))
	{
		Diego_IsDead = TRUE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skip))
	{
		if(MIS_ADDON_SkipsGrog == LOG_Running)
		{
			MIS_ADDON_SkipsGrog = LOG_OBSOLETE;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Brandon))
	{
		if(MIS_Brandon_BringHering == LOG_Running)
		{
			MIS_Brandon_BringHering = LOG_OBSOLETE;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kervo))
	{
		if(MIS_Kervo_KillLurker == LOG_Running)
		{
			MIS_Kervo_KillLurker = LOG_FAILED;
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Stoneguardian_NailedValleyShowcase_01))
	{
		if((MayaScrollGiven == FALSE) && (Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0))
		{
			CreateInvItems(self,ItSc_Teleport_Maya,1);
			MayaScrollGiven = TRUE;
		};
	};
	if((self.guild == GIL_GOBBO) || (self.guild == GIL_GOBBO_SKELETON) || (self.guild == GIL_SUMMONED_GOBBO_SKELETON))
	{
		Npc_RemoveInvItems(self,ItMw_1h_Bau_Mace,Npc_HasItems(self,ItMw_1h_Bau_Mace));
		Npc_RemoveInvItems(self,ItMw_1h_MISC_Sword,Npc_HasItems(self,ItMw_1h_MISC_Sword));
		Npc_RemoveInvItems(self,ItMw_1h_Misc_Axe,Npc_HasItems(self,ItMw_1h_Misc_Axe)); 
	};
	if(self.guild == GIL_SUMMONED_SKELETON)
	{
		Npc_RemoveInvItems(self,ItMw_2H_Sword_M_01,Npc_HasItems(self,ItMw_2H_Sword_M_01));
	};
	if(Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;
		if(C_DropUnconscious())
		{
			MadKillerCount += 1;
		};
		if((self.guild == GIL_GIANT_BUG) && (MIS_Fester_KillBugs == LOG_Running))
		{
			Festers_Giant_Bug_Killed += 1;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Swamprat)) && (MIS_KrokoJagd == LOG_Running))
		{
			AlligatorJack_KrokosKilled += 1;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ramon))
		{
			Player_HasTalkedToBanditCamp = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Franco))
		{
			if(MIS_HlpLogan == LOG_Running)
			{
				MIS_HlpLogan = LOG_OBSOLETE;
			};
			if(MIS_HlpEdgor == LOG_Running)
			{
				MIS_HlpEdgor = LOG_OBSOLETE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Fortuno))
		{
			Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_OBSOLETE);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GoldMinecrawler))
	{
		Minecrawler_Killed += 1;
		if((Minecrawler_Killed > 9) && (Bloodwyn_Spawn == FALSE) && !Npc_IsDead(Bloodwyn))
		{
			AI_Teleport(Bloodwyn,"ADW_MINE_TO_MC_03");
			B_StartOtherRoutine(Bloodwyn,"MINE");
			Bloodwyn_Spawn = TRUE;
		};
	};
	/*if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IceDragon))
	{
		if(!Npc_IsDead(IceGolem_Sylvio1) || !Npc_IsDead(IceGolem_Sylvio2))
		{
			IceGolem_Sylvio1.flags = 0;
			IceGolem_Sylvio2.flags = 0;
		};
	};*/
	B_GiveTradeInv(self);
	B_GiveDeathInv(self);
	B_ClearRuneInv(self);
	B_ClearSmithInv(self);
	B_ClearAlchemyInv(self);
	B_ClearBonusFoodInv(self);
	B_ClearJunkInv(self);
	B_DeletePetzCrime(self);
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	AI_UnequipWeapons(self);
	self.aivar[AIV_TAPOSITION] = ISINPOS;
	if(readyweap.munition == ItRw_Addon_FireArrow)
	{
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_Firestorm_SPREAD",self,self,0,0,0,FALSE);
		if(Npc_GetDistToNpc(self,other) <= 600)
		{
			Wld_PlayEffect("VOB_MAGICBURN",other,other,0,0,0,FALSE);
			if(other.protection[PROT_FIRE] < 40)
			{
				if((other.attribute[ATR_HITPOINTS] + other.protection[PROT_FIRE] - 40) >= 0)
				{
					other.attribute[ATR_HITPOINTS] -= (40 - other.protection[PROT_FIRE]);
				}
				else
				{
					other.attribute[ATR_HITPOINTS] = 0;
				};
			};
			if(other.attribute[ATR_HITPOINTS] <= 0)
			{
				AI_PlayAni(other,"T_DEAD");
			};
		};
	};
};

func int ZS_Dead_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == ISINPOS)
	{
		B_DragonKillCounter(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
	return LOOP_CONTINUE;
};

