#pragma semicolon 1

#include <sourcemod>

#if defined INFO_INCLUDES
	#include "../info/constants.sp"
	#include "../info/enums.sp"
	#include "../info/variables.sp"
#endif

stock void CreateTDKeyValues() {
    g_MetalPacks = new KeyValues("GlobalMetalPacks");
    g_MetalPackGlows = new KeyValues("GlobalMetalPackGlows");
}