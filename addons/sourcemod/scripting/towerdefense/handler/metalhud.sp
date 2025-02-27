/**
 * Print metal hud to all players that had it on
 *
 * @param hTimer 		Timer Handle
 * @noreturn
 */
public Action Timer_ClientHudTick(Handle hTimer) {
    char aBuf[1024];
    Format(aBuf, sizeof(aBuf), "\
        %s %t \n\
        --------------- \n",
        PLUGIN_PREFIX, "cmdMetalStats"
    );
    for (int iPlayer = 1; iPlayer <= MaxClients; iPlayer++) {
        if (IsDefender(iPlayer)) {
            Format(aBuf, sizeof(aBuf), "%s%t\n", aBuf, "cmdMetalStatsPlayer", iPlayer, GetClientMetal(iPlayer));
        }
    }
    Format(aBuf, sizeof(aBuf), "%s--------------- ", aBuf);

    for (int iClient = 1; iClient <= MaxClients; iClient++) {
        if (!IsClientInGame(iClient) || !IsPlayerAlive(iClient))
            continue;
        if (!IsDefender(iClient))
            continue;
        if (!g_bHudMetal[iClient])
            continue;
        if(!g_bHudAvailable[iClient])
            continue;

        PrintToHud(iClient, aBuf);
    }
    return Plugin_Continue;
}