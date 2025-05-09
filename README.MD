	*Current Version: 7.988 - Updated: 5/9/2025*

### Table of Contents

[How To Install / Uninstall](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#how-to-install--uninstall)<br>
[Essential CVARS for UBER MODS Servers](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#essential-cvars-for-uber-mods-servers)<br>
[In-Game Menu Skin](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#in-game-menu-skin)<br>
[Elgan's Admin Pro Menu](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#elgans-admin-pro-menu)<br>
[Essential UBER BASEBUILDER Info](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#essential-uber-basebuilder-info)<br>
[UBER CVARS Scripts Info](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#uber-cvars-scripts-info)<br>
[Essential CYBER ATTACK / SEARCH & DESTROY / FREEZE TAG Info](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#essential-cyber-attack--search--destroy--freeze-tag-info)<br>
[Killstreak Rewards](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#killstreak-rewards)<br>
[Drivable Vehicles / Usable Statweapons](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#drivable-vehicles--usable-statweapons)<br>
[Singleplayer Map Mods](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#singleplayer-maps-mods)<br>
[Updates & Bug Fixes](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#updates--bug-fixes)

#

# How To Install / Uninstall

- From GitHub: click the green "<> Code", download .zip file.
- All contents within "UBER-MODS-v8.00-MOHAA" folder inside the .zip need to be copy-pasted outside this folder (all contents directly in the .zip).
- Once all contents are copy-pasted outside this folder, delete the "UBER-MODS-v8.00-MOHAA" folder.
- Change the .zip filetype to .pk3.
- Add "zzzzzzzzzzzzzzz_" to the beginning of the filename of this .pk3 (ensures that the mod loads last).
- Delete any and all older UBER MODS .pk3 files.<br>
- Move the .pk3 file to your "Medal of Honor/main" folder (same folder as Pak0.pk3, Pak1.pk3, Pak2.pk3).<br>
- Uninstall by deleting the .pk3 mod file from the "main" folder.

- For MOHAA Reborn 1.12: keep all files within the .pk3 as is.
- For MOH Allied Assault 1.11, Spearhead, or Breakthrough: copy-paste all files within the "NOT_REBORN" folder outside of this folder (replacing other files).

#

# Essential CVARS for UBER MODS Servers

This new CVAR allows for switching between the current 3 uber game modes (besides FFA or TDM) before loading a new map.<br>
Place one of these lines into your server.cfg file, or add one of these lines to an .scr map script (before level waittill prespawn):

	seta g_ubergametype ""		// none or "0", default to g_gametype 1 or g_gametype 2.
	seta g_ubergametype "bb"	// UBER BASEBUILDER game mode
	seta g_ubergametype "cyb"	// CYBER ATTACK game mode
	seta g_ubergametype "snd"	// SEARCH & DESTROY game mode
	seta g_ubergametype "ft"	// FREEZE TAG game mode

To switch to any of the "obj/" maps from an FFA or TDM game mode map (such as "dm/"), type the following into the console:

	g_gametype 4; map obj/obj_team1
	g_gametype 4; map obj/obj_team2
	g_gametype 4; map obj/obj_team3
	g_gametype 4; map obj/obj_team4

To make an expanded "sv_maplist" in server.cfg (beyond 256 characters), make other lists similar to the example below (2nd list can also start at "sv_maplist1"):

	seta sv_maplist "dm/mohdm1 dm/mohdm2 dm/mohdm3 dm/mohdm4 dm/mohdm5 dm/mohdm6 dm/mohdm7"
	seta sv_maplist2 "obj/obj_team1 obj/obj_team2 obj/obj_team3 obj/obj_team4"
	seta sv_maplist3 "training m1l1 m1l2a m1l2b m1l3a m1l3b m1l3c m2l1 m2l2a m2l2b m2l2c m2l3 m3l1a m3l1b m3l2 m3l3 m4l0 m4l1 m4l2 m4l3"
	seta sv_maplist4 "m5l1a m5l1b m5l2a m5l2b m5l3 m6l1a m6l1b m6l1c m6l2a m6l2b m6l3a m6l3b m6l3c m6l3d m6l3e void"

- Add "exec global/sv_maplists.scr" to global/dmprecache.scr to use the lists above.
- Do not use "sv_maplist0"; it is keeping memory of the original "sv_maplist".
- Do not have 2+ lists ending with the same map name, otherwise the script will keep copying the list after the first one with said map name.
- Do not have the same map name in 2 different lists (only in the same list).
- If using the map example below, do not add more than 1 maplist, since this script may not follow the correct sequence:
- Maplist example: dm/mohdm6 dm/mohdm1 dm/mohdm6 dm/mohdm1 dm/mohdm6 dm/mohdm3 dm/mohdm6

		seta sv_maplist "dm/mohdm6 dm/mohdm1 dm/mohdm6"	 // this will not work as intended;
		seta sv_maplist2 "dm/mohdm1 dm/mohdm6 dm/mohdm3" // once loading dm/mohdm6 in the 2nd list, the script will think you are at the end of the 1st list.

#

# In-Game Menu Skin

- This highly modded menu skin (Press "Esc" in-game to open), adds monitor resolution related options and in-game display options, along with some scripting developer-only options. 

- IMPORTANT : If you don't normally type in the console "set rconpassword PWORD" upon starting a server, or if an rconpassword isn't already set yet,
	- change the rconpassword stuffcommand within zzzIn-game Menu Skin.pk3.
	- Inside the file, go to the "ui" folder and open "mapswitch.urc" file.
	- Scroll down a few lines to see "MAPS MENU (sets rconpassword) [Click This First]" and change the rconpassword in the stuffcommand "set rconpassword ...".

- All non-cheat buttons/sliders on outermost menu:
	- Join Allies, Join Axis, Kill Yourself, Spectator,
	- Volume (must apply & close when done), Brightness (apply & close), Mouse Speed (apply & close),
	- Disconnect, Choose Team, Main Menu, Quit Mohaa, Choose Weapon, MP Options,
	- Toggle FPS, Toggle HUD, MP3 Menu, Lagometer, Change Servers, MAPS Menu,
	- 1920 x 1080, 3840 x 2160, Fullscreen, Windowed, Disable All, Apply And Close. 

- All developer-only buttons on outermost menu (DO NOT USE THESE ON PUBLIC SERVERS!):
	- 3rd Person (must apply & close when done), Show Entity Nums (must apply & close when done),
	- Clay Mode On (r_picmip 10, to see through trees when developing), Clay Mode Off (r_picmip 0), 
	- Fullbright On, Fullbright Off, Toggle Developer (on/off), Lod Spawnlist.
	- Make sure cheats = 1 and thereisnomonkey = 1 before using these buttons.
	- There are 9 empty options next to "3rd Person" as well, in case you wants to add more features to the In-game Menu Skin. For any added options with orange 'X's, you must click "Apply And Close" after selecting them.

- All buttons/sliders within the "MP3 Menu":
	- Music Volume, Volume General, STOP, and 20 different music buttons.
	- Clicking any of these, after turning up the Music Volume slider, will play music only for you while also playing MOHAA.

- All buttons within the "MAPS Menu":
	- "MAPS MENU (sets rconpassword) [Click This First]",
	- Allow RBM, Allow TDM, Allow OBJ, Allow FFA, and 26 different maps buttons (10 are still empty).
	- If an rconpassword is not already set, then choosing a map will not work unless you click the [Click This First] button (once set, you won't need to click it again).
	- The 4 yellow "Allow" buttons change the g_gametype of the server.
	- These must be clicked before switching a map if you need to change the g_gametype first.
	- For example: in a TDM match on mohdm1, you cannot switch to obj_team3 without first clicking "Allow OBJ". Sometimes, you may need to click these buttons twice to get MOHAA to switch maps.

#

# Elgan's Admin Pro Menu

- The UBER FFA/TDM also comes with the Admin Pro mod.
	- A hotkey must be set in MOHAA's Options --> Controls --> Keyboard, and scroll up to see the "Admin Menu" Action above Primary and Secondary Attack. 

- IMPORTANT: Inside the UBER V7.0 FFA TDM.pk3 file,
	- go to the "Admin_menu" folder and open "rconpassword.cfg".
	- Change the rconpassword to your desired server admin password.

- Once opened in-game with the "Admin Menu" hotkey,
	- go to Client Section --> Controls to see even more options for keyboard controls.
	- The most useful one, "Editscript" allows the developer to open the map's .scr script in-game, editing and saving it without Alt-Tabbing back and forth between the desktop's Notepad and MOHAA.
	- For all other features, see Elgan's readme on his Admin Pro menu mod.

#

# Essential UBER BASEBUILDER Info

- exec alienx/basebuild.scr::main 800 1000 250 1 1 0 0 0 // buildtime, objectlimit, buildspeed, buildtakeweaps, buildfalldamage, countdownhide, hudhide, consoleprint

basebuild.scr::main (parameters) --->

	build start time in seconds (ex: 800),
	object limit (ex: 1000),
	player speed while building (ex: >= 280, 250 is default),
	take weapons while building (0 for no),
	fall damage while building (1 for yes),
	hide 70-sec countdown hud (1 for yes),
	hide bottom hud text (1 for yes),
	print object-placed origin, angles, model (1 for yes).

BASEBUILDER CONSOLE COMMANDS:

	alx_basebuild 0            // turn off basebuilding immediately, respawns everyone.
	alx_timeboost 120          // increase build time limit by 120 seconds, or any # of seconds.
	alx_timedown 120           // decrease build time limit by 120 seconds, or any # of seconds.
	alx_objectlimitboost 200   // increase basebuild object limit by 200, or any # of objects.
	alx_objectlimitdown 200    // decrease basebuild object limit by 200, or any # of objects.

	alx_removeall [27 or Searingwolfe]	// remove everything placed by $player[27] or by Searingwolfe). Using players' names only works in MOHAA Reborn 1.12.
	alx_removeobjects [27 or Searingwolfe]	// remove all static objects placed by $player[27] or by Searingwolfe).
	alx_removeturrets [27 or Searingwolfe]	// remove all TurretGun objects placed by $player[27] or by Searingwolfe).
	alx_removelifts [27 or Searingwolfe]	// remove all lifts placed by $player[27] or by Searingwolfe).
	alx_removeteles [27 or Searingwolfe]	// remove all teles placed by $player[27] or by Searingwolfe).

ADDITIONAL FEATURES:

	When placing down objects, hold the FIRE button to hold still the nonsolid object, and let go of FIRE to place down the object.
	If holding FIRE for 3+ seconds while placing down an object, placement will be cancelled (laser will turn green). Press FIRE again to uncancel (place down now).

	While holding object + holding USE(e) key, lean left/right to change object angles. Hold lean left/right for 2 seconds to slowly trim object's angles.
	While holding an object or lift: hold FIRE, then hold USE(e) to remove it.
	While holding a tele: hold USE(e), then hold FIRE to remove it.

	Hold Right-Click to change build-laser from green to blue; this activates "Trimming Mode" for the object being held (works for Reborn only).
	In trimming mode, players can lean left/right to slowly adjust roll-angles (x,y,z angles = pitch,yaw,roll).
	In trimming mode, players can crouch to rotate the object's yaw-angle by 90 degrees, flipping the lean left/right angles to adjust pitch-angles (but still looks like adjusting roll-angles from player's point of view).
	In trimming mode, players can walk (not run) forward/backward to increase/decrease their build-laser's distance between them and their object being held.
	When a new object is picked up, their build-laser's distance is automatically reset back to "level.basebuild_laserdist" (default = 350).

	Hold USE(e) + Lean left/right to activate a yellow "Builder Remover Laser".
	Hold USE(e) + hold FIRE at an object, lift, or tele that you placed to pick it up again (laser will turn red while picking it up).
	Players can only pick up their own objects, unless logged in as admin (isadmin = 1).

	When placing lifts and after first setting the start-position, the builder laser will turn red if the lift is below its start-position + 25 units (cannot be placed).
	Hold USE(e) to hold the lift's angle in its current position, and hold the build-laser's current length.

	Basebuilder script automatically lowers "objectlimit" count to avoid going beyond 1024 maxentities.
	Mini-flak88 objects act as flamethrowers, killing players within 5 hits. 

	While holding object & holding USE key, lean left/right to change object angles. Hold lean left/right for 2 seconds to slowly trim object's angles.

	Hold Right-Click to change build-laser from green to blue; this activates "Trimming Mode" for the object being held.
	In trimming mode, players can lean left/right to slowly adjust roll-angles (x,y,z angles = pitch,yaw,roll).
	In trimming mode, players can crouch to rotate the object's yaw-angle by 90 degrees, flipping the lean left/right angles to adjust pitch-angles (but still looks like adjusting roll-angles from player's point of view).
	In trimming mode, players can walk (not run) forward/backward to increase/decrease their build-laser's distance between them and their object being held.
	When a new object is picked up, their build-laser's distance is automatically reset back to "level.basebuild_laserdist" (default = 350).

	Basebuilder script automatically lowers "objectlimit" count to avoid going beyond 1024 maxentities.
	Mini-flak88 objects act as flamethrowers, killing players within 5 hits.



# UBER CVARS Scripts Info

- for "players same name" fix: add admin's IPs at top of "adminstuff.scr", to give admins name-changing priority.

- maxentities = 869 in code, but players may crash joining Reborn servers (singleplayer maps) if current entities = 725+, or 140+ remaining entities.

| File Name:        | CVAR without quotes or brackets:           | Description:   |
|:-------------:|:-------------:|:-----:|
| exec cvars/playercount.scr      | "players 1" | print to console the # of players in-game (type these into the server's console window). |
|       | "players 2" | print to console the # of players in-game & their usernames. |
|       | "players 3" | see which players in $player array are NULL. |
| exec cvars/entitycount.scr      | "entities 1" | wait 4 seconds to print # of entities & remaining entities until maxentities (1024) is reached. |
|       | "entities 2" | print to console the # of players in-game & their usernames. |
|       | "entities 3" | print all entities & their targetnames, but print slower. |
|       | "entities 4" | print only non-NULL entities ($player entities do not print for "entities" 4, 5, 6, 7). |
|       | "entities 5" | print only non-NULL entities that have targetnames. |
|       | "entities 6" | print only non-NULL entities that do not have targetnames (targetnames = ""). |
|       | "entities 7" | print only non-NULL entities, and print their classnames. |
| exec cvars/track.scr      | "track 1" | iprint each players' coords & angle to their own screens.  |
|       | "track 2" | iprint and print to console each players' coords & angles once every 3 seconds. |
|       | "track 0" | turn off tracking. |
| exec cvars/check.scr      | "check_giantbomb 1" | teleports all spectators to each of the trigger's randomized origins every 3 seconds. |
|       | "check_giantbomb 2" | spawn in a dummy model at each of the trigger's origins (only works once). |
|       | "check_lightbomb 1" | teleports all spectators to each of the trigger's randomized origins every 3 seconds. |
|       | "check_lightbomb 2" | spawn in a dummy model at each of the trigger's origins (only works once). |
|       | "check_health 1" | teleports all spectators to each of the trigger's randomized origins every 3 seconds. |
|       | "check_health 2" | spawn in a dummy model at each of the trigger's origins (only works once). |
|       | "check_grenade 1" | teleports all spectators to each of the trigger's randomized origins every 3 seconds. |
|       | "check_grenade 2" | spawn in a dummy model at each of the trigger's origins (only works once). |
|       | "check_rocket 1" | teleports all spectators to each of the trigger's randomized origins every 3 seconds. |
|       | "check_rocket 2" | spawn in a dummy model at each of the trigger's origins (only works once). |
|       | "check_snowball 1" | teleports all spectators to each of the trigger's randomized origins every 3 seconds. |
|       | "check_snowball 2" | spawn in a dummy model at each of the trigger's origins (only works once). |
|       | "check 0" | make all "check_[trigger]" cvars "0". |
| exec cvars/playerspawns.scr      | "playerspawns 1" | spawn dummy models at all Allies/Axis or FFA spawns (only works in singleplayer maps, not including Training). |
|       | "playerspawns 0" | remove the dummy models. |
| exec cvars/find.scr      | "find truckclip" | teleport all players to $truckclip's coords (also printing: coords, angles, entnum, and target). |
|       | "find endtrigger" | teleport all players to $endtrigger's coords (also printing: coords, angles, entnum, and target). |
|       | "find barrel[1]" | teleport all players to $barrel[1]'s coords (also printing: coords, angles, entnum, and target). |
|       | "find barrel[2]" | teleport all players to $barrel[2]'s coords (also printing: coords, angles, entnum, and target). |
| exec cvars/findent.scr      | "findent 65" | teleport all players to entity 65's coords (also printing: coords, angles, classname, model, targetname, target, health). |
|       | "findent 450" | teleport all players to entity 450's coords (also printing: coords, angles, classname, model, targetname, target, health). |
|       | "findent 0" | does not work if "findent" < sv_maxclients since these entities are reserved for players. |
| exec cvars/findclass.scr      | "findclass ScriptModel" | print the entnums and targetnames of all entities with a "ScriptModel" classname. |
|       | "findclass CrateObject" | print the entnums and targetnames of all entities with a "CrateObject" classname. |
|       | "findclass TurretGun" | print the entnums and targetnames of all entities with a "TurretGun" classname. |
|       | "findclass Trigger" | print the entnums and targetnames of all entities with a "Trigger" classname. Note: may include other entities such as "TriggerUse" and "TriggerUseOnce" |
| exec cvars/findmodel.scr      | "findmodel models/static/indycrate.tik" | print the entnums and targetnames of all entities with a "models/static/indycrate.tik" model. |
|       | "findmodel static/indycrate.tik" | print the entnums and targetnames of all entities with a "models/static/indycrate.tik" model. |
|       | "findmodel static/indycrate" | print the entnums and targetnames of all entities with a "models/static/indycrate.tik" model. |
| exec cvars/findset.scr      | "findset 7" | print all entnums and their targetnames in the map with .set = 7 (exploder-related entities). |
|       | "findset 20" | print all entnums and their targetnames in the map with .set = 20 (exploder-related entities). |
|       | "findset all" | print all entnums and their ".set" values, then prints total number of entities for each ".set" value. |
| exec cvars/drawpath.scr      | "drawpath bomberpath" | spawn nodes & lasers and draw them to each .target, until there's no more .targets or until the .target reaches an already-drawn node. |
|       | "drawpath spotpath1_1" | spawn nodes & lasers and draw them to each .target, until there's no more .targets or until the .target reaches an already-drawn node. |
|       | "drawpath exploderchunk[1]" | spawn nodes & lasers and draw them to each .target, until there's no more .targets or until the .target reaches an already-drawn node. |
|       | "drawpath exploderchunk[12]" | spawn nodes & lasers and draw them to each .target, until there's no more .targets or until the .target reaches an already-drawn node. |
| exec cvars/cybsnd.scr      | "cybsnd_score 1" | print the current Cyber Attack, Search & Destroy, or Freeze Tag score (rounds Allies won, Axis won). |
|       | "cybsnd_info 1" | print round start time, rounds to win, change sides (0 or 1 for switching bombsites), melt time, melt respawn (0 or 1 for spawning at frozen body or regular spawn), spectators auto-join teams (once round begins), bomb camera (1 or 0, when bomb explodes), bomb camera distance. |
|       | "cybsnd_debug 1" | print once per second the Allies/Axis team count (living players) and Allies/Axis team total. If these values are inaccurate, then the mod has broken somehow (wait for the next the round, or reload the map). |
| exec cvars/coord_pointer.scr      | "coord_pointer [27 or Searingwolfe]" | give/take a coord pointer to $player[27] or the player with the name "Searingwolfe". Hold USE(e) to aim the laser, and press FIRE to iprint the origin + angle of the aimed target as integers (also prints them to console). Double click at the exact same spot (ideally in spectator or while noclipping) to print origin + angle in 3 decimal places and write to "coords.txt". Hold USE(e) + Lean Left/Right + press FIRE to teleport to the aimed target location (iprints coords, but does not write to "coords.txt"). 
| exec cvars/entity_pointer.scr      | "entity_pointer [27 or Searingwolfe]" | give/take an entity pointer to $player[27] or the player with the name "Searingwolfe". Hold USE(e) to aim the laser, and press FIRE to iprint the entity's info (entity must be solid): origin, angles, classname, model, entnum, targetname, target, health. scale, attached guns. Hold USE(e) + Lean Left/Right + press FIRE to teleport to the aimed target location (iprints coords, but does not write to "coords.txt"). 
| exec cvars/ubergametype.scr      | "g_ubergametype bb" | "g_ubergametype bb" = Base-Builder gametype. |
|       | "g_ubergametype cyb" | Cyber Attack gametype. |
|       | "g_ubergametype snd" | Search & Destroy gametype. |
|       | "g_ubergametype ft" | Freeze-Tag gametype. |
|       | "g_ubergametype 0" | regular TDM or FFA (based on "g_gametype"). |
|       | "g_ubermods 2" | default, all UBER mods enabled. |
|       | "g_ubermods 1" | No crates or teles, fewer triggers for multiplayer maps. Crates & teles, but no extra mods for singleplayer maps. |
|       | "g_ubermods 0" | all UBER mods disabled. |
|       | "g_throwingknives 1" | all players spawn with 1 throwing knife (hold USE + FIRE to throw), and 4 extra knives spawn around the map. |
|       | "g_throwingknives 0" | no throwing knives. |
|       | "g_uberhardcode 1" | force all maps to use the g_ubergametypes found in "global/uberversion.scr", and disable "g_ubergametype" cvar. |
|       | "g_uberhardcode 0" | re-enable the "g_ubergametype" cvar. |
|       | "g_deathcam 1" | enable deathcams; players will spectate their killers for a few seconds. |
|       | "g_deathcam 0" | disable deathcams; players will stay at their dead bodies as normal. |
|       | "time 1" | print the map's time remaining (in minutes:seconds format). |
|       | "score 1" | print each player's kills and deaths, along with their $player[client num] and netname. |
|       | "teams 1" | print each player's current team (allies, axis, spectator, or free-for-all if "g_gametype" = 1) and their $player[client num] and netname, and then print the total number of players on each team. |
| exec cvars/adminstuff.scr      | "hacker_kill 27" | continuously kill $player[27], or other $player[numbers]. |
|       | "hacker_kill Searingwolfe" | continuously kill the player with the name "Searingwolfe", or other named players. |
|       | "hacker_takeall [27 or Searingwolfe]" | continuously take all their weapons. |
|       | "spectator [27 or Searingwolfe]" | continuously force them into spectator. |
|       | "votekick [27 or Searingwolfe]" | all players vote to kick: Hold USE(e) key + Lean Left = VOTE NO (default), Hold USE(e) key + Lean Right = VOTE YES. |
|       | "noclip2 [27 or Searingwolfe]" | noclip them around the map; still works if "cheats" = "0". |
|       | "nodamage [27 or Searingwolfe]" | make them take no damage. |
|       | "takedamage [27 or Searingwolfe]" | make them take damage again. |
|       | "show [27 or Searingwolfe]" | make them visible again. |
|       | "hide [27 or Searingwolfe]" | make them invisible. |
|       | "wuss2 [27 or Searingwolfe]" | give them all weapons; still works if "cheats" = "0". |
|       | "addkills [27 or Searingwolfe]" | give them +1 kill. |
|       | "adddeaths [27 or Searingwolfe]" | give them +1 death. |
|       | "subtractkills [27 or Searingwolfe]" | give them -1 kill. |
|       | "subtractdeaths [27 or Searingwolfe]" | give them -1 death. |
|       | "coord2 1" | print $player[1]'s coords & angles to a "main/cvars/coords.txt" file (must create this file for "coord2" CVAR to work) in "( 0 0 0 ) ( 0 0 0 )" coords/angles format on a new line. |
|       | "coord2 entity" | print "( 0 0 0 ) ( 0 0 0 )" coords/angles format on a new line. |
|       | "coord2 trigger" | print "( 0 0 0 ) " coords format on the same line. |
|       | "coord2 spawn" | print ""0 0 0" "angle" "0"" coords format on a new line. |

- For "players same name" fix: add admin's IPs at top of "adminstuff.scr", to give admins name-changing priority.

#

# Essential CYBER ATTACK / SEARCH & DESTROY / FREEZE TAG Info

The popular Cyber Attack and Search & Destroy game modes from Call of Duty: Modern Warfare 2 (2022) have been ported into MOHAA for 2023.<br>
The gameplay, rules, and conditions to win/lose in this mod are almost identical to the originals.<br>
Both game modes use "g_gametype 2" or team deathmatch, but killed players go to team-only spectator instead of respawning.<br>

In Cyber Attack, dead players are frozen like in Freeze Tag and other teammates can revive them (there are no long-range melt lasers in Cyber Attack).<br>
In Search & Destroy, dead players cannot be revived. Bombsites and an explosive are also on the map, allowing a team to blow up the other team's bombsite to win the round.<br>
Teams in both game modes have a specified amount of rounds to win (5 by default) before the map ends or until the map time limit runs out. Specific rules below.

---------------

- When the map loads, the first round begins after a few seconds (8 by default). Until the round begins, the bomb cannot be picked up, and all players can respawn after dying.<br>
- Once started, the bomb and bombsites become triggerable. Any players that die will go to team-only spectating mode (not actually in spectator), and a frozen body will appear where players died if playing Cyber Attack.<br>
- These frozen players can only be melted by their teammates, similar to Freeze Tag.<br>
- When revived, the melted player is respawned and teleported back to where they were frozen, only after all other players have moved far enough away from your frozen body (prevents players getting stuck inside each other).<br>

- While in team-spectating mode and waiting to get melted in Cyber Attack, or waiting for the next round in Search & Destroy, the spectating player can cycle between any living teammates or frozen dead bodies, with FIRE key (cycle forward) or USE key (cycle backward).<br>
- If the enemy team wins while your teammates are spectating, all team-spectators will begin spectating the enemy team until the next round begins (usually 3 seconds total).<br>
- If somehow all players are dead (round was a draw), then team-spectators will all teleport to and be trapped within their frozen body's beams until the next round begins.

- If a team wins but there are no players on the other team, scorepoints will not be added. A bomb (thread) and at least two bombsites (waitthreads) are added in the main map script.<br>
- If a bomb-carrying player dies, the bomb drops to the ground. If a bomb-carrying player leaves or changes teams or goes to spectator, the bomb respawns back to the origin it was last picked up at.

- Cyber Attack:
	- This game mode is best played on DM maps, since bombsites switch team defenders every 3 rounds. Each team has a bombsite to defend at all times, ideally placed near opposite corners of the map in DM maps or near team spawnpoints in OBJ maps.<br>
	- The Allies bombsite is blue-lit and the Axis bombsite is red-lit. The radiobomb is ideally spawned near the middle of the map. Both teams must find the purple-lit bomb and plant it on the opposite team's bombsite. The bomb takes 1.5 seconds to plant/defuse.<br>
	- If defused by the enemy team, the defusing player receives the radiobomb, ready to be planted on the enemy team's bombsite. To win, players must kill all enemies or plant and destroy the enemy's bombsite.<br>
	- Every 3 rounds, the bombsites "change sides": all Allies bombsites become Axis, and all Axis bombsites become Allies.

- Search & Destroy:
	- This game mode is best played on OBJ maps, so the bomb can always spawn near the planting team's spawnpoints.<br>
	- Depending on "level.changesides" (0 or default = Allies plant first, 1 = Axis plant first), one team has two bombsites to find and defend, while the other planting team must find and destroy a bombsite.<br>
	- These bombsites are ideally placed near the center of the map where both teams clash in gun battles the most, but kept far enough away from each other so the defending team cannot defend both bombsites with one player simultaneously.<br>
	- The bomb is ideally spawned near the planting team's spawnpoints, whose origin changes when the planting team changes. The bomb cannot be picked up by players on the defending team. The bomb takes 4.5 seconds to plant/defuse.<br>
	- If defused by the enemy team, the defusing team wins immediately. To win, players must kill all enemies, plant and destroy the enemy's bombsite, or defuse the enemy's bomb.<br>
	- Every 3 rounds, the bombsites "change sides": the planting team becomes defenders, the defending team becomes planters, and all bombsites change teams accordingly.

- Freeze Tag:
	- This game mode is an almost identical replica of Mefy's Freeze Tag. Unlike Cyber Attack where melted players respawn back to their dead bodies, Freeze Tag simply respawns the melted players.<br>
	- There are no bombs or bombsites in Freeze Tag, so any "bombsite" or "bomb" threads are ignored by the script (still requires running the main script, or running "......scr::main" to run this game mode).<br>
	- After the round begins, the 1st team to kill all enemy players wins the round.

---------------

- bombsite:
	- Parameters: origin, angle, team.<br>
	- Make sure these are waitthreads, so the bombsite's targetname can increment after a previous bombsite has finished spawning.<br>
	- The "team" parameter only applies to Cyber Attack, since "level.changesides" will determine the team for both bombsites in Search & Destroy.<br>
	- Both teams in Cyber Attack can have more than 1 bombsite if desired, but make sure they have at least 1 bombsite. Search & Destroy can also have 1, 2, or more bombsites since team parameter is ignored.<br>
	- Run "exec global/cyberattack_searchdestroy.scr" after level waittill spawn and after all cyberattack_searchdestroy.scr threads run. Example below:

			waitthread global/cyberattack_searchdestroy.scr::bombsite ( -1210 485 168 ) -90 axis // team parameters can be removed for search & destroy.
			waitthread global/cyberattack_searchdestroy.scr::bombsite ( 1297 2461 672 ) 90 allies

- bomb:
	- Parameters: Allies origin, Allies angle, Axis origin, Axis angle, central origin, central angle. Both Allies and Axis origins/angles are for Search & Destroy only.<br>
	- The central origin/angle is for Cyber Attack only. The bomb color is always blue when Allies are planting, and red when Axis are planting in Search & Destroy. Only spawn in one bomb per map.<br>
	- If only using Cyber Attack, for example, then don't forget the other parameters (just keep them 0). Examples below:

			thread global/cyberattack_searchdestroy.scr::bomb ( -153 1445 96 ) 180 ( -153 1445 96 ) 180 ( -153 1445 96 ) -90 	// cyb & snd
			thread global/cyberattack_searchdestroy.scr::bomb ( 0 0 0 ) 0 ( 0 0 0 ) 0 ( -153 1445 96 ) -90 			// cyber attack only
			thread global/cyberattack_searchdestroy.scr::bomb ( -153 1445 96 ) 180 ( -153 1445 96 ) 180 ( 0 0 0 ) 0 		// search & destroy only only

---------------

- level.round_starttime:
	- 8 seconds default.
	- This variable determimes the time in seconds until the round begins, disabling respawning and forcing dead players to spectate their teammates until the next round begins.<br>
	- Waiting a few seconds for a new round to begin serves as a temporary spawn protection. 

- level.rounds_towin:
	- 5 rounds to win default.
	- This determines how many rounds a team must obtain before winning and ending the map, allowing a winning game to be as close as 5 to 4 points by default.

- level.changesides:
	- 0, Allies plant first default.
	- This can only be 0 or 1, where 1 = Axis plant first (for Search & Destroy).<br>
	- If playing Cyber Attack, setting level.changesides = 1 will flip the bombsite's defending teams to the opposite teams initially.<br>
	- Every 3 total rounds, level.changesides toggles from 1 to 0 or from 0 to 1. 

- level.keepsamesides:
	- 0, no nothing default.
	- If set to 1, level.changesides will never increment, mainly for OBJ & singleplayer maps (bomb & bombsites will not change teams every 3 rounds).

- level.spectators_jointeams:
	- 0, do nothing default.
	- If set to 1, all actual spectators will be forced to auto-join teams and be given a machine gun, pistol, and grenades when the round begins.<br>
	- If those players are still AFK, they'll eventually get killed and placed into team-spectating mode until the next round begins.

- level.bombcamera:
	- 0, do nothing default.
	- If set to 1, when a bombsite is about to explode, all players' cameras are moved to the bombsite to view the explosion, before returning all cameras back to their respective players' heads after a few seconds.<br>
	- While viewing the explosion, players cannot see or kill each other.

- level.cameradistance:
	- 200 default.
	- This determines the distance between a bombsite and all players' cameras when the bombsite blows up.<br>
	- Some bombsites are indoors. If the camera is inside the wall or the bombsite is invisible during explosion, this variable should be lowered.

- level.melttime:
	- 3 seconds default.
	- This determines the time in seconds for a player to melt/revive a teammate.<br>
	- Note: there's always roughly a half-second extra time required for all players to move away from the melted/revived teammate, before he respawns.

- level.meltrespawn:
	- 0, respawn melted/revived players back to their frozen bodies default.
	- If set to 1, then all players that get melted/revived will not tele back to their dead bodies (regular respawn instead).<br>
	- This = 1 by default for Freeze Tag only, unless specified as level.meltrespawn = 0.

- level.meltlaser:
	- 0, laser beam is invisible default (Freeze Tag only).
	- If set to 1, all players' melting laser beams (when holding USE key) are visible.

---------------

Example threads for adding the UBER gametypes to a new map script.<br>
For adding Freeze Tag UBER, simply run the "cyb" or "snd" thread before "level waittill spawn", and the script will ignore the "bombsite" and "bomb" threads automatically.

	cyb:

	level waittill spawn

		level.round_starttime = 8
		level.rounds_towin = 6
 		level.changesides = 0
		level.keepsamesides = 1
		level.bombcamera = 1

  		waitthread global/cyberattack_searchdestroy.scr::bombsite ( -2492 7021 86 ) 0 axis    // for cyber attack only
  		waitthread global/cyberattack_searchdestroy.scr::bombsite ( -2979 -32 -23 ) 0 allies

  		thread global/cyberattack_searchdestroy.scr::bomb ( 0 0 0 ) 0 ( 0 0 0 ) 0 ( -582 2750 -23 ) 0
									
		exec global/cyberattack_searchdestroy.scr
	end

	snd:

	level waittill spawn

		level.round_starttime = 8
		level.rounds_towin = 6
 		level.changesides = 0
		level.bombcamera = 1

  		waitthread global/cyberattack_searchdestroy.scr::bombsite ( -4895 1763 -23 ) -90    // for search & destroy only, team parameter doesn't matter
  		waitthread global/cyberattack_searchdestroy.scr::bombsite ( 1056 2268 -23 ) 90

  		thread global/cyberattack_searchdestroy.scr::bomb ( -1520 -292 41 ) 180 ( -1989 6692 -25 ) 0 ( 0 0 0 ) 0
									
		exec global/cyberattack_searchdestroy.scr
	end

---------------

When Search & Destroy games changes sides (every 3 rounds), the bombsites' origins do not normally change.<br>
This example thread below for "snd" moves both bombsites to new origins each time "level.changesides" changes (so both bombsites are closer to defending team's spawn).

	snd:

	level waittill spawn

		level.round_starttime = 8
		level.rounds_towin = 6
	 	level.changesides = 0
		level.bombcamera = 1
		//level.cameradistance = 200 // this can be changed for each "changesides" if a bombsite is inside a small room, so the camera is not inside of a wall

		if(level.changesides == 0) // allies are planting (axis bombsite origins)
		{
	  		waitthread global/cyberattack_searchdestroy.scr::bombsite ( 1556 7363 -31 ) -90		// for search & destroy only, team parameter doesn't matter
  			waitthread global/cyberattack_searchdestroy.scr::bombsite ( 3299 1118 474 ) 180		// make sure to include initial bombsites before the while-loop begins.
		}
		if(level.changesides == 1) // xis are planting (allies bombsite origins)
		{
  			waitthread global/cyberattack_searchdestroy.scr::bombsite ( -2454 -2732 452 ) 0
  			waitthread global/cyberattack_searchdestroy.scr::bombsite ( 737 622 489 ) 90
		}

  		thread global/cyberattack_searchdestroy.scr::bomb ( -2342 -2934 488 ) 90 ( 3389 6515 -63 ) 180 ( 0 0 0 ) 0
		exec global/cyberattack_searchdestroy.scr // begin the main script

	//-----------------------------------------------------------------------------

		local.sides = level.changesides	// when the sides change each 3 rounds, old bombsites are removed and 2 ones are added closer to the defending team's spawn.
		while(1)
		{
			if(level.changesides != local.sides)
			{
				waitthread global/cyberattack_searchdestroy.scr::bombsites_remove

				if(level.changesides == 0)
				{
  					waitthread global/cyberattack_searchdestroy.scr::bombsite ( 1556 7363 -31 ) -90
  					waitthread global/cyberattack_searchdestroy.scr::bombsite ( 3299 1118 474 ) 180
					//level.cameradistance = 150
				}
				if(level.changesides == 1)
				{
  					waitthread global/cyberattack_searchdestroy.scr::bombsite ( -2454 -2732 452 ) 0
  					waitthread global/cyberattack_searchdestroy.scr::bombsite ( 737 622 489 ) 90
					//level.cameradistance = 200
				}
				local.sides = level.changesides
			}
			waitframe
		}
	end

- Modders can assign UBER gametypes for different maps in a single map rotation in "global/uberversion.scr", but this will disable the "g_ubergametype" cvar since they will be hard-coded in the list.
- Modders can change default player running speed for all maps in "global/uberversion.scr".

- Type "g_uberhardcode 1" into console to force all maps to use the g_ubergametypes assigned in "global/uberversion.scr".
- Type "g_uberhardcode 0" into console to re-enable the "g_ubergametype" cvar.

#

# Killstreak Rewards

- Killstreaks only work in MOHAA Reborn 1.12.

- Killstreak count increases as a player gains kills without dying. Whenever a player dies or changes teams, their killstreak count reverts to 0 again.<br>
- Killstreak damage handler ensures that scorepoints are properly given to killstreak owners, or to enemies that destroy the killstreaks and kill other players.<br>
- Scorepoints are also properly given during chain-reaction explosions, such as a mine destroying another mine before killing an enemy player.<br>
- If a players' killstreak still exists and that player changes teams or leaves the game, the killstreak is removed immediately.

- 4 killstreaks added, more coming soon: 2 claymores (3 kills), airstrike (5 kills), cluster mine (7 kills), sentry turret (9 kills).<br>
- To use killstreaks: hold USE(e) + lean left/right to show the killstreak and begin placing.<br>
- To place killstreaks: hold USE(e) + FIRE(right click) to place down the killstreak.

- Claymores:
	- Lasers point toward enemies.
	- All enemy players (including the claymore-owner, but not his allies) that run too close to a claymore will be killed within 150 degrees from forward.<br>
	- If an enemy shoots the claymore, the claymore-owner and his allies standing too close can be killed within all 360 degrees.<br>
	- Claymores remain on the map after the player_owner dies, but disappear after the player_owner respawns.

- Sentry Turret:
	- Rotates continuously.
	- The closest enemy player to the turret will be locked-on (within 120 degrees) for 1 second before firing until the enemy player goes out of sight or dies.<br>
	- Enemies can destroy the sentry turret with explosions, grenades or rockets (bullets do not deal damage).<br>
	- Sentry Turrets stay on the map after the player_owner dies and respawns. These will disappear after 180 seconds if not destroyed.

- Cluster Mine:
	- 5 additional mines fly out from center.
	- Similar to claymores, but without lasers and capable of killing enemies within all 360 degrees. These can also be shot and destroyed.<br>
	- Cluster mines stay on the map after the player_owner dies and respawns.

- Airstrike:
	- Mark the center-point location and the direction of the airstrike's bombing run, before launching the airstrike.<br>
	- Laser arrows indicate the direction that airstrike planes will follow. Bombs drop from the planes continuously (traveling -8200 to 8200 units from player's origin, 16400 units total).<br>
	- Dropped bombs that kill players count as scoreponts and cannot damage teammates (but can kill them if driving vehicles).<br>
	- The airplanes can only be shot down by enemy players after shooting them 8+ times. Any crashing planes can kill any players.

---------------

- Place any script examples before "level waittill spawn". Change "kills" parameter as needed (number of kills in a killstreak, without dying or changing teams).<br>
- Additional level parameters such as "damage", "radius" (radius of damage and distance to trigger explosions), triggering field-of-view in degrees, scale of claymore/mine,<br>
velocity of additional mines spawned, bullet damage for sentry turrets, turret lock-on delay in frames, and maximum lock-on distance, can be edited at the top of each killstreak script.

		Claymores Parameters: number of kills, number of claymores given (max = 5).
		Claymores Example: exec killstreaks/claymores.scr 3 2

		Sentry Turret Parameters: number of kills, time until sentry turret dies.
		Sentry Turret Example: exec killstreaks/sentry_turret.scr 6 90

		Cluster Mine Parameters: number of kills, number of additional mines spawned (max = 15).
		Cluster Mine Example: exec killstreaks/cluster_mines.scr 9 5

		Airstrike Parameters: number of kills, number of bullets to kill a plane, map height (40 below skybox ceiling; all modded maps have pre-defined map heights, so "map height" can be left empty).
		Airstrike Example: exec killstreaks/airstrikes.scr 5 8

#

# Drivable Vehicles / Usable Statweapons

- global/playerboat.scr & global/playertank.scr & global/playervehicle.scr.
- Place any script examples before "level waittill spawn". Change coords & angles as needed.

- Available drivable tanks: kingtank, panzer_tank, panzer_tank_europe. (tigertank & tigertankdsrt cannot be driven, since turret model completely blocks player's screen).
- Available drivable boats: higginsxtrahull (higgins boats), uboat.
- Available drivable vehicles: bmwbike, european_car_grey, european_car_silver, european_car_tan, european_delivery_truck_green, european_delivery_truck_grey, european_delivery_truck_red3,
gmctruck, jeep, jeep_bench, m3, mercedes, opeltruck, opeltruckgreen, opeltruckgreen_canopy, sdkfz, sdkfz_afrika, shermantank.

- Passenger seats per vehicle (not including driver seat); can only carry teammates (none if in Free-For-All):
- 2 for bmwbike & jeeps, 3 for european_cars & european_delivery_trucks & mercedes, 4 for gmctrucks & opeltrucks & sdkfzs & m3s, 1 for shermantank, 9 for higgins boats, 5 for uboats.

- For Reborn:
	- For drivable vehicles: Hold FIRE = look behind, Press JUMP = exit, Lean Left = honk horn, Lean Right = turn on/off headlights, only if "noheadlights" parameter != 1.
	- For drivable tanks: Press FIRE = shoot turret, Press JUMP = exit, Hold USE(e) for 3+ seconds while not moving the tank or turret to slowly repair tank's health.
	- For drivable boats: Hold FIRE = look behind. Press JUMP = exit, Lean Left/Right = close/open higgins door.
	- For drivable uboats: Primary FIRE = shoot tank shell, Secondary FIRE = throw grenade, Press JUMP = exit, Lean Left/Right (while not moving) = look behind, Lean Left/Right (while moving) = aim up/down the tank shell's trajectory.

- For AA-SH-BT:
	- For drivable vehicles: Hold FIRE = look behind, Press JUMP = exit, press A (left key) = honk horn, press R (right key) = turn on/off headlights, only if "noheadlights" parameter != 1.
	- For drivable tanks: Press FIRE = shoot turret, Press JUMP = exit, Hold USE(e) for 3+ seconds while not moving the tank or turret to slowly repair tank's health.
	- For drivable boats: Hold FIRE = look behind. Press JUMP = exit, press A - D (left-right keys) = close/open higgins door.
	- For drivable uboats: Primary FIRE = shoot tank shell, FIRE + USE(e) = throw grenade, Press JUMP = exit, press A - D (left-right keys) = aim up/down the tank shell's trajectory.

- Drivable tanks now have an additional 30cal turret gun seat, allowing a 2nd player to shoot the 30cal while the tank driver uses the main tank turret.
- Drivable jeeps & SDKFZ halftracks also have a 30cal turret gun seat. Players using the 30cals can be shot at or killed by explosions, without necessarily destroying the vehicle.

- Players using drivable vehicles & boats can be shot and killed by enemy players (not including SDKFZs). Given the math behind the damage dealt to drivers, all passengers will likely be killed first before the driver does.
- Players using drivable vehicles & boats can see a secondary health bar, representing their actual player's health (when in vehicles/boats/tanks, the health bar changes to the vehicle's health).
- Players using drivable tanks can now see a secondary health bar, representing the tank's current health (the health bar always starts at 100 when entering tanks, even though the tank & driver have different healths).
- Tanks will emit smoke if they are damaged. The smoke's scale increases as the tank's health decreases.

		Tank Parameters: targetname (must not exist yet), model path, origin, angles, health, reset time.
		Tank Example: exec global/playertank.scr tank01 vehicles/panzer_tank_europe.tik ( -680 2788 -257 ) ( 0 270 0 ) 1000 60

		Vehicle Parameters: targetname (must not exist yet), model path, origin, angles, health, vehicle speed, reset time, initial headlights (0 = off, 1 = on), no headlights (1 = keep them off).
		Vehicle Example: exec global/playervehicle.scr jeep vehicles/jeep.tik ( -2541 2297 -255 ) ( 0 40 0 ) 250 400 45 1

		Boat Parameters: targetname (must not exist yet), model path, origin, angles, health, vehicle speed, reset time, boat scale.
		Boat Example (a): exec global/playerboat.scr boat1 vehicles/higginsxtrahull.tik ( -6415 -3016 -380 ) ( 0 173.5 0 ) 250 250 45
		Boat Example (b): exec global/playerboat.scr boat2 vehicles/uboat.tik ( -913 3598 -400 ) ( 0 -90 0 ) 250 40 45 1.0

---------------

- global/playerflak88.scr & global/playernebelwerfer.scr<br>
- Place any script examples before "level waittill spawn". Change coords & angles as needed.

- Press FIRE = shoot projectile. Press JUMP = exit. Hold Secondary FIRE(zoom) = look around. For nebelwerfers: Secondary FIRE(zoom) = reload (Non-Reborn: FIRE + USE(e) = reload).

- With these two global scripts, players can now get into, rotate, and shoot with the flak88s & nebelwerfers (mainly for Allied Assault).<br>
- The flak88s shoots one shell before waiting 5 seconds to reload. Player is invisible and cannot be killed unless the flak88 is destroyed.

- The nebelwerfers shoot 6 rockets before waiting 6 seconds to reload. Player is visible and can be shot or killed without destroying the nebelwerfer, or killed after it is destroyed.<br>
- After a specified amount of reset time, both scripts reset the destroyed turrets back to their initial states.

- Flak88 shells and nebelwerfer rockets will not kill teammate or vehicles that they're riding in.<br>
- Firing the nebelwerfer rockets too close to the nebelwerfer could blow it up and kill the turret player.

- To prevent the turrets from ever resetting, set the reset time to 99999.<br>
- Ideally, health should be 250, so only two grenades or a direct shotgun blast can destroy the turrets (damage scale below):<br>
shotgun: 340 damage, bazooka: 105 damage, sniper: 106 damage, one grenade: 200 damage, two grenades: 400 damage.

		Flak88 Parameters: existing flak88 targetname (NIL, if spawning a new one), health, reset time, new flak88 origin, new flak88 angles, remove turret base (0 = no, 1 = yes), turret base angles (if NIL, default = flak88 angles)
		Flak88 Example (a): exec global/playerflak88.scr $flak88_weapon1 250 60
		Flak88 Example (b): exec global/playerflak88.scr NIL 250 60 ( 2150 3700 -253 ) ( 0 0 0 ) 0 ( 0 90 0 )

		Nebelwerfer Parameters: existing nebelwerfer targetname (NIL, if spawning a new one), health, reset time, new nebel origin, new nebel angles
		Nebelwerfer Example (a): exec global/playernebelwerfer.scr $nebelwerfer_1 250 60
		Nebelwerfer Example (b): exec global/playernebelwerfer.scr NIL 250 60 ( 859 186 282 ) ( 0 -90 0 )

#

# Singleplayer Maps Mods

Singleplayer maps finished so far: Training, M1L1, M1L2A, M1L2B, M1L3A, M1L3B, M1L3C, M2l1, M2l2A, M2L2B, M2L2C, M2L3, M3l1A, M3L1B, M3L2, M3L3, M4L0, M4L1, M4L2, M4L3, M5L1A, M5L1B, M5L2A.

---------------

- Training fully modded [See READMES old/README 4 (training map mods).txt for mod-specific info].
- g_ubergametype "0" or "": Main Training script mods, where blowing up the tank unlocks doors to the 1st gunrange, doing 4 objectives unlocks the 2nd gunrange, doing 2 more spawns the final key for the final door.
- in the training.scr script, exec maps/training_mapscripts/tank_m3_replace.scr drive, the "drive" can be replaced with "static" for a nondrivable tank, spawning Allies explosives for them to blow up the tank.

- g_ubergametype "bb", "cyb", "snd", "ft": all doors are unlocked, all crate stairs now visible, all player spawns are enabled.
Almost all mods are removed except for the drivable tanks and valve switches for moving tables behind the final gunrange.

- g_ubergametype "bb": teles, crates, and tables added for going behind walls, moving around behind walls.

- g_ubergametype "cyb", "snd", or "ft": no teles for going behind walls or objects behind them, all decoration objects now visible.
Some mods added: airstrike radio triggrs, fire field detonators, field bombs detonator, trench bombs alarm switches, radio music triggers, truck/halftrack sound triggers.

---------------

- M1L1 fully modded. Crates, teles, tables added to walk inside of most buildings, on their rooftops, or on stairs between rooftops, including on top of the Axis-side tower and the Allies-side light house (tele to it behind the Axis spawn).
- 2 drivable tanks (one arrives with vehicle convoy), one drivable opeltruck & jeep & bmwbike, one Radiobomb Walkie, and 2 throwing knives on the map initially.

- 3 sets of bangalore wallbombs that can blown up from alarm-switches: behind the Axis-side crate room, inside the Axis-side crate room, and inside the Allies-side tan building.
- Various doors and metal gates can be opened/closed, including the 2 shutters in the 2nd story mg42 building.

- The Axis-side ceiling before the 2nd story mg42 building can be blown up with a Giant Bomb or a Radiobomb Walkie.
- Simplified Allies/Axis airstrikes added (every 2 mins, 30 secs), since entity count is already approaching 700+ after adding the 3 splinepaths needed for the vehicle convoy.

- M1L1 Vehicle Convoy arrives after 90 seconds: opeltruckgreen_canopy, opeltruck, and panzer_tank_europe following the street path from the Allies side. Opeltruckgreen_canopy has another Radiobomb Walkie and 2 extra throwing knives.
The green opeltruck cannot be destroyed or driven (hold USE near driver door for 3 secs to turn on truck, then hold USE for 1 sec to honk horn).
- Regular opeltruck explodes before parking near the tan building. The panzer_tank_europe's turret looks at the explosion while turning to the left, before rotating the turret back forward, parking, and becoming a 2nd drivable tank.

For all modded maps so far:
- Player spawns added and distributed more widely across the Allies/Axis spawns.
- Invisible solid walls added to prevent players from hiding inside walls and shooting players through them in common camping spots.
- Fell-under-map teles added at all areas where players can get trapped or walk under parts of the map.
- Cyber Attack and Search & Destroy bombs and bombsites added to the map. Base-Builder objects reorganized. Mini-flak88 flamethrower build-objects added for UBER BASEBUILDER; build-objects reorganized.
- Most teleporters, objects, and spotlights are removed for UBER BASEBUILDER to minimize maxentities & maximize number of build-objects that can be placed.
- For some large maps: bombsites in Search & Destroy will move closer to defending team's spawn each time the gamemode changes sides (when "level.changesides" changes).

---------------

- M1L2A fully modded. Crates, teles, tables added to walk inside of most buildings, on their rooftops, or on stairs between rooftops.
- One drivable king tank, one drivable opeltruck, 2 drivable bmwbikes, one drivable jeep, 2 usable flak88s, 2 Radiobomb Walkies, and 4 throwing knives on the map.
- The Axis main building has 3 auto-spotlights, each scanning on their own path. If a player gets too close to a beam, the spotlight follows the player until he goes out of sight.
Any player that goes near the spotlight itself instantly converts it into a regular spotlight, following the player's viewangles. If that player moves away, the spotlight returns to an auto-spotlight (also turning back on).
- 2 alarm switches for controlling all auto-spotlights' colors on Axis main building roof: turn on rapidly changing rainbow colors, or turn on slower changing rainbow colors.

- 3 sets of bangalore wallbombs with 2-way switches: long zig-zag hallway, outside flak88 building, outside Axis main building.
- 6 individual bangalore wallbombs: SAS building, cots building, outside tan bunker, 2 single-rooms Axis main building, one single-room near flak88s.
- Various doors and large wooden gates can be opened/closed, including large wood doors in Allies spawn (laser door outlines & tables behind them) and SAS building's vault door.
- The 3 chairs in the SAS building ground floor can be blown backwards with any grenade or explosion. 2 cabinet switches and a radio music trigger in the SAS building.

- The explosives room in the basement of the Axis main building can be blown up with a Giant bomb or a Radiobomb Walkie.
- The large wooden doors with horizontal lasers and explosives on the ground (near flak88s) can be blown up with a grenade or any other explosion.
- Complex Allies/Axis airstrikes added (Allies: 3 mins, Axis: 3 mins 10 secs), where each plane has its own splinepath and bombdrop coords.

---------------

- M1L2B fully modded. Crates, teles, tables added to walk inside of most buildings, on their rooftops, or on stairs between rooftops.
- 3 drivable tanks, 2 drivable opeltrucks, one drivable jeep, 2 Radiobomb Walkies, and 4 throwing knives on the map.
- There are 3 auto-spotlights in the Axis spawn, and 1 auto-spotlight in the middle of the map, each scanning on their own path.
- 2 alarm switches for controlling all auto-spotlights' colors behind the middle auto-spotlight: turn on rapidly changing rainbow colors, or turn on slower changing rainbow colors.

- 2 sets of bangalore wallbombs with 2-way switches: Allies 3-door truck garage, Axis office building.
- 2 individual bangalore wallbombs: wooden door in the Allies-side single garage, open door in the Axis-side green opeltruck garage.
- Lasers for indicating the edges of the wide invisible roof above the Axis office building.
- The Axis-side static opeltruck can be turned on: hold USE near the driver door for 3 secs to turn on/off truck, hold USE for 1 sec to honk horn, hold USE for 1-2 secs to turn on/off headlights.
- The red wire in the 3 open-hood opeltrucks (looping an idle-truck sound) can be shot at, breaking the wire and turning off the truck. For open-hood opeltrucks: hold USE for 1 sec near driver door to honk horn.
- Vehicle teleporter on the Allies-side fence allows vehicles and tanks to move through the fence by running through the 3 wide red lasers (green briefly if teleporting succeed, flashes white if shot at).
- One cabinet switches and 3 radio music triggers in the Axis office building.

- The Axis side panzer tank and its turret on the crane can be blown up with a tank, a Giant Bomb, or a Radiobomb Walkie.
- The green grenade ammobox crate near the green-canopy opeltruck can be blown up with a grenade or any other explosion.
- Allies/Axis airstrikes added (Allies: 3 mins, Axis: 3 mins 10 secs); each pair of planes flies on the same splinepath but start on opposite ends (different dropbomb coords).

---------------

- M1L3A fully modded. 3 tanks, 7 drivable vehicles, and 4 flyable plane triggers added to the map. 2 sets of radiobomb-walkies, 4 extra throwing knives also added.
- Laser roads across the back edge of the map allow vehicles via ramps to drive on/off the main part of the map, also connecting to the road at the far end of the map.
- Any vehicle/tank that falls off the laser road, or is somehow pushed outside of the map, will explode.
- NOTE: Tank treads should be roughly horizontal before going onto the laser road, otherwise the tank could fly up into the sky and explode!
- NOTE: Players driving some vehicles with windshields (such as mercedes), cannot see any lasers through the windshield.

- Some teles allow players to stand on rock cliffs or platforms on top of large rocks, to shoot players from high above them.
- Alarm switches in the dead-end halls behind the openable doors each blow up a bangalore outside the door.

- New airstrikes script (global/bomberplane.scr) simplifies adding them into maps. Only a splinepath is needed; bomb drop coords are automated and drop closer to splinepath's central line.

		Parameters: path targetname, team (allies, axis, c47), number of planes, off time, bombs off (0 = no, 1 = yes), amount of bombs, time until bombs drop, end (1 = only do 1 airstrike).
		Example: exec global/bomberplane.scr bomberpath allies 2 150 0 16 3.2
		Example: exec global/bomberplane.scr bomberpath allies 2 150 1

- level.bomberplane_health = 200     // these are defaults set inside global/bomberplane.scr
- level.bomberplane_bombspeed = 0.25 // speed multiplier; higher = bombs drop horizontally further away from plane's splinepath (default = 0.5)
- level.bomberplane_bombgravity = 2  // higher = bombs drop faster vertically & closer to plane's splinepath
- Allies/Axis airstrikes can also be alternated within a simple while(1) loop. Example thread is below:

	airstrikes_alternate:

		while(1)
		{
			local.r = randomint(2)
			if(local.r == 0) { waitexec global/bomberplane.scr bomberpath allies 2 150 0 16 3.2 1 }
			if(local.r == 1) { waitexec global/bomberplane.scr bomberpath2 axis 2 150 0 16 3.2 1 }
			waitframe
		}
	end

---------------

- M1L3B fully modded. 4 tanks, 8 drivable vehicles, and 4 flyable plane triggers added to the map. 2 sets of radiobomb-walkies, 4 extra throwing knives also added.
- 1 Flak88 on the Axis side, and 1 Nebelwerfer on the Allies side. 2 sets of bangalore wallbombs: 1 above the Axis red-light bunker, and two above the Allies two-door building.

- Airstrikes every 2 minutes, 50% chance Allies or Axis strike. For Allies strikes: 50% chance the planes will spawn from left or right side of the airstrip, and 33% chance for c47s flying. 

- All parked planes are destructible. The black 20mm Flak cannon's angles can be moved from 0, 30, 60 degrees by pressing USE near it, or blow it up with 2+ grenades.
- Teles allow players to walk along the entire Axis-side cliff, or on the Allies-side cliff near the back airstrip-side corner.

- Some teles allow players to stand on rock cliffs or platforms on top of large rocks, to shoot players from high above them.
- Alarm switches in the dead-end halls behind the openable doors each blow up a bangalore outside the door.

---------------

- M1L3C fully modded. 2 drivable higgins boats, and 9 vehicles added to the map. 2 sets of radiobomb-walkies, 4 extra throwing knives also added.
- 3 bangalore wallbombs in Allies spawn, and 2 sets of bangalore wallbombs in Axis spawn. No airstrikes on this map, since the road between both spawns is too skinny.
- Any players that are touching a higgins boat will not be forcibly respawned if also touching the "$ocean" trigger.

- Solid floors and walls added behind the light house to expand the Axis spawn's total area.
- The tunnel behind the light house has lasers marking the map edges, and serves as a vehicle garage for the Axis.
- The light house fence has a vehicle teleporter allowing vehicles to go through the fence. Be careful not to drive facing the cliff edge.
- Any vehicles that accidentally fall off the cliff will be destroyed.

- Elevator script reworked to operate much faster. Teles added above and below the elevator to escape if trapped in the shaft.
- Minen (entmint) bombs on the top-floor Allies spawn can be blown up with grenades.
- Looping sounds added to all transformers and the red HVAC machine in Allies spawn; transformers can also be destroyed.
- Toilets can be flushed in Allies spawn, and the dripping water spigot (bucket near it) can be turned on/off.
- Airtanks in the bottom-floor Allies spawn can be turned on/off to loop a steaming sound.
- Static opeltrucks in the bottom-floor Allies spawn can be turned on/off. While on, hold USE for 1 second to honk horn; hold USE for 1-2 seconds to turn on/off headlights.
- The lighthouse can be turned on/off with the train switch in Axis spawn.

- Some teles allow players to stand on rock cliffs or platforms on top of large rocks, to shoot players from high above them.
- Bombsites in Search & Destroy will move closer to defending team's spawn each time the gamemode changes sides (when "level.changesides" changes).

---------------

- M2L1 fully modded. 5 flyable planes, 1 flak88, 1 nebelwerfer, 4 tanks and 12 vehicles added to the map. 3 sets of radiobomb-walkies, 4 extra throwing knives also added.
- 5 bangalore wallbombs: 1 in Allies spawn, 2 in main center building, and 2 in Axis spawn. Airstrikes launch randomly between 90 and 180 seconds.
- These airstrikes use global/bomberplane_nospline.scr and require level.bomberplane_map_setsizes to be defined before running these threads, since origin & angles are randomized per airstrike.

		level.bomberplane_map_setsize1 = ( -6935 -4375 0 )	// just like a .tik file, adjust these map_setsizes so the planes aren't dropping bombs outside of the map (also includes skybox height).
		level.bomberplane_map_setsize2 = ( 5935 7415 2100 )	// start at ( 0 0 0 ) on the map. setsize1 must have - numbers, and setsize2 must have + numbers.

- The flat snow-covered cliff behind the main middle building can be driven/walked on, as well as the higher cliff next to the Allies spawn.
- Vehicle teles allow tanks/vehicles to travel across the middle fence and on top of the flat snow-covered cliff.
- The metal gate at the Allies spawn can be opened/closed from both sides using the red-pulsing train switch.
- Every 60 to 180 seconds, a train (2 to 4 train cars) quickly drives across the train tracks behind the Allies spawn, killing anyone that gets run over.

- Various looping sounds added inside the buildings for airvents, humming transformers, etc. The paper documents can be blown up with a grenade. 
- The large generator in the 2nd floor main building can be turned on/off with a nearby electrical switch. 3 radios across the map can also be turned on/off to play static or music.

---------------

- M2L2A fully modded. 3 flyable planes, 4 higgins boats, 4 uboats, 3 jetpacks, 2 flak88s, 1 nebelwerfer, 1 tank and 3 vehicles added to the map. 2 sets of radiobomb-walkies, 8 extra throwing knives also added.
- 6 bangalore wallbombs mostly in Allies spawn; 2 of these alarm switches keep a nearby red light on until the switches have reset. Airstrikes are not included in this level, since half of the level is inside.

- Drivable uboats added into global/playerboat.scr. Similar to drivable higgins boats, the uboats have 5 extra passenger seats that allow passengers to stand on the uboat's upper platforms.
- Uboat drivers can press Primary FIRE to shoot a large tank shell projectile in a horizontal line, or press Secondary FIRE to throw grenades in front of the uboat. These projectiles will not hurt teammates.

		Uboat Parameters: targetname (must not exist yet), model path, origin, angles, health, vehicle speed, reset time, boat scale.
		Uboat Example: exec global/playerboat.scr boat2 vehicles/uboat.tik ( -913 3598 -400 ) ( 0 -90 0 ) 250 40 45 1.0

- A vehicle tele (thick red lasers) allows vehicles to travel through the metal doors that separate the Allies spawn and uboat area, instead of using the single door near the ocean.
- NOTE: The walls on maps M2L2A, M2L2B, M2L2C are glitchier than normal for vehicles. Driving at an angle into walls will get vehicles stuck inside them (if player exits the vehicle inside a wall, they will auto-respawn after 3 seconds).

- The naxos prototype in the scientists' room can be blown up with grenades.
- The crane's loopsound is louder. A spotlight is mounted on the outer wall of the crane's metal basket, with nearby tele to enter/exit this basket.
- The airtanks in the bottom-floor Alies spawn can be turned on/off. Sound entities added to 6 air vents.

- Red and green lasers added to the rooftops near the ocean, indicating solid walls (green) and roof-edges that players can jump off from (red).

---------------

- M2L2B fully modded. 4 flyable planes, 4 higgins boats, 4 uboats, 4 jetpacks, 1 flak88, 1 nebelwerfer, 1 tank and 3 vehicles added to the map. 2 sets of radiobomb-walkies, 8 extra throwing knives also added.
- 4 bangalore wallbombs, 2 inside the uboat sub, and 2 between other uboat docks. 1 set of bangalore wallbombs triggered via detonator on top of the uboat sub. Airstrikes are not included in this level.

- A vehicle tele allows vehicles to travel through a metal gate to a normally inaccessable uboat dock.

- Numerous sound entities added inside the uboat sub: air vents, generators, transformers, water dripping near the toilet. Press USE(e) near the toilet to flush it. Sound entities added to 3 air vents outside the sub.
- Two radios in the uboat sub can also play music by pressing USE(e) a few times.

- Red and green lasers added to the rooftops near the ocean, indicating solid walls (green) and roof-edges that players can jump off from (red).

---------------

- M2l2C fully modded. 4 flyable planes, 5 higgins boats, 4 uboats, 5 jetpacks, 2 flak88s, 2 nebelwerfers, 1 tank and 6 vehicles added to the map. 2 sets of radiobomb-walkies, 8 extra throwing knives also added.
- 3 bangalore wallbombs, 2 in Axis spawn, 1 in Allies spawn. 2 sets of bangalore wallbombs triggered via detonator on top of both uboat subs. Airstrikes are not included in this level.

- A vehicle tele allows vehicles to travel through a metal gate to a normally inaccessable uboat dock.
- Another vehicle tele allows travel between the large white platform in the ocean and the roomy garage behind the Axis spawn. Vehicles can travel through the adjacent metal fence without teleporting.
- These are the best, most portable versions of vehicle teles. Parameters allow for any array size of lasers, teleporting alignment along X or Y axis, and teleporting speed

		Parameters: origin, setsize 1, setsize 2, laser array, teleporting alignment (NIL = none, 0 = 0-180 axis, 1 = 90-270 axis), vehicle height after teleporting (default/NIL = 0), teleporting speed (default/NIL = 25).

		Example: thread vehicle_tele ( 4193 -1119 -511 ) ( -222 -680 -10 ) ( 222 680 355 ) local.lasers 1 0 50

		local.lasers[1] = thread spawnlaser ( -1507 -6227 -511 ) ( -1507 -6227 -262 ) ( 1 0 0 ) 3 // origin, endpoint, initial color, scale
		local.lasers[2] = thread spawnlaser ( -1507 -6224 -259 ) ( -1507 -6464 -259 ) ( 1 0 0 ) 3
		local.lasers[3] = thread spawnlaser ( -1507 -6461 -262 ) ( -1507 -6461 -511 ) ( 1 0 0 ) 3
		thread vehicle_tele ( -1502 -6344 -511 ) ( -30 -115 -10 ) ( 30 115 200 ) local.lasers 0

- 4 ladders added to the 2 docked uboats for players to climb up/down them. Players must be looking directly at ladder, and must be looking up/down more than 30 degrees to climb these ladders.
- Adjust the "offset" parameter if desired, or if player is getting stuck on stuff while climbing the ladder.

		Parameters: origin, angle for players to attach, ladder setsize1, ladder setsize2, optional offset distance away from ladder (lower = players hands closer to ladder, higher = further away, default = 14). If > 18, players cannot climb the ladder.

		Example: exec global/spawnladder.scr ( -200 300 0 ) 90 ( -1 -10 0 ) ( 1 10 250 )
		Example2: local.ladder = thread global/spawnladder.scr::main ( -200 300 0 ) 90 ( -1 -10 0 ) ( 1 10 250 ) 10

- Sound entities added to 12 air vents throughout the uboat docks. Tranformer and red HVAC sounds added in Axis spawn. 3 more air vent sounds added in the vents above the Axis spawn.
- Red and green lasers added to the rooftops near the ocean, indicating solid walls (green) and roof-edges that players can jump off from (red).

---------------

- M2L3 fully modded. 4 flyable planes, 1 flak88, 1 nebelwerfer, 3 tanks, 4 vehicles added to the map. 2 sets of radiobomb-walkies, 5 extra throwing knives also added.
- 1 set of bangalore wallbombs (two-way switch) between the truck garage and Axis spawn outdoors. Airstrikes are not included in this level.

- The train's splinepath is extended along the curved railroad, and extended from the train tunnel. The tunnel itself is extended all the way to the map's edge.
- Press USE(e) near the train and the fence to ride in the train. The train moves automatically. Hold USE(e) for 1 second to exit the train (only when outside of the "player_clip" brushes).
	- Any players that exit the train while it's moving will appear on top of the train. Press USE(e) while looking down to re-enter the train. Walking too close to the edge of a moving train will kill the player.
	- When the train arrives and fully stops, all players inside the train-front and the train cab will automatically exit the train and teleported to the ground.
	- Players/vehicles/tanks that touch the moving train will be killed/destroyed.
- Up to 2 players (teammates only, does not work in FFA) can ride in the front of the train (the bp44train.tik model), and they must hop in before the train is moving too fast.
	- The 2 train-front riders can shoot from the train's windows, and aim by holding FIRE(zoom). These players can be shot/killed by other players shooting at the train's windows too.
- Up to 20 players (5 rows, 4 columns) can ride in the train cab, regardless of teammates. The riders can shoot and aim by holding FIRE(zoom), or exit the train cab by holding USE(e).
	- When train starts moving (only when a player gets into the train-front, the bp44train), all players inside the train cab will be locked into 1 of 20 available seats.
	- If all seats are filled, the extra players are teleported back outside of the cab on the ground.
	- If players on opposite teams are riding in the train cab together, anywhere they shoot will cause damage to their riding enemies since the damage-respoding trigger covers the whole cab's interior.
	- The train cab rider in the 1st seat (middle row, closest to door) can toggle opening/closing the solid traincab door by Leaning Left/Right
	- If the train cab door is closed, players inside the cab cannot be shot/killed or shoot/kill others.

- 2 vehicle teles for vehicles to enter/exit the truck garage. Various extra roads outlined by lasers spawned in extra map areas.
- Other lasers on the rooftops help prevent players from falling off edges.

- Thick green lasers on the ground outline "player_clip" brushes from the map's .bsp (brushes cannot be removed), since players cannot walk through them.
- Vehicles/tanks can drive through them, but players that exit them while inside these brushes will get trapped (respawned after 3 seconds).
- Building rooftops and ledges are solified with "script_origin"s and accessible via teles from the ground (glitching can occur when standing still. To reduce entity count, smaller "script_model"s were not used).

- Numerous sound entities added throughout the Allies spawn and truck garage: 3 generators, 16 transformers, 8 air vents.

---------------

- M3L1A fully modded. 5 flyable planes, 2 jetpacks, 2 flak88s, 2 nebelwerfers, 4 tanks, 2 boats added to the map. 2 sets of radiobomb-walkies, extra throwing knives not added.
- 1 bangalore wallbomb at the trench bunker entrance. Airstrikes occur at random times, and along any X-Y-axis direction on the map.

- Random artillery explosions occur in the beach craters, at 6 $higgins_runup_mortar1 [mortar6] locations, and once per time-cycle at any random map location.

- 6 original higgins boats will begin moving toward the beach after a random amount of initial map time.
	- These boats' solid clips were readjusted to better fit players, who can jetpack or eject from planes to land in the boats.
	- $higgins2 will always get destroyed and never respawn, but the other 5 $higgins1 [higgins6] boats can blow up from grenades, rockets, etc at any time and respawn after 60 seconds.
	- Higgins boats that are destroyed will slowly sink down and run continuous fx_water_spray emitters while sinking.
	- Once the higgins boats drop their doors upon landing, teleporters between the boats and the beach water are spawned, allowing players to hop on/off the boats.
	- Some Giant Bomb trigger and Rocket Ammo trigger origins are glued to 5 of the higgins boats.

- 3 bangalores on the beach can be picked up and planted on the nearby barbwire to blow it up (other bangalores are removed after the barbwire is gone).
- An ocean blocker thread prevents the drivable higgins boats (near edges of map) from going onto dry land.

- Invisible map walls prevent players' projectiles from going through cliffs or through the ground.
	- Thick green lasers outline the map's borders to reclaim missing land areas and prevent players from falling underneath them.
	- Red lasers inside the beach bunkers outline the waist-level walls for players to see how much cover they have, when sniping other players down at the beach.
- One ladder spawned in the trench, and marked by a blue laser.

---------------

- M3L1B fully modded. 5 flyable planes, 3 flak88s, 2 nebelwerfers, 5 tanks, 4 vehicles added to the map. 2 sets of radiobomb-walkies, extra throwing knives not added.
- 3 bangalore wallbombs on Axis' side upper hill at 3 bunker door exits. Airstrikes occur at random times, and along any X-Y-axis direction on the map.

- Random artillery explosions occur in the beach and hill craters, and once per time-cycle at any random map location.
	- If any $mortar_dirt_nosound emitters (from plane/vehicle/tank, Giant Bomb/Light Bomb, or airstrike bomb explosions) impact a "bunker_roof_volumes" region above the ground, $bunker_dust1 emitters will sprinkle dust inside the bunker.

- The two AA Guns can be blown up by with large explosions (anything except for grenade explosions).
- 3 minenbombs (entmint mines) that explode if grenades/rockets/etc blow up near them.
	- One minenbomb will not respawn (if 2 destructible crates are destroyed), but will instead knock over the nearby metal card table.
- 2 radios have triggers for playing radio music.

- The main beach bunker metal doors can now be opened/closed, with the upper-lower parts of entrance door opening/closing separately. A metal hatch can also be opened/closed.
- One ladder spawned in the trench (blue laser), and 2 ladders spawned inside the dark empty beach bunker (purple lasers).

- Invisible map walls prevent players' projectiles from going through cliffs or through the ground.

NOTE: avoid flying too high above the map while in spectator, since this map is very large. Viewing too much of the map at one time will cause a game crash (runtime error).

---------------

- M3L2 fully modded. 5 jetpacks, 3 flak88s, 2 nebelwerfers, 8 extra throwing knives added to the map.

- NOTE: Tanks, vehicles, radiobomb-walkies, dog trigger were removed because the players' clients keep auto-disconnecting them with an "ERROR: MAX_GAMESTATE_CHARS exceeded" message in their consoles.
	- So far, this error only occurs on this map if too many vehicles/tanks are spawned in (too much client data? too many sound aliases? not sure).
	- Do not use more than 2 different models of drivable vehicles/tanks. Do not add more than 4 drivable vehicles/tanks. Remove as many other mods as possible too.

- Players can automatically walk through the 4 broken windows on the ground floor of the Allies mansion building (script teleports them in/out of the building if touching and facing any broken window).
- Random explosions added within most mortar craters on the map.
- The wall near the large barn and the cylindrical building, next to the 2-story house, can be blown up by any explosions not coming from grenades.

- Blue laser ladder added inside the cylindrical building for climbing to the upper platform and sniping out the window.
- Green laser wall added on the road near the Allies mansion building, since a solid wall clip (blocks all projectiles) from the original map cannot be removed. Shooting this wall makes the lasers white for a moment.

- The 2 fireplaces in the Allies mansion building have valves on the right side for closing/opening the chimney valve, which causes black smoke to emit/stop emitting (respectively) out of the fireplace.
- 2 civilian radios can be turned on/off to play music.
- The 20mm flak cannon (black, near the Axis metal grid station) can be moved up/down.
- Toilets can be flushed and bathtub faucet loopsound can be turned on/off. 
- 2 scripted white wooden doors can be opened/closed.

---------------

- M3L3 fully modded. 4 vehicles, 4 tanks, 4 jetpacks, 3 flak88s, 4 nebelwerfers, 8 extra throwing knives added to the map.

- 2 vehicle teles: one between the middle Allies road and the destroyed buildings, and one to travel through the Axis road barbwire.
- Random explosions added within all mortar craters on the map.
- Airstrikes occur at random times, and along any X-Y-axis direction on the map.

- The walls near the central roofless building with dead bodies inside (and a small wall outside, across from the building) can be blown up by any explosions not coming from grenades.
- Since the 4 nebelwerfers have player-clips from the map's .BSP that cannot be removed, a script thread prevents players that get off the nebelwerfers from getting stuck in these player-clips.

- 5 blue laser ladders added within 5 buildings.
- Toilet can be flushed and bathtub faucet loopsound can be turned on/off. 
- 4 cabinets can be opened/closed, including the mini podium in the Axis church.

---------------

- M4L0 fully modded. 6 vehicles, 3 tanks, 4 flyable planes, 3 jetpacks, 3 flak88s, 5 nebelwerfers, 8 extra throwing knives added to the map.

- NOTE: The map's .BSP did not make the road fully solid for vehicles/tanks. They will fall through the road and explode if player try to drive across the road (too many entities required to fix it).
	- 11 green laser bridges added to allow vehicles/tanks to cross the road.

- 2 airstrike radio-triggers in the 2nd floor mansion room with the large tables. They will only begin pulsating red after 90 seconds (the default off-time for these triggers).
	- If players try to call an airstrike before the radio is pulsating, static sounds will play instead.
	- Holding USE(e) near a pulsating radio will begin playing a morse-code sound. Once the stopwatch timer ends, an airstrike will be called (team-based, so you will not kill your teammates).
	- If using the left radio, an airstrike will come from the Axis side and bomb the Allies side (it has a water lake).
	- If using the right radio, an airstrike will come from the Allies side and bomb the Axis side. Airstrikes calls will wait until all other $airstrike_bomberplane entities are gone.

- 2 vehicle teles: one to cross the road and adjacent brick wall near the Allies spawn, and one to cross the road and adjacent brick wall near the large mansion in the middle.
- One mortar dirt explosion will occur randomly on the map after a random short amount of time. If the explosion's origin is in a water volume, the explosion will be watery instead.
- Airstrikes occur at random times, and along any X-Y-axis direction on the map.

- 4 bangalores can be blown up with an alarm switch at the mansion's entrance.
- 2 bangalores can be blown up with an alarm switch in the 2nd floor room with the large tables and radios.
- One alarm switch on the mansion's roof to change the rooftop spotlight's beam colors in a slow, randomized fashion only when a player is next to the spotlight.

- The "wind_replace" thread replaces all $wind entities with script_models, since the map's original $wind entities (script_origins) could not play loopsounds.
- The "player_ceiling" thread (disabled by default) prevents players' games from crashing if they spectate/noclip too high up or too low down away from the map (crashes if $world farplane > 4500).
- 2 civilian radios can play music or static sounds. 2 cabinets can be opened/closed.

---------------

- M4L1 fully modded. 10 vehicles, 4 tanks, 3 flak88s, 3 nebelwerfers, 8 extra throwing knives added to the map.

- The altar can slide open/closed by pressing the USE(e) key near the pulsating red button on the altar.

- Airstrikes occur at random times, and along any X-Y-axis direction on the map.
- 3 bangalore wall-bombs: 2 in the middle building, 1 under the altar inside the church.
- 1 set of bangalore wall-bombs at the church entrance (bangalores binded to altar), and 1 set of detonator wall-bombs inside the church basement near the radio (blow up the basement).

- The 2 fireplace in the middle building has a valve on the left side for closing/opening the chimney valve, which causes black smoke to emit/stop emitting (respectively) out of the fireplace.
- The radio in the church basement can play music or static sounds. 1 cabinet in the middle building can be opened/closed.
- The toilet can be flushed and sink faucet can be turned on/off to loop water dripping sounds.

- Solid walls added at the edges of various roads and cliffs to prevent drivable vehicles from going inside walls.
	- Some walls can still be driven through, but all areas that players can exit vehicles to walk around/shoot from behind walls are blocked off.
- Solid ground added in 3 areas for players to walk on: behind green hedges and the cliff near the destroyed plane, cliff side near the middle skinny road, behind sandbags near church.

---------------

- M4L2 fully modded. 4 vehicles, 3 flak88s, 2 nebelwerfers, 8 extra throwing knives added to the map.

- A train travels across the train tracks from the Allies-side spawn towards the Axis-side spawn.
	- Any player or vehicle that gets in front of the train will die/explode.
	- Up to 2 players can ride inside the train by pressing USE(e) near the train's cabin, and exit by holding USE(e) to tele on top of the train.
	- Once the train enters the Axis-side train tunnel, players that exit will instead be respawned.
	- Inside the train tunnel, the train moves away from the map for 0.5x the "level.train_off_time" (default = 60 seconds), before returning towards the map for the other 0.5x.

- There are 3 different tracks that the train can follow: into the train tunnel (default track), fully stopping, or blowing up.
	- A train switch near the middle of the map switches the tracks to the path where the train comes to a full stop and parks.
	- A train switch in the Axis house overlooking 2 train tracks switches to the path where the train blows up.
	- These train switches cannot be triggered while the train is moving across the map (not blown up, not stopped, not in the tunnel).

- While stopping or blowing up, sparks from the train's brakes appear underneath it.
	- If the train comes to a complete stop, players riding inside them will tele next to the train.
	- If the train blows up, loud explosions and train crashing sounds occur before the train flips over onto its side.
	- The "level.train_off_time" variable also controls how long to reset the train if it is parked or blown up.

- 2 pairs of metal gates can slide open/closed by pressing USE(e) near the middle of each pair. This also allows vehicles to travel through them.
	- If metal gates on the train tracks are closed or are currently opening/closing, the train will smash through them, making them swing quickly away.
	- The smashed metal gates will respawn when the train respawns at the beginning of the tracks.
	- If the gates were open or sliding open, they will respawn opened. If the gates were closed or sliding closed, they will respawn closed.

- The elevator and its gate moves faster. Teles are placed above/below the elevator for players to escape in case they get stuck in the elevator shaft.

- 2 bangalore wall-bombs: 1 in the small bunker near the left train tracks (the path where the train comes to a full stop), and 1 at the double-doors near the left train tracks.
- 3 radios can be turned on/off to play music or static sounds.
- 12 transformer humming sounds, 1 water spigot sound, 1 air vent sound added.

---------------

- M4L3 fully modded. 4 vehicles, 1 flak88, 2 nebelwerfers, 8 extra throwing knives added to the map. Only drivable opeltrucks are included (speed increased to 400, only for this map).

- NOTE: adding too many different vehicles/tanks, or adding vehicles with non-truck sounds (original map included truck sounds) while other mods are enabled, will cause players' game to disconnect with "ERROR: MAX_GAMESTATE_CHARS exceeed".

- Airstrikes occur at random times, and along any X-Y-axis direction on the map.
- 13 bangalore wall-bombs (only the indoor ones are included by default, due to high total entity count): 6 indoor sets spread out within the 3 central buildings, 7 outdoor sets in each of the small red alarm huts.

- The large metal gate near the Allies-side tents can slide open/closed with a nearby pulsating electrical switch.
- The wooden gates near the Allies and Axis spawns can be opened/closed by pressing USE(e) near the center of them.
- 1 blue-laser ladder added to climb up/down the watchtower with the auto-spotlight.

- Players walking through the river will play water-moving sounds, small splashing sounds if falling from < 125 units above the water, or a large splashing sound if > 125 units (from global/water_wade_sounds.scr).

- 2 explosives (originally for blowing up tanks) can be blown up with grenades, similar to minen (entmint) bombs in obj/obj_team3 map.
- 3 sets of paper documents can be blown up with grenades.
- The cardgame table can be kicked over by blowing it up with grenades.
- 5 fireplaces in the central buildings have a valve switch for closing/opening the chimney valve, which causes black smoke to emit/stop emitting (respectively) out of the fireplace.
- 2 black 20mm flak cannons can be moved up/down or blown up.
- 3 radios can play music or static sounds.
- 2 toilets can be flushed, and 4 sink/tub faucets can be turned on/off to loop water dripping sounds.
- The static green opeltruck near the Allies tents can be turned on/off near the driver-side door, and the horn can be honked by holding USE(e) for 1 second while the truck is on.
- 19 cabinet switches can open/close cabinets (none are included by default, due to high total entity count).

---------------

- M5L1A fully modded. 4 vehicles, 1 flak88, 2 nebelwerfers, 8 extra throwing knives added to the map.
- Invisible higginsxtrahull.tik script_models added below the map's yellow dirt road to solidify it for vehicles to drive over, otherwise they would fall through.

- Airstrikes occur at random times across any X-Y-axis direction on one half of the map (which half is randomized too), being split between the central origin ( -576 0 0 ) instead of ( 0 0 0 ).
- 6 bangalore wall-bombs at the entrances of all buildings with visible interior and windows.
- 2 vehicle teles: one at Allies spawn to cross the two metal gates, and one at the wooden gates to cross from the lower yellow dirt road to the upper stone road.

- The wooden gates between the Allies and Axis spawns can be opened/closed by pressing USE(e) near the center of them.

- The building above the wooden gates can be blown up with rockets or other large explosives (not including grenades), spawning rubble and smoke emitters around the wooden gates street path.
- These smoke emitters slowly decrease in scale over 180 seconds, until they disappear completely.

- Numerous red and green lasers outline invisible floors, walls, roofs, and staircases.
- Map areas reclaimed: Allies spawn corner building, and several floors within the tall Axis spawn buildings. Tall tower window and Allies building attic window are accessible via red teles.
- 3 bonfire triggers will burn players for a few seconds if they get too close to the fires. Smoke emitters also added for each fire.
- 6 cabinet switches can open/close cabinets.

---------------

- M5L1B fully modded. 4 vehicles ("g_ubermods 2" only), 3 flak88, 3 nebelwerfers, 8 extra throwing knives added to the map.

- Airstrikes occur at random times across any X-Y-axis direction on the map.
- The wooden door at the Allies spawn building can be opened/closed.

- 3 bonfire triggers will burn players for a few seconds if they get too close to the fires. Smoke emitters and sound entities also added for each fire.

- The church's bell can continuously ring by turning on an electrical switch above the church bell's pedestal.
- The frequency of ringing is randomized between 0.5 and 1.5 seconds each time the switch is turned on/off.

- Since this map is very large, some mods are enabled/disabled only if the cvar "g_ubermods 1" or "g_ubermods 2" is set.
- For "g_ubermods 2":
	- Invisible higginsxtrahull.tik script_models added below the map's yellow dirt road to solidify it for vehicles to drive over, otherwise they would fall through.
	- Church's bell tower is solidified with single solid clip.
	- 2 notsolid houses near Allies spawn is blocked off with a solid clip.
	- Grassy road behind church is blocked off with an "out of bounds" teleporter.

	- 4 structures can be blown up with rockets or other large explosives (not including grenades), spawning rubble and smoke emitters around the wooden gates street path:
	- Allies spawn building, stone wall in Allies spawn, 3-story building at Allies spawn, stone wall in middle of map (between 2 	dirt roads).
	- These smoke emitters quickly decrease in scale over a few seconds, until they disappear completely.

- For "g_ubermods 1":
	- Church bell tower's brushes are all solidified: 2 pedestals, 6 support columns, 1 roof, 1 dome on top.
	- 2 notsolid houses are solified: flat roof, sloped roof, pyramid-shaped roof, lasers outlining the inside of adjacent building's roof.
	- Grassy road behind church has various cliffs and walls solidified, with teles to cross between invisible walls.
	- 2 laser walls added to outline the 2 invisible walls on the grassy road behind church. These laser walls will briefly flash white if shot at.

	- 7 cabinet switches can open/close cabinets.
	- 2 spotlights added. 2 spotlight color switches added. 2 additional LED Trap triggers added.
	- 10 bangalore wallbombs added to the entrances of various buildings.
	- Numerous red and green lasers outline invisible floors, walls, and roofs.

---------------

- M5L2A fully modded.

- Airstrikes occur at random times across any X-Y-axis direction on the map.
- One mortar dirt explosion will occur randomly on the map after a random short amount of time.

- Since this map has 27 exploders (and several more exploder-related entities), some mods are enabled/disabled only if the cvar "g_ubermods 1" or "g_ubermods 2" is set.
- For "g_ubermods 2":
	- 4 vehicles, 2 tanks, 4 flyable plane triggers, 2 flak88, 2 nebelwerfers added to the map.
	- 27 structures can be blown up with rockets/tanks or other large explosives (not including grenades). These exploders are removed if "g_ubergametype bb" is set (base-builder).
	- Only a few red teleporters are added.
	- 3 telephone poles can be run over and flattened by tanks.

- For "g_ubermods 1":
	- 8 extra throwing knives ("g_ubermods 1" only) added.
	- All 27 exploders are disabled, and related entities are removed except for the buildings' original forms.
	- All red teleporters, crates, and banquet tables are added.
	- UBER map_triggers that are usually exclusive to "g_ubermods 2" are also available in this map.
	- Spotlights, LED Trap triggers, and 11 bangalore wallbombs are added (one is a detonator within Axis spawn buildings, instead of an alarmswitch).
	- 10 bangalore wallbombs added to the entrances of various buildings.

---------------

#

# Updates & Bug Fixes

v7.988 (5-9-2025):

New mod added: Multiple "sv_maplist" cvars

	- UBER MODS now allows for multiple "sv_maplist" cvars in server.cfg, bypassing the 256 character limit for one "sv_maplist" (the cvar also cannot be 0 characters or "").
	- Add "exec global/sv_maplists.scr" to global/dmprecache.scr.

	- "global/sv_maplists.scr" will search up to 999 maplists to see if the current map is also the last map in the list (lowest list iteration).
	- If it's the last map in "sv_maplist4" for example, "sv_maplist5" will be copied to "sv_maplist", and the next map will be the first map in "sv_maplist5".
	- Manually switching maps to a map from a different maplist than "sv_maplist" will auto-copy the new maplist to "sv_maplist".

	- Do not use "sv_maplist0"; it is keeping memory of the original "sv_maplist".
	- Do not have 2+ lists ending with the same map name, otherwise the script will keep copying the list after the first one with said map name.
	- Do not have the same map name in 2 different lists (only in the same list).

	- Examples in server.cfg (the 2nd list can also start at "sv_maplist1"):

			seta sv_maplist "dm/mohdm1 dm/mohdm2 dm/mohdm3 dm/mohdm4 dm/mohdm5 dm/mohdm6 dm/mohdm7"
			seta sv_maplist2 "obj/obj_team1 obj/obj_team2 obj/obj_team3 obj/obj_team4"
			seta sv_maplist3 "training m1l1 m1l2a m1l2b m1l3a m1l3b m1l3c m2l1 m2l2a m2l2b m2l2c m2l3 m3l1a m3l1b m3l2 m3l3 m4l0 m4l1 m4l2 m4l3"
			seta sv_maplist4 "m5l1a m5l1b m5l2a m5l2b m5l3 m6l1a m6l1b m6l1c m6l2a m6l2b m6l3a m6l3b m6l3c m6l3d m6l3e void"

	- If using the map example below, do not add more than 1 maplist, since this script may not follow the correct sequence:
	- Maplist example: dm/mohdm6 dm/mohdm1 dm/mohdm6 dm/mohdm1 dm/mohdm6 dm/mohdm3 dm/mohdm6

			seta sv_maplist "dm/mohdm6 dm/mohdm1 dm/mohdm6"	 // this will work as intended;
			seta sv_maplist2 "dm/mohdm1 dm/mohdm6 dm/mohdm3" // once loading dm/mohdm6 in the 2nd list, the script will think you are at the end of the 1st list.

New cvar added: Find Set

	- New UBER Cvar added: "findset [set number]" or "findset all". This cvar will find any/all scripted exploders on the map, from global/exploder.scr.
	- Typing "findset 15" will print to console any exploder-related entities' entnums & targetnames that have the #set 15 (.set = 15).
	- Typing "findset all" will print to console all the #set entities it can find, and prints how many entities that each #set has.

New global/exploder.scr features

	- The console will now print on one line how many entities there are for each $exploder, $explodersmashed, $exploderchunk, $exploderfire, $explodertrigger, instead of printing numerous lines.
	- Improved global/exploder.scr script by adding threads to fully remove exploders or killing exploders, and reducing as many entities as possible afterwards.

	- "thread global/exploder.scr::remove #" (# being the #set value of the exploder) can be added to remove the #set exploder's entities that are no longer needed,
	- but keeps the remaining "explodersmashed" entities, unless "exploder.scr::remove # 1" is run instead; "exploder" and "exploderfire" entities are not removed until all other exploders have exploded.
	- Add the line above after running "exec global/exploder.scr::explode #".

	- "thread global/exploder.scr::kill_exploders" can be added to destroy all exploders and remove their chunks' .target entities.
	- This keeps the remaining "explodersmashed" entities, unless "exploder.scr::kill_exploders 1" is run instead.

	- "thread global/exploder.scr::remove_exploders" can be added to remove all exploder-related entities and keep their original forms.
	- This keeps the original "exploder" entities, unless "exploder.scr::remove_exploders 1" is run instead.

Other bug fixes & additions

	- Moved some scripts into an "ubermods" folder to simplify some server settings, and to fix spamming errors caused by "sv_maplist" cvar (from server.cfg).
	- If "sv_maplist" = "", or "sv_maplist" = [any string > 256 characters], the console will spam "Update of script position - This is not an error."

	- Exploder threads in M5L2A and M5L1B revamped (all other maps coming soon) to reduce entity count.
	- Instead of using mini Tiger Tanks as non-grenade explosion triggers, 2 triggers are placed around each exploder (one for explosions, another for projectiles).
	- If a $world explosion occurs near the triggers, or a Player-weapon explosion occurs after a rocket/tank projectile is detected, the exploder blows up.
	- One exploder triggered by Players' projectiles will not trigger other nearby exploders. Only a $world explosion's with a large enough radius can trigger 2+ exploders simultaneously.
	- Once exploded, the exploder will spawn 2 nearby radiusdamages, a higgins explosion, a bombwall debris emitter, and 2 sherman smoke emitters that linger for a few seconds.

	- The "find [targetname]" cvar will now print as much entity info as the "findent [entnum]" cvar.
	- These cvars will also print origin & angles in simplified decimals (for example: 0.0000 now prints 0, 1.2300 now prints 1.23, 10.0100 now prints 10.01).
	- Added "simplify_decimal" thread to global/math.scr, outputting the simplified decimal as a string. For example: local.string = waitthread global/math.scr::simplify_decimal 10.0100.

	- Server-side "cheats" can now be enabled/disabled without restarting the map, simply by typing "cheats 1" or "thereisnomonkey 1" into the console, either one will auto-set the other to "1" (set to "0" to disable cheats).

	- Players can no longer enter vehicles/tanks/boats/flak88s/nebelwerfers if they are leaning left/right, and also cannot enter flak88s/nebelwerfers if they are crouching.
	- This allows players to grab triggers, throwing knives, etc that are next to these drivable entities.
	- Players that are currently entering vehicles/tanks/boats (gun is holstering) can also cancel entering by leaning left/right.
	- Added "self.driver exit" to drivable entity scripts to ensure that players have fully exited when getting out/dying/switching teams/etc (may be unnecessary, but doesn't negatively affect scripts).

	- global/victory_podium.scr now shows "1st place", "2nd place", "3rd place" player name text in gold, silver, bronze respectively when each map ends.
	- Fixed potential spamming NULL "local.entity.driver" errors in killstreaks/damagehandler.scr.

New map modded: m5l2a 

[Singleplayer Map Mods](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#singleplayer-maps-mods)
