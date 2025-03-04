#pragma semicolon 1

#include <sourcemod>

#if defined INFO_INCLUDES
	#include "../info/constants.sp"
	#include "../info/enums.sp"
	#include "../info/variables.sp"
#endif

stock void CreateConVars() {
	CreateConVar("td_version", PLUGIN_VERSION, "Tower Defense Version", FCVAR_SPONLY | FCVAR_REPLICATED | FCVAR_NOTIFY | FCVAR_DONTRECORD);
	g_hEnabled = CreateConVar("td_enabled", "1", "Enables/disables Tower Defense", FCVAR_DONTRECORD, true, 0.0, true, 1.0);
	g_hMaxBotsOnField = CreateConVar("td_max_bots_on_field", "8", "Max bots simultaneously on field. Might be actually lower than set due to maxplayer limit");
	g_hCustomTowerPitch = CreateConVar("td_custom_tower_pitch", "1", "Set pitch to player's, not to default", FCVAR_REPLICATED | FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hAllowPickingTowersMidwave = CreateConVar("td_allow_picking_towers_midwave", "0", "Allow players to pickup towers midwave", FCVAR_REPLICATED | FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hAllowPlacingTowersMidwave = CreateConVar("td_allow_placing_towers_midwave", "1", "Allow players to place towers midwave", FCVAR_REPLICATED | FCVAR_NOTIFY, true, 0.0, true, 1.0);
	g_hShowMetalInHudDefault = CreateConVar("td_show_metal_hud_default", "1", "Allow players to place towers midwave", FCVAR_REPLICATED | FCVAR_NOTIFY, true, 0.0, true, 1.0);
}

stock void LoadConVars() {
	g_hEnabled.AddChangeHook(OnConVarChanged);
	g_hMaxBotsOnField.AddChangeHook(OnConVarChanged);
	g_hTfBotQuota = FindConVar("tf_bot_quota");
	g_hSvVisibleMaxPlayers = FindConVar("sv_visiblemaxplayers");
	g_hTfBotQuota.AddChangeHook(OnConVarChanged);
	g_hCustomTowerPitch.AddChangeHook(OnConVarChanged);
	g_hAllowPickingTowersMidwave.AddChangeHook(OnConVarChanged);
	g_hAllowPlacingTowersMidwave.AddChangeHook(OnConVarChanged);
	g_hShowMetalInHudDefault.AddChangeHook(OnConVarChanged);
}

stock void SetConVars() {
	g_hTfBotQuota.IntValue = 0;
}

stock void SetPregameConVars() {
	FindConVar("sv_cheats").SetInt(1, true, false);
}

/**
 * Called when a console variable's value is changed.
 *
 * @param hConVar		Handle to the convar that was changed.
 * @param sOldValue		String containing the value of the convar before it was changed.
 * @param sNewValue		String containing the new value of the convar.
 * @noreturn
 */

public void OnConVarChanged(ConVar hConVar, const char[] sOldValue, const char[] sNewValue) {
	if (hConVar == g_hEnabled) {
		if (!g_bMapRunning) {
			return;
		}
		
		if (g_hEnabled.BoolValue) {
			if (!g_bEnabled) {
				bool bEnabled = IsTowerDefenseMap();

				if (bEnabled) {
					// Basically do the same as in OnConfigsExecuted().

					g_bEnabled = true;
					UpdateGameDescription();
				}
			}
		} else {
			if (g_bEnabled) {
				// Basically do the same as in OnMapEnd().

				g_bEnabled = false;
				UpdateGameDescription();
			}
		}
	} else if (hConVar == g_hTfBotQuota) {
		if (StringToInt(sNewValue) > 0) {
			LogType(TDLogLevel_Error, TDLogType_FileAndConsole, "ConVar 'tf_bot_quota' can't be above 0 - Current Value: %d - New Value: %d", StringToInt(sOldValue), StringToInt(sNewValue));
			LogType(TDLogLevel_Error, TDLogType_FileAndConsole, "Setting ConVar 'tf_bot_quota' to default");
			ResetConVar(g_hTfBotQuota, true, false);
		}
	} else if (hConVar == g_hMaxBotsOnField) {
		UpdateMaxBotsOnField();
	}
	else {
		char ConVarName[128];
		hConVar.GetName(ConVarName, sizeof(ConVarName));
		LogType(TDLogLevel_Trace, TDLogType_FileAndConsole, "ConVar '%s' changed. Old Value: %d - New Value: %d", ConVarName, StringToInt(sOldValue), StringToInt(sNewValue));
	}
}