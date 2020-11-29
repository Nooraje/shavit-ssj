#include <sdktools>
#include <sdkhooks>
#include <clientprefs>

#undef REQUIRE_PLUGIN
#include <shavit>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo =
{
	name = "SSJ: Advanced",
	author = "AlkATraZ",
	description = "Strafe gains/efficiency etc. // Edited by Nairda to work with shavit's timer",
	version = SHAVIT_VERSION,
	url = "https://forums.alliedmods.net/showthread.php?t=287039"
}

#define BHOP_FRAMES 10

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
Handle g_hCookieEnabled = null;
Handle g_hCookieUsageMode = null;
Handle g_hCookieUsageRepeat = null;
Handle g_hCookieCurrentSpeed = null;
Handle g_hCookieFirstJump = null;
Handle g_hCookieHeightDiff = null;
Handle g_hCookieGainStats = null;
Handle g_hCookieEfficiency = null;
Handle g_hCookieTime = null;
Handle g_hCookieDeltaTime = null;
Handle g_hCookieStrafeSync = null;
Handle g_hCookieDefaultsSet = null;

bool g_bUsageRepeat[MAXPLAYERS + 1];
bool g_bEnabled[MAXPLAYERS + 1] =  { true, ... };
bool g_bCurrentSpeed[MAXPLAYERS + 1] =  { true, ... };
bool g_bFirstJump[MAXPLAYERS + 1] =  { true, ... };
bool g_bHeightDiff[MAXPLAYERS + 1];
bool g_bGainStats[MAXPLAYERS + 1] =  { true, ... };
bool g_bEfficiency[MAXPLAYERS + 1];
bool g_bTime[MAXPLAYERS + 1];
bool g_bDeltaTime[MAXPLAYERS + 1];
bool g_bStrafeSync[MAXPLAYERS + 1];
bool g_bTouchesWall[MAXPLAYERS + 1];

int g_iUsageMode[MAXPLAYERS + 1];
int g_iTickCount[MAXPLAYERS + 1];
int g_iTicksOnGround[MAXPLAYERS + 1];
int g_iTouchTicks[MAXPLAYERS + 1];
int g_iStrafeTick[MAXPLAYERS + 1];
int g_iSyncedTick[MAXPLAYERS + 1];
int g_iJump[MAXPLAYERS + 1];
int g_iOldSSJTarget[MAXPLAYERS + 1];
int g_iButtonCache[MAXPLAYERS + 1];

float g_fInitialHeight[MAXPLAYERS + 1];
float g_fOldHeight[MAXPLAYERS + 1];
float g_fOldSpeed[MAXPLAYERS + 1];
float g_fRawGain[MAXPLAYERS + 1];
float g_fTrajectory[MAXPLAYERS + 1];
float g_fTraveledDistance[MAXPLAYERS + 1][3];
float g_fSpeedLoss[MAXPLAYERS + 1];
float g_fOldVelocity[MAXPLAYERS + 1];
float g_fTickrate = 0.01;
=======
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
Handle gH_CookieEnabled = null;
Handle gH_CookieUsageMode = null;
Handle gH_CookieUsageRepeat = null;
Handle gH_CookieCurrentSpeed = null;
Handle gH_CookieFirstJump = null;
Handle gH_CookieHeightDiff = null;
Handle gH_CookieGainStats = null;
Handle gH_CookieEfficiency = null;
Handle gH_CookieStrafeSync = null;
Handle gH_CookieDefaultsSet = null;

int gI_UsageMode[MAXPLAYERS+1];
bool gB_UsageRepeat[MAXPLAYERS+1];
bool gB_Enabled[MAXPLAYERS+1] = {true, ...};
bool gB_CurrentSpeed[MAXPLAYERS+1] = {true, ...};
bool gB_FirstJump[MAXPLAYERS+1] = {true, ...};
bool gB_HeightDiff[MAXPLAYERS+1];
bool gB_GainStats[MAXPLAYERS+1] = {true, ...};
bool gB_Efficiency[MAXPLAYERS+1];
bool gB_StrafeSync[MAXPLAYERS+1];
bool gB_TouchesWall[MAXPLAYERS+1];

int gI_TicksOnGround[MAXPLAYERS+1];
int gI_TouchTicks[MAXPLAYERS+1];
int gI_StrafeTick[MAXPLAYERS+1];
int gI_SyncedTick[MAXPLAYERS+1];
int gI_Jump[MAXPLAYERS+1];
int gI_StrafeCount[MAXPLAYERS+1];
int gI_OldSSJTarget[MAXPLAYERS+1];
int gI_ButtonCache[MAXPLAYERS+1];

float gF_InitialHeight[MAXPLAYERS+1];
float gF_OldHeight[MAXPLAYERS+1];
float gF_OldSpeed[MAXPLAYERS+1];
float gF_RawGain[MAXPLAYERS+1];
float gF_Trajectory[MAXPLAYERS+1];
float gF_TraveledDistance[MAXPLAYERS+1][3];
float gF_SpeedLoss[MAXPLAYERS+1];
float gF_OldVelocity[MAXPLAYERS+1];

float gF_Tickrate = 0.01;
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp

// misc settings
bool gB_Late = false;
bool gB_Shavit = false;
EngineVersion gEV_Type = Engine_Unknown;

chatstrings_t gS_ChatStrings;

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	gB_Late = late;

	return APLRes_Success;
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_ssj", Command_SSJ, "Open the Speed @ Sixth Jump menu.");

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	g_hCookieEnabled = RegClientCookie("ssj_enabled", "ssj_enabled", CookieAccess_Public);
	g_hCookieUsageMode = RegClientCookie("ssj_displaymode", "ssj_displaymode", CookieAccess_Public);
	g_hCookieUsageRepeat = RegClientCookie("ssj_displayrepeat", "ssj_displayrepeat", CookieAccess_Public);
	g_hCookieCurrentSpeed = RegClientCookie("ssj_currentspeed", "ssj_currentspeed", CookieAccess_Public);
	g_hCookieFirstJump = RegClientCookie("ssj_firstjump", "ssj_firstjump", CookieAccess_Public);
	g_hCookieHeightDiff = RegClientCookie("ssj_heightdiff", "ssj_heightdiff", CookieAccess_Public);
	g_hCookieGainStats = RegClientCookie("ssj_gainstats", "ssj_gainstats", CookieAccess_Public);
	g_hCookieEfficiency = RegClientCookie("ssj_efficiency", "ssj_efficiency", CookieAccess_Public);
	g_hCookieTime = RegClientCookie("ssj_time", "ssj_time", CookieAccess_Public);
	g_hCookieDeltaTime = RegClientCookie("ssj_deltatime", "ssj_deltatime", CookieAccess_Public);
	g_hCookieStrafeSync = RegClientCookie("ssj_strafesync", "ssj_strafesync", CookieAccess_Public);
	g_hCookieDefaultsSet = RegClientCookie("ssj_defaults", "ssj_defaults", CookieAccess_Public);
=======
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
	gH_CookieEnabled = RegClientCookie("ssj_enabled", "ssj_enabled", CookieAccess_Public);
	gH_CookieUsageMode = RegClientCookie("ssj_displaymode", "ssj_displaymode", CookieAccess_Public);
	gH_CookieUsageRepeat = RegClientCookie("ssj_displayrepeat", "ssj_displayrepeat", CookieAccess_Public);
	gH_CookieCurrentSpeed = RegClientCookie("ssj_currentspeed", "ssj_currentspeed", CookieAccess_Public);
	gH_CookieFirstJump = RegClientCookie("ssj_firstjump", "ssj_firstjump", CookieAccess_Public);
	gH_CookieHeightDiff = RegClientCookie("ssj_heightdiff", "ssj_heightdiff", CookieAccess_Public);
	gH_CookieGainStats = RegClientCookie("ssj_gainstats", "ssj_gainstats", CookieAccess_Public);
	gH_CookieEfficiency = RegClientCookie("ssj_efficiency", "ssj_efficiency", CookieAccess_Public);
	gH_CookieStrafeSync = RegClientCookie("ssj_strafesync", "ssj_strafesync", CookieAccess_Public);
	gH_CookieDefaultsSet = RegClientCookie("ssj_defaults", "ssj_defaults", CookieAccess_Public);
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp

	HookEvent("player_jump", Player_Jump);

	for (int i = 1; i <= MaxClients; i++)
	{
		if(IsClientInGame(i))
		{
			OnClientPutInServer(i);
			OnClientCookiesCached(i);
		}
	}

	if(gB_Late)
	{
		Shavit_OnChatConfigLoaded();
	}

	gB_Shavit = LibraryExists("shavit");
	gEV_Type = GetEngineVersion();
}

stock bool IsValidClientIndex(int client)
{
	return (0 < client <= MaxClients);
}

public void OnLibraryAdded(const char[] name)
{
	if(StrEqual(name, "shavit"))
	{
		gB_Shavit = true;
	}
}

public void OnLibraryRemoved(const char[] name)
{
	if(StrEqual(name, "shavit"))
	{
		gB_Shavit = false;
	}
}

public void OnMapStart()
{
	gF_Tickrate = GetTickInterval();
}

public void Shavit_OnChatConfigLoaded()
{
	Shavit_GetChatStrings(sMessagePrefix, gS_ChatStrings.sPrefix, sizeof(chatstrings_t::sPrefix));
	Shavit_GetChatStrings(sMessageText, gS_ChatStrings.sText, sizeof(chatstrings_t::sText));
	Shavit_GetChatStrings(sMessageWarning, gS_ChatStrings.sWarning, sizeof(chatstrings_t::sWarning));
	Shavit_GetChatStrings(sMessageVariable, gS_ChatStrings.sVariable, sizeof(chatstrings_t::sVariable));
	Shavit_GetChatStrings(sMessageVariable2, gS_ChatStrings.sVariable2, sizeof(chatstrings_t::sVariable2));
	Shavit_GetChatStrings(sMessageStyle, gS_ChatStrings.sStyle, sizeof(chatstrings_t::sStyle));
}

public void OnClientCookiesCached(int client)
{
	char sCookie[8];

	GetClientCookie(client, gH_CookieDefaultsSet, sCookie, 8);

	if(StringToInt(sCookie) == 0)
	{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
		SetCookie(client, g_hCookieEnabled, true);
		SetCookie(client, g_hCookieUsageMode, 6);
		SetCookie(client, g_hCookieUsageRepeat, false);
		SetCookie(client, g_hCookieCurrentSpeed, true);
		SetCookie(client, g_hCookieFirstJump, true);
		SetCookie(client, g_hCookieHeightDiff, false);
		SetCookie(client, g_hCookieGainStats, true);
		SetCookie(client, g_hCookieEfficiency, false);
		SetCookie(client, g_hCookieTime, false);
		SetCookie(client, g_hCookieDeltaTime, false);
		SetCookie(client, g_hCookieStrafeSync, false);
		SetCookie(client, g_hCookieDefaultsSet, true);
=======
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
		SetCookie(client, gH_CookieEnabled, true);
		SetCookie(client, gH_CookieUsageMode, 6);
		SetCookie(client, gH_CookieUsageRepeat, false);
		SetCookie(client, gH_CookieCurrentSpeed, true);
		SetCookie(client, gH_CookieFirstJump, true);
		SetCookie(client, gH_CookieHeightDiff, false);
		SetCookie(client, gH_CookieGainStats, true);
		SetCookie(client, gH_CookieEfficiency, false);
		SetCookie(client, gH_CookieStrafeSync, false);

		SetCookie(client, gH_CookieDefaultsSet, true);
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
	}

	GetClientCookie(client, gH_CookieEnabled, sCookie, 8);
	gB_Enabled[client] = view_as<bool>(StringToInt(sCookie));
<<<<<<< HEAD

	GetClientCookie(client, gH_CookieUsageMode, sCookie, 8);
	gI_UsageMode[client] = StringToInt(sCookie);

	GetClientCookie(client, gH_CookieUsageRepeat, sCookie, 8);
	gB_UsageRepeat[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieCurrentSpeed, sCookie, 8);
	gB_CurrentSpeed[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieFirstJump, sCookie, 8);
	gB_FirstJump[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieHeightDiff, sCookie, 8);
	gB_HeightDiff[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieGainStats, sCookie, 8);
	gB_GainStats[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieEfficiency, sCookie, 8);
	gB_Efficiency[client] = view_as<bool>(StringToInt(sCookie));
<<<<<<< HEAD

<<<<<<< HEAD
	GetClientCookie(client, g_hCookieTime, sCookie, 8);
	g_bTime[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, g_hCookieDeltaTime, sCookie, 8);
	g_bDeltaTime[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, g_hCookieStrafeSync, sCookie, 8);
	g_bStrafeSync[client] = view_as<bool>(StringToInt(sCookie));
=======
	GetClientCookie(client, gH_CookieStrafeSync, sCookie, 8);
	gB_StrafeSync[client] = view_as<bool>(StringToInt(sCookie));
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======

	GetClientCookie(client, gH_CookieStrafeSync, sCookie, 8);
	gB_StrafeSync[client] = view_as<bool>(StringToInt(sCookie));
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======

	GetClientCookie(client, gH_CookieUsageMode, sCookie, 8);
	gI_UsageMode[client] = StringToInt(sCookie);

	GetClientCookie(client, gH_CookieUsageRepeat, sCookie, 8);
	gB_UsageRepeat[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieCurrentSpeed, sCookie, 8);
	gB_CurrentSpeed[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieFirstJump, sCookie, 8);
	gB_FirstJump[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieHeightDiff, sCookie, 8);
	gB_HeightDiff[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieGainStats, sCookie, 8);
	gB_GainStats[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieEfficiency, sCookie, 8);
	gB_Efficiency[client] = view_as<bool>(StringToInt(sCookie));

	GetClientCookie(client, gH_CookieStrafeSync, sCookie, 8);
	gB_StrafeSync[client] = view_as<bool>(StringToInt(sCookie));
>>>>>>> parent of 2189617... Update shavit-ssj.sp
}

public void OnClientPutInServer(int client)
{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	g_iJump[client] = 0;
	g_iStrafeTick[client] = 0;
	g_iSyncedTick[client] = 0;
	g_fRawGain[client] = 0.0;
	g_fOldHeight[client] = 0.0;
	g_fOldSpeed[client] = 0.0;
	g_fTrajectory[client] = 0.0;
	g_fTraveledDistance[client] = NULL_VECTOR;
	g_iTicksOnGround[client] = 0;
	g_iOldSSJTarget[client] = 0;
	g_iTickCount[client] = 0;
=======
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
	gI_Jump[client] = 0;
	gI_StrafeTick[client] = 0;
	gI_SyncedTick[client] = 0;
	gF_RawGain[client] = 0.0;
	gF_OldHeight[client] = 0.0;
	gF_OldSpeed[client] = 0.0;
	gF_Trajectory[client] = 0.0;
	gF_TraveledDistance[client] = NULL_VECTOR;
	gI_TicksOnGround[client] = 0;
	gI_StrafeCount[client] = 0;
	gI_OldSSJTarget[client] = 0;
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp

	SDKHook(client, SDKHook_Touch, OnTouch);
}

public Action OnTouch(int client, int entity)
{
	if ((GetEntProp(entity, Prop_Data, "m_usSolidFlags") & 12) == 0)
	{
		gB_TouchesWall[client] = true;
	}
}

int GetHUDTarget(int client)
{
	int target = client;

	if(IsClientObserver(client))
	{
		int iObserverMode = GetEntProp(client, Prop_Send, "m_iObserverMode");

		if(iObserverMode >= 3 && iObserverMode <= 5)
		{
			int iTarget = GetEntPropEnt(client, Prop_Send, "m_hObserverTarget");

			if (!IsFakeClient(iTarget))
			{
				target = iTarget;
			}
		}
	}

	return target;
}

void UpdateStats(int client)
{
	int target = client; //GetHUDTarget(client);

	float velocity[3];
	GetEntPropVector(target, Prop_Data, "m_vecAbsVelocity", velocity);
	velocity[2] = 0.0;

	float origin[3];
	GetClientAbsOrigin(target, origin);

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	g_fRawGain[client] = 0.0;
	g_iTickCount[client] = 0;
	g_iStrafeTick[client] = 0;
	g_iSyncedTick[client] = 0;
	g_fSpeedLoss[client] = 0.0;
	g_fOldHeight[client] = origin[2];
	g_fOldSpeed[client] = GetVectorLength(velocity);
	g_fTrajectory[client] = 0.0;
	g_fTraveledDistance[client] = NULL_VECTOR;
=======
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
	gF_RawGain[client] = 0.0;
	gI_StrafeTick[client] = 0;
	gI_SyncedTick[client] = 0;
	gI_StrafeCount[client] = 0;
	gF_SpeedLoss[client] = 0.0;
	gF_OldHeight[client] = origin[2];
	gF_OldSpeed[client] = GetVectorLength(velocity);
	gF_Trajectory[client] = 0.0;
	gF_TraveledDistance[client] = NULL_VECTOR;
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
}

public void Player_Jump(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));

	if(IsFakeClient(client) || (gI_Jump[client] > 0 && gI_StrafeTick[client] == 0))
	{
		return;
	}

	gI_Jump[client]++;

	//bool shouldUpdateStats = false;
	//bool printedStats = false;
	for (int i = 1; i <= MaxClients; i++)
	{
		if (!gB_Enabled[i])
		{
			continue;
		}

		if (!IsClientInGame(i))
		{
			continue;
		}

		if(GetHUDTarget(i) != client)
		{
			continue;
		}

		SSJ_PrintStats(i, client);
	}

	UpdateStats(client);
}

public Action Command_SSJ(int client, int args)
{
	if(client == 0)
	{
		ReplyToCommand(client, "[SM] This command can only be used in-game.");

		return Plugin_Handled;
	}

	return ShowSSJMenu(client);
}

Action ShowSSJMenu(int client, int item = 0)
{
	Menu menu = new Menu(SSJ_MenuHandler);
	menu.SetTitle("Speed @ Sixth Jump\n ");

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	menu.AddItem("usage", (g_bEnabled[client]) ? "[x] Enabled":"[ ] Enabled");
=======
	menu.AddItem("usage", (gB_Enabled[client])? "[x] Enabled":"[ ] Enabled");
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
	menu.AddItem("usage", (gB_Enabled[client])? "[x] Enabled":"[ ] Enabled");
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
	menu.AddItem("usage", (gB_Enabled[client])? "[x] Enabled":"[ ] Enabled");
>>>>>>> parent of 2189617... Update shavit-ssj.sp

	char sMenu[64];
	FormatEx(sMenu, 64, "[%d] Jump", gI_UsageMode[client]);

	menu.AddItem("mode", sMenu);
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	menu.AddItem("repeat", (g_bUsageRepeat[client]) ? "[x] Repeat":"[ ] Repeat");
	menu.AddItem("curspeed", (g_bCurrentSpeed[client]) ? "[x] Current speed":"[ ] Current speed");
	menu.AddItem("firstjump", (g_bFirstJump[client]) ? "[x] First jump":"[ ] First jump");
	menu.AddItem("height", (g_bHeightDiff[client]) ? "[x] Height difference":"[ ] Height difference");
	menu.AddItem("gain", (g_bGainStats[client]) ? "[x] Gain percentage":"[ ] Gain percentage");
	menu.AddItem("efficiency", (g_bEfficiency[client]) ? "[x] Strafe efficiency":"[ ] Strafe efficiency");
	menu.AddItem("time", (g_bTime[client]) ? "[x] Time":"[ ] Time");
	menu.AddItem("time Δ", (g_bDeltaTime[client]) ? "[x] Time Δ":"[ ] Time Δ");
	menu.AddItem("sync", (g_bStrafeSync[client]) ? "[x] Synchronization":"[ ] Synchronization");
=======
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
	menu.AddItem("repeat", (gB_UsageRepeat[client])? "[x] Repeat":"[ ] Repeat");
	menu.AddItem("curspeed", (gB_CurrentSpeed[client])? "[x] Current speed":"[ ] Current speed");
	menu.AddItem("firstjump", (gB_FirstJump[client])? "[x] First jump":"[ ] First jump");
	menu.AddItem("height", (gB_HeightDiff[client])? "[x] Height difference":"[ ] Height difference");
	menu.AddItem("gain", (gB_GainStats[client])? "[x] Gain percentage":"[ ] Gain percentage");
	menu.AddItem("efficiency", (gB_Efficiency[client])? "[x] Strafe efficiency":"[ ] Strafe efficiency");
	menu.AddItem("sync", (gB_StrafeSync[client])? "[x] Synchronization":"[ ] Synchronization");
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp

	menu.ExitButton = true;
	menu.DisplayAt(client, item, 0);

	return Plugin_Handled;
}

public int SSJ_MenuHandler(Menu menu, MenuAction action, int param1, int param2)
{
	if(action == MenuAction_Select)
	{
		switch (param2)
		{
			case 0:
			{
				gB_Enabled[param1] = !gB_Enabled[param1];
				SetCookie(param1, gH_CookieEnabled, gB_Enabled[param1]);
			}

			case 1:
			{
				gI_UsageMode[param1] = (gI_UsageMode[param1] % 9) + 1;
				SetCookie(param1, gH_CookieUsageMode, gI_UsageMode[param1]);
			}

			case 2:
			{
				gB_UsageRepeat[param1] = !gB_UsageRepeat[param1];
				SetCookie(param1, gH_CookieUsageRepeat, gB_UsageRepeat[param1]);
			}

			case 3:
			{
				gB_CurrentSpeed[param1] = !gB_CurrentSpeed[param1];
				SetCookie(param1, gH_CookieCurrentSpeed, gB_CurrentSpeed[param1]);
			}

			case 4:
			{
				gB_FirstJump[param1] = !gB_FirstJump[param1];
				SetCookie(param1, gH_CookieFirstJump, gB_FirstJump[param1]);
			}

			case 5:
			{
				gB_HeightDiff[param1] = !gB_HeightDiff[param1];
				SetCookie(param1, gH_CookieHeightDiff, gB_HeightDiff[param1]);
			}

			case 6:
			{
				gB_GainStats[param1] = !gB_GainStats[param1];
				SetCookie(param1, gH_CookieGainStats, gB_GainStats[param1]);
			}

			case 7:
			{
				gB_Efficiency[param1] = !gB_Efficiency[param1];
				SetCookie(param1, gH_CookieEfficiency, gB_Efficiency[param1]);
			}

			case 8:
			{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
				g_bTime[param1] = !g_bTime[param1];
				SetCookie(param1, g_hCookieTime, g_bTime[param1]);
			}

			case 9:
			{
				g_bDeltaTime[param1] = !g_bDeltaTime[param1];
				SetCookie(param1, g_hCookieDeltaTime, g_bDeltaTime[param1]);
			}

			case 10:
			{
				g_bStrafeSync[param1] = !g_bStrafeSync[param1];
				SetCookie(param1, g_hCookieStrafeSync, g_bStrafeSync[param1]);
=======
				gB_StrafeSync[param1] = !gB_StrafeSync[param1];
				SetCookie(param1, gH_CookieStrafeSync, gB_StrafeSync[param1]);
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
				gB_StrafeSync[param1] = !gB_StrafeSync[param1];
				SetCookie(param1, gH_CookieStrafeSync, gB_StrafeSync[param1]);
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
				gB_StrafeSync[param1] = !gB_StrafeSync[param1];
				SetCookie(param1, gH_CookieStrafeSync, gB_StrafeSync[param1]);
>>>>>>> parent of 2189617... Update shavit-ssj.sp
			}

		}

		ShowSSJMenu(param1, GetMenuSelectionPosition());
	}

	else if(action == MenuAction_End)
	{
		delete menu;
	}

	return 0;
}

void SSJ_GetStats(int client, float vel[3], float angles[3])
{
	float velocity[3];
	GetEntPropVector(client, Prop_Data, "m_vecAbsVelocity", velocity);

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	g_iStrafeTick[client]++;
	g_iTickCount[client]++;
=======
	gI_StrafeTick[client]++;
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
	gI_StrafeTick[client]++;
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
	gI_StrafeTick[client]++;
>>>>>>> parent of 2189617... Update shavit-ssj.sp

	float speedmulti = GetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue");

	gF_TraveledDistance[client][0] += velocity[0] * gF_Tickrate * speedmulti;
	gF_TraveledDistance[client][1] += velocity[1] * gF_Tickrate * speedmulti;
	velocity[2] = 0.0;

	gF_Trajectory[client] += GetVectorLength(velocity) * gF_Tickrate * speedmulti;

	float fore[3];
	float side[3];
	GetAngleVectors(angles, fore, side, NULL_VECTOR);

	fore[2] = 0.0;
	NormalizeVector(fore, fore);

	side[2] = 0.0;
	NormalizeVector(side, side);

	float wishvel[3];
	float wishdir[3];

	for (int i = 0; i < 2; i++)
	{
		wishvel[i] = fore[i] * vel[0] + side[i] * vel[1];
	}

	float wishspeed = NormalizeVector(wishvel, wishdir);
	float maxspeed = GetEntPropFloat(client, Prop_Send, "m_flMaxspeed");

	if(maxspeed != 0.0 && wishspeed > maxspeed)
	{
		wishspeed = maxspeed;
	}

	if(wishspeed > 0.0)
	{
		float wishspd = (wishspeed > 30.0) ? 30.0:wishspeed;
		float currentgain = GetVectorDotProduct(velocity, wishdir);
		float gaincoeff = 0.0;

		if(currentgain < 30.0)
		{
			gI_SyncedTick[client]++;
			gaincoeff = (wishspd - FloatAbs(currentgain)) / wishspd;
		}

		if(gB_TouchesWall[client] && gI_TouchTicks[client] && gaincoeff > 0.5)
		{
			gaincoeff -= 1.0;
			gaincoeff = FloatAbs(gaincoeff);
		}

		gF_RawGain[client] += gaincoeff;
	}
}

public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float vel[3], float angles[3])
{
	int flags = GetEntityFlags(client);
	float speed = GetClientVelocity(client);

<<<<<<< HEAD
	if(g_fOldVelocity[client] > speed)
=======
	if(flags & FL_ONGROUND != FL_ONGROUND)
	{
		if((gI_ButtonCache[client] & IN_FORWARD) != IN_FORWARD && (buttons & IN_FORWARD) == IN_FORWARD)
		{
			gI_StrafeCount[client]++;
		}

		if((gI_ButtonCache[client] & IN_MOVELEFT) != IN_MOVELEFT && (buttons & IN_MOVELEFT) == IN_MOVELEFT)
		{
			gI_StrafeCount[client]++;
		}

		if((gI_ButtonCache[client] & IN_BACK) != IN_BACK && (buttons & IN_BACK) == IN_BACK)
		{
			gI_StrafeCount[client]++;
		}

		if((gI_ButtonCache[client] & IN_MOVERIGHT) != IN_MOVERIGHT && (buttons & IN_MOVERIGHT) == IN_MOVERIGHT)
		{
			gI_StrafeCount[client]++;
		}
	}

	if(gF_OldVelocity[client] > speed)
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
>>>>>>> parent of 2189617... Update shavit-ssj.sp
	{
		gF_SpeedLoss[client] += (FloatAbs(speed - gF_OldVelocity[client]));
	}

	if(flags & FL_ONGROUND == FL_ONGROUND)
	{
		if(gI_TicksOnGround[client]++ > BHOP_FRAMES)
		{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
			g_iJump[client] = 0;
			g_iStrafeTick[client] = 0;
			g_iSyncedTick[client] = 0;
			g_fRawGain[client] = 0.0;
			g_fTrajectory[client] = 0.0;
			g_fSpeedLoss[client] = 0.0;
			g_fTraveledDistance[client] = NULL_VECTOR;
		}

		if ((buttons & IN_JUMP) > 0 && g_iTicksOnGround[client] == 1)
=======
			gI_Jump[client] = 0;
			gI_StrafeTick[client] = 0;
			gI_SyncedTick[client] = 0;
			gF_RawGain[client] = 0.0;
			gF_Trajectory[client] = 0.0;
			gI_StrafeCount[client] = 0;
			gF_SpeedLoss[client] = 0.0;
			gF_TraveledDistance[client] = NULL_VECTOR;
		}

		if((buttons & IN_JUMP) > 0 && gI_TicksOnGround[client] == 1)
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
			gI_Jump[client] = 0;
			gI_StrafeTick[client] = 0;
			gI_SyncedTick[client] = 0;
			gF_RawGain[client] = 0.0;
			gF_Trajectory[client] = 0.0;
			gI_StrafeCount[client] = 0;
			gF_SpeedLoss[client] = 0.0;
			gF_TraveledDistance[client] = NULL_VECTOR;
		}

		if((buttons & IN_JUMP) > 0 && gI_TicksOnGround[client] == 1)
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
			gI_Jump[client] = 0;
			gI_StrafeTick[client] = 0;
			gI_SyncedTick[client] = 0;
			gF_RawGain[client] = 0.0;
			gF_Trajectory[client] = 0.0;
			gI_StrafeCount[client] = 0;
			gF_SpeedLoss[client] = 0.0;
			gF_TraveledDistance[client] = NULL_VECTOR;
		}

		if((buttons & IN_JUMP) > 0 && gI_TicksOnGround[client] == 1)
>>>>>>> parent of 2189617... Update shavit-ssj.sp
		{
			SSJ_GetStats(client, vel, angles);
			gI_TicksOnGround[client] = 0;
		}
	}

	else
	{
		MoveType movetype = GetEntityMoveType(client);

		if(movetype != MOVETYPE_NONE && movetype != MOVETYPE_NOCLIP && movetype != MOVETYPE_LADDER && GetEntProp(client, Prop_Data, "m_nWaterLevel") < 2)
		{
			SSJ_GetStats(client, vel, angles);
		}

		gI_TicksOnGround[client] = 0;
	}

	if(gB_TouchesWall[client])
	{
		gI_TouchTicks[client]++;
		gB_TouchesWall[client] = false;
	}

	else
	{
		gI_TouchTicks[client] = 0;
	}

	gI_ButtonCache[client] = buttons;
	gF_OldVelocity[client] = speed;
	return Plugin_Continue;
}

bool SSJ_PrintStats(int client, int target)
{
	if(gI_Jump[target] == 1)
	{
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
		if (!g_bFirstJump[client] && g_iUsageMode[client] != 1)
=======
		if(!gB_FirstJump[client] && gI_UsageMode[client] != 1)
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
		if(!gB_FirstJump[client] && gI_UsageMode[client] != 1)
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
		if(!gB_FirstJump[client] && gI_UsageMode[client] != 1)
>>>>>>> parent of 2189617... Update shavit-ssj.sp
		{
			return false;
		}
	}

	else if(gB_UsageRepeat[client])
	{
		if(gI_Jump[target] % gI_UsageMode[client] != 0)
		{
			return false;
		}
	}

	else if(gI_Jump[target] != gI_UsageMode[client])
	{
		return false;
	}

	float velocity[3];
	GetEntPropVector(target, Prop_Data, "m_vecAbsVelocity", velocity);
	velocity[2] = 0.0;

	float origin[3];
	GetClientAbsOrigin(target, origin);

	float coeffsum = gF_RawGain[target];
	coeffsum /= gI_StrafeTick[target];
	coeffsum *= 100.0;

	float distance = GetVectorLength(gF_TraveledDistance[target]);

	if(distance > gF_Trajectory[target])
	{
		distance = gF_Trajectory[target];
	}

	float efficiency = 0.0;

	if(distance > 0.0)
	{
		efficiency = coeffsum * distance / gF_Trajectory[target];
	}

	coeffsum = RoundToFloor(coeffsum * 100.0 + 0.5) / 100.0;
	efficiency = RoundToFloor(efficiency * 100.0 + 0.5) / 100.0;

	int tickcount = g_iTickCount[client];

	char sMessage[192];
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	FormatEx(sMessage, 192, "J: %s%i", gS_ChatStrings.sStyle, g_iJump[target]);
=======
	FormatEx(sMessage, 192, "J: %s%i", gS_ChatStrings.sVariable, gI_Jump[target]);
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
	FormatEx(sMessage, 192, "J: %s%i", gS_ChatStrings.sVariable, gI_Jump[target]);
>>>>>>> parent of 2189617... Update shavit-ssj.sp
=======
	FormatEx(sMessage, 192, "J: %s%i", gS_ChatStrings.sVariable, gI_Jump[target]);
>>>>>>> parent of 2189617... Update shavit-ssj.sp

	if(gB_CurrentSpeed[client])
	{
		Format(sMessage, 192, "%s %s| Spd: %s%i", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sStyle, RoundToFloor(GetVectorLength(velocity)));
	}

	if(gI_Jump[target] > 1)
	{
		if(gB_HeightDiff[client])
<<<<<<< HEAD
<<<<<<< HEAD
		{
<<<<<<< HEAD
			Format(sMessage, 192, "%s %s| H Δ: %s%i", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sStyle, RoundToFloor(origin[2]) - RoundToFloor(g_fInitialHeight[target]));
=======
			Format(sMessage, 192, "%s %s| H Δ: %s%i", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sVariable, RoundToFloor(origin[2]) - RoundToFloor(gF_InitialHeight[target]));
>>>>>>> parent of 2189617... Update shavit-ssj.sp
		}

		if(gB_GainStats[client])
		{
			Format(sMessage, 192, "%s %s| Gn: %s%.2f%%", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sStyle, coeffsum);
		}

		if(gB_StrafeSync[client])
		{
<<<<<<< HEAD
			Format(sMessage, 192, "%s %s| Snc: %s%.2f%%", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sStyle, 100.0 * g_iSyncedTick[target] / g_iStrafeTick[target]);
=======
			Format(sMessage, 192, "%s %s| Snc: %s%.2f%%", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sVariable, 100.0 * gI_SyncedTick[target] / gI_StrafeTick[target]);
>>>>>>> parent of 2189617... Update shavit-ssj.sp
		}

		if(gB_Efficiency[client])
=======
=======
		{
			Format(sMessage, 192, "%s %s| H Δ: %s%i", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sVariable, RoundToFloor(origin[2]) - RoundToFloor(gF_InitialHeight[target]));
		}

		if(gB_GainStats[client])
>>>>>>> parent of 2189617... Update shavit-ssj.sp
		{
			Format(sMessage, 192, "%s %s| H Δ: %s%i", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sVariable, RoundToFloor(origin[2]) - RoundToFloor(gF_InitialHeight[target]));
		}

<<<<<<< HEAD
		if(gB_GainStats[client])
>>>>>>> parent of 2189617... Update shavit-ssj.sp
		{
			Format(sMessage, 192, "%s %s| Eff: %s%.2f%%", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sStyle, efficiency);
		}

<<<<<<< HEAD
		if(g_bTime[client])
=======
		if(gB_StrafeSync[client])
		{
			Format(sMessage, 192, "%s %s| Snc: %s%.2f%%", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sVariable, 100.0 * gI_SyncedTick[target] / gI_StrafeTick[target]);
		}

		if(gB_Efficiency[client])
>>>>>>> parent of 2189617... Update shavit-ssj.sp
		{
			float time = Shavit_GetClientTime(target);

			char sTime[32];
			FormatSeconds(time, sTime, 32, true);
			Format(sMessage, 192, "%s %s| Time: %s%s", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sStyle, sTime);
		}

		if(g_bDeltaTime[client])
=======
		if(gB_StrafeSync[client])
		{
			Format(sMessage, 192, "%s %s| Snc: %s%.2f%%", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sVariable, 100.0 * gI_SyncedTick[target] / gI_StrafeTick[target]);
		}

		if(gB_Efficiency[client])
>>>>>>> parent of 2189617... Update shavit-ssj.sp
		{
			float time = tickcount * GetTickInterval();
			char sTime[32];
			FormatSeconds(time, sTime, sizeof(sTime), false);
			Format(sMessage, 192, "%s %s| Time Δ: %s%s", sMessage, gS_ChatStrings.sText, gS_ChatStrings.sStyle, sTime);
		}
	}

	PrintToClient(client, "%s", sMessage);

	return true;
}

void PrintToClient(int client, const char[] message, any...)
{
	char buffer[300];
	VFormat(buffer, 300, message, 3);

	if(gB_Shavit)
	{
		Shavit_StopChatSound();
		Shavit_PrintToChat(client, "%s", buffer); // Thank you, GAMMACASE
	}

	else
	{
		PrintToChat(client, "%s%s%s%s", (gEV_Type == Engine_CSGO) ? " ":"", gS_ChatStrings.sPrefix, gS_ChatStrings.sText, buffer);
	}
}

void SetCookie(int client, Handle hCookie, int n)
{
	char sCookie[8];
	IntToString(n, sCookie, 8);

	SetClientCookie(client, hCookie, sCookie);
}

float GetClientVelocity(int client)
{
	float vVel[3];

	vVel[0] = GetEntPropFloat(client, Prop_Send, "m_vecVelocity[0]");
	vVel[1] = GetEntPropFloat(client, Prop_Send, "m_vecVelocity[1]");

	return GetVectorLength(vVel);
}
