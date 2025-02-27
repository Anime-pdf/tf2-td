# TF2 Tower Defense #

TF2 Tower Defense is a modification to Valve's game Team Fortress 2. Basically you have to stop enemies from crossing a map by buying towers and building up defenses.

This fork is maintained by [Animepdf](http://steamcommunity.com/profiles/76561198845500916).

---

## Authors ##

TF2 Tower Defense was originally created by [floube](http://steamcommunity.com/profiles/76561198051789304/) and [mani](http://steamcommunity.com/profiles/76561198002201102/). 

It was last maintained by [Hurp Durp](http://steamcommunity.com/profiles/76561198014050007).

[Dragonisser](http://steamcommunity.com/profiles/76561198039140852) is currently looking at issues/enhancements/tweaks.

<hr>

Plugin - [floube](http://steamcommunity.com/profiles/76561198051789304/), [Benedevil](http://steamcommunity.com/profiles/76561198056589941), [Hurp Durp](http://steamcommunity.com/profiles/76561198014050007)
 
Maps - [mani](http://steamcommunity.com/profiles/76561198002201102/), [fatboy](http://steamcommunity.com/profiles/76561197994348901/), [Berry](http://steamcommunity.com/profiles/76561198030362593/)

---

## Requirements ##

 * Dedicated Team Fortress 2 server (windows or linux)
 * MySQL/MariaDB server
 * Metamod + Sourcemod
 * [TF2Items](https://forums.alliedmods.net/showthread.php?p=1050170)
 * [SteamWorks](https://forums.alliedmods.net/showthread.php?t=229556) -> [Download](https://github.com/hexa-core-eu/SteamWorks/releases)
 * [TF2Attributes](https://forums.alliedmods.net/showthread.php?t=210221)

### Optional Plugins ###

 * [Cheat-Control](https://forums.alliedmods.net/showthread.php?p=600521)

---

## Installation ##

1. Create a dedicated TF2 server and install metamod + sourcemod, and the extensions and plugins above. Ensure that the server and plugins work before continuing.
2. Download the [latest release](https://github.com/tf2td/towerdefense/releases) of TF2TD.
3. On your MySQL/MariaDB server, create a new `towerdefense` database and user. Import the [`tf2td.sql`](addons/sourcemod/schema/tf2td.sql) file into your database.
4. Add the database information to your sourcemod `databases.cfg` file (an example can be found [here](addons/sourcemod/configs/databases_example.cfg)).
5. Copy [`towerdefense.cfg`](cfg/towerdefense.cfg) to your server's `tf/cfg` folder. This file has settings that need to be executed when the server starts. Add the following to the end of your server's `cfg/server.cfg` file to do so:
   
   `exec towerdefense`
   
6. Copy the [`tf2tdcustom/`](custom) folder and its contents into your server's `tf/custom/` directory.
7. Copy `towerdefense.smx` to your sourcemod `tf/addons/sourcemod/plugins` folder.
8. Start your server with the map `td_firstone_v11b`. You should be able to connect and play if everything was set up correctly.

---

## General Information ##

In case you are using [STAC](https://github.com/sapphonie/StAC-tf2) you need to set "stac_work_with_sv_cheats" to "1" or else STAC will shut itself down. It is recommended to also use [Cheat-Control](#optional-plugins).

---

## Table of Server Settings ##

The following ConVars (console variables) are used to configure the behavior of the TF2 Tower Defense plugin:

| ConVar Name                      | Default Value | Description                                                                 | Min Value | Max Value |
|----------------------------------|---------------|-----------------------------------------------------------------------------|-----------|-----------|
| `td_enabled`                     | `1`           | Enables or disables the Tower Defense plugin.                               | `0`       | `1`       |
| `td_max_bots_on_field`           | `8`           | Maximum number of bots allowed on the field simultaneously.                 | `1`       | N/A       |
| `td_custom_tower_pitch`          | `1`           | Sets the tower's pitch to match the player's pitch instead of the default.  | `0`       | `1`       |
| `td_allow_picking_towers_midwave`| `0`           | Allows players to pick up towers during a wave.                             | `0`       | `1`       |
| `td_allow_placing_towers_midwave`| `1`           | Allows players to place towers during a wave.                               | `0`       | `1`       |
| `td_show_metal_hud_default`      | `1`           | Enables the display of metal in the HUD by default.                         | `0`       | `1`       |

---

## Table of Server Commands ##

The following commands are available for administrators and players to interact with the Tower Defense plugin.

### Admin Commands ###
| Command       | Description                                                                 | Arguments                                                                 | Example          |
|---------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------|------------------|
| `sm_gm`       | Gives metal to the player (testing purposes).                               | `<#userid|name> <metal>`                                                  | `sm_gm @all 100` |
| `sm_r`        | Reloads the current map (testing purposes).                                 | None                                                                      | `sm_r`           |
| `sm_sw`       | Sets the current wave (testing purposes).                                   | `<wave>`                                                                  | `sm_sw 5`        |
| `sm_bt`       | Buys a tower (testing purposes).                                            | `<tower_id>`                                                              | `sm_bt 1`        |
| `sm_pregame`  | Starts the pre-game phase (temporary command).                              | None                                                                      | `sm_pregame`     |
| `sm_password` | Sets a random password for the server (temporary command).                  | None                                                                      | `sm_password`    |

### Client Commands ###
| Command                                 | Description                                                                 | Arguments                                   | Example           |
|-----------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------|-------------------|
| `sm_p`                                  | Retrieves the server password.                                              | None                                        | `sm_p`            |
| `sm_s` / `sm_sentry`                    | Builds a sentry tower.                                                      | None                                        | `sm_s`            |
| `sm_d` / `sm_drop`                      | Drops metal for other players to pick up.                                   | `<metal>`                                   | `sm_d 50`         |
| `sm_m` / `sm_metal`                     | Displays the player's current metal count.                                  | None                                        | `sm_m`            |
| `sm_w` / `sm_wave`                      | Displays the current wave number.                                           | None                                        | `sm_w`            |
| `sm_t` / `sm_transfer` / `sm_givemetal` | Transfers metal to another player.                                          | `<target> <metal>`                          | `sm_t @all 50`    |
| `sm_mhud` / `sm_metalhud`               | Toggles the display of metal in the HUD.                                    | None                                        | `sm_mhud`         |

#### Notes on Arguments ####
- **`<#userid|name>`**: A target selector, such as a player's name, SteamID, or `@all` for all players.
- **`<metal>`**: The amount of metal to give, drop, or transfer. Must be a positive integer.
- **`<wave>`**: The wave number to set. Must be within the valid range of waves.
- **`<tower_id>`**: The ID of the tower to buy. Must correspond to a valid tower type.
- **`<target>`**: The player to target for commands like `sm_gm` or `sm_t`. Can be a name, SteamID, or `@all`.


##### Trouble getting it working? Create an issue and provide your server log files and other required information for assistance. #####
