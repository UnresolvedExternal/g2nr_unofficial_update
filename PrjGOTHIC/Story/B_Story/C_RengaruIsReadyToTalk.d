
func int C_RengaruIsReadyToTalk()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	}
	else if(Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB))
	{
		if(Bote_Killed == TRUE)
		{
			if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_POOR_AREA_PATH_01_03") <= 700)
			{
				return TRUE;
			};
		}
		else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_05_01") <= 700)
		{
			return TRUE;
		};
	};
	return FALSE;
};

