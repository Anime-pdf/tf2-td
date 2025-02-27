#pragma semicolon 1

#include <sourcemod>

stock int TF2_CreateGlow(int iEnt)
{
    char EntName[64];
    GetEntPropString(iEnt, Prop_Data, "m_iName", EntName, sizeof(EntName));

    int ent = CreateEntityByName("tf_glow");
    
    char sName[32];
    IntToString(ent, sName, sizeof(sName));
    DispatchKeyValue(ent, "targetname", sName);
    DispatchKeyValue(ent, "target", EntName);
    DispatchKeyValue(ent, "Mode", "0");
    SetVariantString(EntName);
    AcceptEntityInput(ent, "SetParent");
    SetVariantColor({ 255, 1, 1, 255 });
    AcceptEntityInput(ent, "SetGlowColor");
    
    DispatchSpawn(ent);
    AcceptEntityInput(ent, "Enable");

    Log(TDLogLevel_Debug, "Created glow, target:(%s)%d, glow:(%s)%d", EntName, iEnt, sName, ent);

    return ent;
}

stock bool TF2_HasGlow(int iEnt)
{
    int index = -1;
    while ((index = FindEntityByClassname(index, "tf_glow")) != -1)
    {
        if (GetEntPropEnt(index, Prop_Send, "m_hTarget") == iEnt)
        {
            return true;
        }
    }
    
    return false;
}