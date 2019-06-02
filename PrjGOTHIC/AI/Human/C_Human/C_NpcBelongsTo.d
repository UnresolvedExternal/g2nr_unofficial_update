
func int C_NpcBelongsToOldCamp(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_OCMAIN) || (slf.npcType == NPCTYPE_OCAMBIENT))
	{
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_NpcBelongsToCity(var C_Npc slf)
{
	if(!C_NpcBelongsToOldCamp(slf))
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sergio))
		{
			return FALSE;
		};
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_NpcBelongsToMonastery(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sergio))
	{
		return TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Jorgen)) && (EnterNW_Kapitel4 == TRUE) && (JorgenMovedFromKloster == FALSE))
	{
		return TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vino)) && (DIA_Vino_Heilung_oneTime == TRUE))
	{
		return TRUE;
	};
	if((slf.guild == GIL_KDF) || (slf.guild == GIL_NOV))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_CommentMonasteryCrimes(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Pyrokar))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Isgaroth)) && (NOV_Aufnahme == FALSE))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_NpcBelongsToFarm(var C_Npc slf)
{
	if((slf.guild == GIL_BAU) || (slf.guild == GIL_SLD))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_NpcBelongsToBL(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_BL_AMBIENT) || (slf.npcType == NPCTYPE_BL_MAIN))
	{
		return TRUE;
	};
	return FALSE;
};

