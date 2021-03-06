
const int SPL_Cost_SummonGolem = 80;

instance Spell_SummonGolem(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
};


func int Spell_Logic_SummonGolem(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_SummonGolem)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonGolem()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_SummonGolem;
	};
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))
	{
		Wld_StopEffect("SLOW_MOTION");
		Wld_SpawnNpcRange(self,Summoned_Golem,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,StoneGolem,1,500);
	};
};

