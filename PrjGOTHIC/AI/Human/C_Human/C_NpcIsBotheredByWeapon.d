
func int C_NpcIsBotheredByWeapon(var C_Npc slf,var C_Npc oth)
{
	if(slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return FALSE;
	};
	if(slf.guild == GIL_FRIENDLY_ORC)
	{
		return FALSE;
	};
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(oth))
	{
		return FALSE;
	};
	if(C_NpcIsToughGuy(slf) && (Npc_IsInFightMode(oth,FMODE_MELEE) || Npc_IsInFightMode(oth,FMODE_FAR)))
	{
		return FALSE;
	};
	if(Npc_GetAttitude(slf,oth) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Salandril)) && Npc_KnowsInfo(hero,DIA_Salandril_GehinsKloster))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDTWache) && !Npc_KnowsInfo(hero,DIA_1061_Wache_Hallo))
	{
		return FALSE;
	};
	if(Npc_IsInFightMode(oth,FMODE_FIST))
	{
		return FALSE;
	};
	if(Npc_IsInFightMode(oth,FMODE_MAGIC) && (Npc_GetActiveSpellCat(oth) != SPELL_BAD))
	{
		return FALSE;
	};
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_ORC))
	{
		return FALSE;
	};
	return TRUE;
};

