
// ������������ �������.
/*func void ZS_Bandit()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Bandit_Loop()
{
	var int random;
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(!Npc_IsOnFP(self,"CAMPFIRE") && Wld_IsFPAvailable(self,"CAMPFIRE"))
		{
			AI_GotoFP(self,"CAMPFIRE");
			AI_AlignToFP(self);
			AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
		}
		else if(!Npc_IsOnFP(self,"STAND") && Wld_IsFPAvailable(self,"STAND"))
		{
			AI_GotoFP(self,"STAND");
			AI_AlignToFP(self);
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		}
		else
		{
			AI_AlignToWP(self);
			AI_PlayAni(self,"T_STAND_2_HGUARD");
		};
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && !C_BodyStateContains(self,BS_SIT))
	{
		random = Hlp_Random(3);
		if(random == 0)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Bandit_End()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
	}
	else
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
	};
};*/

// ����� �������.
func void ZS_Bandit()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Bandit_Loop()
{
	// ����� "�� �������".
	if(self.aivar[AIV_TAPOSITION] == ISINPOS)
	{
		// ������ �� �����.
		if(!C_BodyStateContains(self,BS_SIT))
		{
			// ����� �������� ������� -> ������������ ��������, ��������� ������ �������� �������.
			if(Npc_GetStateTime(self) > self.aivar[AIV_STATETIME])
			{
				AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
				self.aivar[AIV_STATETIME] = Hlp_Random(100)%6 + 6; // �� 6 �� 11 ������. ����� ��������� ���������� ���������� �������.
				Npc_SetStateTime(self,0);
			};
		};
		
		AI_Wait(self,1);
		return LOOP_CONTINUE;
	};
	
	// ���������� �� ����� ���������� ���������� ��������� 5� -> ���� � ������ ���������.
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		return LOOP_CONTINUE;
	};
	
	// ���������� ������� �������� "CAMPFIRE" -> ������� ���������, ������������ �������� ���������� �� �����.
	if(Wld_IsFPAvailable(self,"CAMPFIRE"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoFP(self,"CAMPFIRE");
		//AI_AlignToFP(self); // ��� ������� ������������� ���������� � ����� ���������� ������� AI_GotoFP. �� ���� �� ����� ��������������, �������������� ��� �������.
		AI_Wait(self,0.5);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
		
		// ������� � ����� "�� �������".
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		Npc_SetStateTime(self,0);
		return LOOP_CONTINUE;
	};
	
	// �������������� ��������� �������� ������� �������� ������� ����� ����������.
	self.aivar[AIV_STATETIME] = Hlp_Random(100)%4 + 4; // �� 4 �� 7 ������.
	
	// ���������� ������� �������� "STAND" -> ������� ���������, ������������ ��������.
	if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoFP(self,"STAND");
		//AI_AlignToFP(self); // ��� ������� ������������� ���������� � ����� ���������� ������� AI_GotoFP. �� ���� �� ����� ��������������, �������������� ��� �������.
		AI_SetWalkMode(self,NPC_RUN);
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		
		// ������� � ����� "�� �������".
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		Npc_SetStateTime(self,0);
		return LOOP_CONTINUE;
	};
	
	// ���������� ��� ��������� ���������� "CAMPFIRE" ��� "STAND" -> ������������ �� ���������, ������������ ��������.
	AI_AlignToWP(self);
	AI_SetWalkMode(self,NPC_RUN);
	AI_Wait(self,0.5);
	AI_PlayAni(self,"T_STAND_2_HGUARD");
	
	// ������� � ����� "�� �������".
	self.aivar[AIV_TAPOSITION] = ISINPOS;
	Npc_SetStateTime(self,0);
	return LOOP_CONTINUE;
};

func void ZS_Bandit_End()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
	}
	else
	{
		AI_PlayAni(self,"T_HGUARD_2_STAND");
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_STATETIME] = 0;
};
