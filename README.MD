	*Current Version: 7.994 - Updated: 1-7-2026*

### Table of Contents

[How To Install / Uninstall](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#how-to-install--uninstall)<br>
[Essential CVARS for UBER MODS Servers](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#essential-cvars-for-uber-mods-servers)<br>
[In-Game Menu Skin](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#in-game-menu-skin)<br>
[Elgan's Admin Pro Menu](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#elgans-admin-pro-menu)<br>
[Essential UBER BASEBUILDER Info](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#essential-uber-basebuilder-info)<br>
[UBER MODS List of CVARs](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#uber-mods-list-of-cvars)<br>
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

To make the server auto-change to the next map after the server's previous map when that was running when it last closed/crashed (only works in Reborn / Nightfall),<br>
add the following line into server.cfg:

		seta server_crashed "1"

Also, add the following line into global/dmprecache.scr:

		exec global/server_crashed.scr

This script writes the server's current map to "cvars/mapname.txt".<br>
When the server re-opens, the map will be changed to the "next map" (full list in "nextmap" thread inside "global/server_crashed.scr") after running the map initially set inside server.cfg.<br>
For example, if the server crashed on dm/mohdm6 and then re-opens, the server will first run server.cfg, and will lastly change to dm/mohdm7.

To use customized pink text death messages, make a folder called "global" directly in the "Medal of Honor/main" folder,<br>
and copy-paste the "global/localization.txt" file from zzzzz_UBER...pk3 into the new "global" folder.

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
	While holding object & not holding USE(e) key, hold FIRE(zoom) to match the object's angles with your viewangles (works for Reborn only).
	While holding an object: hold FIRE, then hold USE(e) to remove it.
	While holding a lift: hold FIRE, then hold USE(e) to remove it.
	While holding a tele: hold USE(e), then hold FIRE to remove it.

	Hold Right-Click to change build-laser from green to blue; this activates "Trimming Mode" for the object being held (works for Reborn only).
	In trimming mode, players can lean left/right to slowly adjust roll-angles (x,y,z angles = pitch,yaw,roll).
	In trimming mode, players can crouch to rotate the object's yaw-angle by 90 degrees, flipping the lean left/right angles to adjust pitch-angles (but still looks like adjusting roll-angles from player's point of view).
	In trimming mode, players can walk (not run) forward/backward to increase/decrease their build-laser's distance between them and their object being held.
	When a new object is picked up, their build-laser's distance is automatically reset back to "level.basebuild_laserdist" (default = 350).

	Hold USE(e) + Lean left/right to activate a yellow "Builder Remover Laser".
	For Non-Reborn: Hold USE(e) + hold FIRE at an object, lift, or tele that you placed (solid objects only) to pick it up again.
	For Reborn: Hold USE(e) + FIRE near an object, lift, or tele that you placed, then Hold FIRE(zoom) to pick it up again.
	Players can only pick up their own objects, unless logged in as admin (isadmin = 1). Laser will turn red while picking up an object.

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



# UBER MODS List of CVARs

| adddeaths | --- |
| addkills | --- |
| admin_IPs | --- |
| alx_basebuild | --- |
| alx_objectlimitboost | --- |
| alx_objectlimitdown | --- |
| alx_removeall | --- |
| alx_removelifts | --- |
| alx_removeobjects | --- |
| alx_removeteles | --- |
| alx_removeturrets | --- |
| alx_timeboost | --- |
| alx_timedown | --- |
| cg_rain_volume | --- |
| cg_thunder | --- |
| cg_weather | --- |
| cg_weather_density | --- |
| cheats | --- |
| check | --- |
| check_giantbomb | --- |
| check_grenade | --- |
| check_health | --- |
| check_lightbomb | --- |
| check_rocket | --- |
| check_snowball | --- |
| coord2 | --- |
| coord_pointer | --- |
| cybsnd_debug | --- |
| cybsnd_info | --- |
| cybsnd_score | --- |
| drawpath | --- |
| drawsize | --- |
| entities | --- |
| entity_pointer | --- |
| faceto | --- |
| file_playernames | --- |
| find | --- |
| findclass | --- |
| findent | --- |
| findmodel | --- |
| findset | --- |
| g_deathcam | --- |
| g_ubergametype | --- |
| g_uberhardcode | --- |
| g_ubermods | --- |
| g_throwingknives | --- |
| hacker_kill | --- |
| hacker_takeall | --- |
| help | --- |
| hide | --- |
| noclip2 | --- |
| nodamage | --- |
| spectator | --- |
| players | --- |
| playerspawns | --- |
| proximity_pointer | --- |
| score | --- |
| show | --- |
| subtractdeaths | --- |
| subtractkills | --- |
| takedamage | --- |
| teams | --- |
| time | --- |
| timelimit | --- |
| track | --- |
| votekick | --- |
| wuss2 | --- |

Type 'help [cvar name]' into server console window for more info, or 'help all' to print this list.

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

		Tank Parameters: targetname (must not exist yet), model path, origin, angles, health, reset time
		Tank Example: exec global/playertank.scr tank01 vehicles/panzer_tank_europe.tik ( -680 2788 -257 ) ( 0 270 0 ) 1000 60

		Vehicle Parameters: targetname (must not exist yet), model path, origin, angles, health, vehicle speed, reset time, initial headlights (0 = off, 1 = on), no headlights (1 = keep them off).
		Vehicle Example: exec global/playervehicle.scr jeep vehicles/jeep.tik ( -2541 2297 -255 ) ( 0 40 0 ) 250 400 45 1

		Boat Parameters: targetname (must not exist yet), model path, origin, angles, health, vehicle speed, reset time, boat scale.
		Boat Example (a): exec global/playerboat.scr boat1 vehicles/higginsxtrahull.tik ( -6415 -3016 -380 ) ( 0 173.5 0 ) 250 250 45
		Boat Example (b): exec global/playerboat.scr boat2 vehicles/uboat.tik ( -913 3598 -400 ) ( 0 -90 0 ) 250 40 45 1.0

---------------

Vehicle Driver Controls:

	For Reborn / Nightfall:

		- For drivable vehicles: Hold FIRE = look behind, JUMP = exit, Lean Left = honk horn, Lean Right = turn on/off headlights, only if "noheadlights" parameter != 1.
		- For drivable tanks: Press FIRE = shoot turret, JUMP = exit, Hold USE(e) for 3+ seconds while not moving the tank or turret = repair tank's health.
		- For drivable boats: Hold FIRE = look behind. JUMP = exit, Lean Left/Right = close/open higgins door.
		- For drivable uboats: Primary FIRE = shoot tank shell, Secondary FIRE = throw grenade, JUMP = exit, Lean Left/Right (while not moving) = look behind, Lean Left/Right (while moving) = aim up/down the tank shell's trajectory.

	For original AA-SH-BT:

		- For drivable vehicles: Hold FIRE = look behind, JUMP = exit, press A (left key) = honk horn, press R (right key) = turn on/off headlights, only if "noheadlights" parameter != 1.
		- For drivable tanks: Press FIRE = shoot turret, JUMP = exit, Hold USE(e) for 3+ seconds while not moving the tank or turret = repair tank's health.
		- For drivable boats: Hold FIRE = look behind. JUMP = exit, press A - D (left-right keys) = close/open higgins door.
		- For drivable uboats: Primary FIRE = shoot tank shell, FIRE + USE(e) = throw grenade, JUMP = exit, press A - D (left-right keys) = aim up/down the tank shell's trajectory.

- Press USE(e) to begin entering vehicle, taking 1 second to enter (instantly enter the vehicle's passenger seat or turret seat if a teammate is currently driving).
- While entering an empty vehicle: press & let go of FIRE to enter turret seat instead of driver seat.
- While entering an empty vehicle: JUMP to enter passenger seat instead of driver seat (or Stand & then Crouch to enter).

- For an occupied vehicle: press USE(e) to enter turret seat if available, or enter passenger seat if the turret seat is occupied.
- For an occupied vehicle: press USE(e) while Crouching to enter passenger seat instead of the turret seat.

- For vehicle passengers: JUMP = exit, hold Secondary FIRE = look around, Lean Left/Right = change passenger seats.
- For vehicle turret users: JUMP = exit, press FIRE = shoot turret.

---------------

- Driver seat, passenger seats, and turret seat can only be used by teammates of other players driving/riding in the vehicle (none if in Free-For-All):
- Number of passenger seats: 2 for bmwbikes & jeeps, 4 for sdkfz halftracks, 3 for european_cars & european_delivery_trucks & mercedes, 7 for gmctrucks & opeltrucks & m3s, 1 for shermantank, 9 for higgins boats, 5 for uboats.

- Drivable tanks have an additional 30cal turret gun seat, allowing a 2nd player to shoot the 30cal while the tank driver uses the main tank turret.
- Drivable jeeps & SDKFZ halftracks also have a 30cal turret gun seat. Players using the 30cals can be shot at or killed by explosions, without necessarily destroying the vehicle.

- Players using drivable vehicles & boats can be shot and killed by enemy players (not including SDKFZs). Given the math behind the damage dealt to drivers, all passengers will likely be killed first before the driver does.
- Players using drivable vehicles & boats can see a secondary health bar, representing their actual player's health (when in vehicles/boats/tanks, the health bar changes to the vehicle's health).
- Players using drivable tanks can see a secondary health bar, representing the tank's current health (the health bar always starts at 100 when entering tanks, even though the tank & driver have different healths).
- Tanks will emit smoke if they are damaged. The smoke's scale increases as the tank's health decreases.

---------------

- global/playerflak88.scr & global/playernebelwerfer.scr
- Place any script examples before "level waittill spawn". Change coords & angles as needed.

		Flak88 Parameters: existing flak88 targetname (NIL, if spawning a new one), health, reset time, new flak88 origin, new flak88 angles, remove turret base (0 = no, 1 = yes), turret base angles (if NIL, default = flak88 angles)
		Flak88 Example (a): exec global/playerflak88.scr $flak88_weapon1 250 60
		Flak88 Example (b): exec global/playerflak88.scr NIL 250 60 ( 2150 3700 -253 ) ( 0 0 0 ) 0 ( 0 90 0 )

		Nebelwerfer Parameters: existing nebelwerfer targetname (NIL, if spawning a new one), health, reset time, new nebel origin, new nebel angles
		Nebelwerfer Example (a): exec global/playernebelwerfer.scr $nebelwerfer_1 250 60
		Nebelwerfer Example (b): exec global/playernebelwerfer.scr NIL 250 60 ( 859 186 282 ) ( 0 -90 0 )

---------------

Statweapon User Controls:

	For Reborn / Nightfall:

		- For flak88: Press FIRE = shoot projectile. JUMP = exit. Hold FIRE(zoom) = look around.
		- For nebelwerfers: Press FIRE = shoot projectile. JUMP = exit. Hold FIRE(zoom) = reload & look around.

	For original AA-SH-BT:

		- For flak88: Press FIRE = shoot projectile. JUMP = exit. Hold FIRE + USE(e) = look around.
		- For nebelwerfers: Press FIRE = shoot projectile. JUMP = exit. Hold FIRE + USE(e) = reload & look around.

---------------

- With these two global scripts, players can get into, rotate, and shoot with the flak88s & nebelwerfers.
- The flak88s shoots one shell before waiting 5 seconds to reload. Player is invisible and cannot be killed unless the flak88 is destroyed.

- The nebelwerfers shoot 6 rockets before waiting 6 seconds to reload. Player is visible and can be shot or killed without destroying the nebelwerfer, or killed after it is destroyed.
- After a specified amount of reset time, both scripts reset the destroyed turrets back to their initial states.

- Flak88 shells and nebelwerfer rockets will not kill teammate or vehicles that they're riding in.
- Firing the nebelwerfer rockets too close to the nebelwerfer could blow it up and kill the turret player.

- To prevent the turrets from ever resetting, set the reset time to 99999.
- Ideally, health should be 250, so only two grenades or a direct shotgun blast can destroy the turrets (damage scale below):
shotgun: 340 damage, bazooka: 105 damage, sniper: 106 damage, one grenade: 200 damage, two grenades: 400 damage.




#

# Singleplayer Maps Mods

Singleplayer maps finished so far: [Training](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#Training-fully-modded),
[M1L1](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M1L1-fully-modded),
[M1L2A](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M1L2A-fully-modded),
[M1L2B](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M1L2B-fully-modded),
[M1L3A](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M1L3A-fully-modded),
[M1L3B](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M1L3B-fully-modded),
[M1L3C](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M1L3C-fully-modded),
[M2l1](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M2l1-fully-modded),
[M2l2A](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M2l2A-fully-modded),
[M2L2B](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M2L2B-fully-modded),
[M2L2C](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M2L2C-fully-modded),
[M2L3](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M2L3-fully-modded),
[M3l1A](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M3l1A-fully-modded),
[M3L1B](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M3L1B-fully-modded),
[M3L2](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M3L2-fully-modded),
[M3L3](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M3L3-fully-modded),
[M4L0](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M4L0-fully-modded),
[M4L1](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M4L1-fully-modded),
[M4L2](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M4L2-fully-modded),
[M4L3](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M4L3-fully-modded),
[M5L1A](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M5L1A-fully-modded),
[M5L1B](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M5L1B-fully-modded),
[M5L2A](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M5L2A-fully-modded),
[M5L2B](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M5L2B-fully-modded),
[M5L3](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M5L3-fully-modded),
[M6L1A](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M6L1A-fully-modded),
[M6L1B](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M6L1B-fully-modded),
[M6L1C](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M6L1C-fully-modded),
[M6L2A](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M6L2A-fully-modded),
[M6L2B](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#M6L2B-fully-modded)

---------------

#### Training fully modded

- [See READMES old/README 4 (training map mods).txt for mod-specific info].
- g_ubergametype "0" or "": Main Training script mods, where blowing up the tank unlocks doors to the 1st gunrange, doing 4 objectives unlocks the 2nd gunrange, doing 2 more spawns the final key for the final door.
- in the training.scr script, exec maps/training_mapscripts/tank_m3_replace.scr drive, the "drive" can be replaced with "static" for a nondrivable tank, spawning Allies explosives for them to blow up the tank.

- g_ubergametype "bb", "cyb", "snd", "ft": all doors are unlocked, all crate stairs now visible, all player spawns are enabled.
Almost all mods are removed except for the drivable tanks and valve switches for moving tables behind the final gunrange.

- g_ubergametype "bb": teles, crates, and tables added for going behind walls, moving around behind walls.

- g_ubergametype "cyb", "snd", or "ft": no teles for going behind walls or objects behind them, all decoration objects now visible.
Some mods added: airstrike radio triggrs, fire field detonators, field bombs detonator, trench bombs alarm switches, radio music triggers, truck/halftrack sound triggers.

---------------

#### M1L1 fully modded

- Crates, teles, tables added to walk inside of most buildings, on their rooftops, or on stairs between rooftops, including on top of the Axis-side tower and the Allies-side light house (tele to it behind the Axis spawn).
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

#### M1L2A fully modded

- Crates, teles, tables added to walk inside of most buildings, on their rooftops, or on stairs between rooftops.
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

#### M1L2B fully modded

- Crates, teles, tables added to walk inside of most buildings, on their rooftops, or on stairs between rooftops.
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

#### M1L3A fully modded

- 3 tanks, 7 drivable vehicles, and 4 flyable plane triggers added to the map. 2 sets of radiobomb-walkies, 4 extra throwing knives also added.
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

#### M1L3B fully modded

- 4 tanks, 8 drivable vehicles, and 4 flyable plane triggers added to the map. 2 sets of radiobomb-walkies, 4 extra throwing knives also added.
- 1 Flak88 on the Axis side, and 1 Nebelwerfer on the Allies side. 2 sets of bangalore wallbombs: 1 above the Axis red-light bunker, and two above the Allies two-door building.

- Airstrikes every 2 minutes, 50% chance Allies or Axis strike. For Allies strikes: 50% chance the planes will spawn from left or right side of the airstrip, and 33% chance for c47s flying. 

- All parked planes are destructible. The black 20mm Flak cannon's angles can be moved from 0, 30, 60 degrees by pressing USE near it, or blow it up with 2+ grenades.
- Teles allow players to walk along the entire Axis-side cliff, or on the Allies-side cliff near the back airstrip-side corner.

- Some teles allow players to stand on rock cliffs or platforms on top of large rocks, to shoot players from high above them.
- Alarm switches in the dead-end halls behind the openable doors each blow up a bangalore outside the door.

---------------

#### M1L3C fully modded

- 2 drivable higgins boats, and 9 vehicles added to the map. 2 sets of radiobomb-walkies, 4 extra throwing knives also added.
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

#### M2L1 fully modded

- 5 flyable planes, 1 flak88, 1 nebelwerfer, 4 tanks and 12 vehicles added to the map. 3 sets of radiobomb-walkies, 4 extra throwing knives also added.
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

#### M2L2A fully modded

- 3 flyable planes, 4 higgins boats, 4 uboats, 3 jetpacks, 2 flak88s, 1 nebelwerfer, 1 tank and 3 vehicles added to the map. 2 sets of radiobomb-walkies, 8 extra throwing knives also added.
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

#### M2L2B fully modded

- 4 flyable planes, 4 higgins boats, 4 uboats, 4 jetpacks, 1 flak88, 1 nebelwerfer, 1 tank and 3 vehicles added to the map. 2 sets of radiobomb-walkies, 8 extra throwing knives also added.
- 4 bangalore wallbombs, 2 inside the uboat sub, and 2 between other uboat docks. 1 set of bangalore wallbombs triggered via detonator on top of the uboat sub. Airstrikes are not included in this level.

- A vehicle tele allows vehicles to travel through a metal gate to a normally inaccessable uboat dock.

- Numerous sound entities added inside the uboat sub: air vents, generators, transformers, water dripping near the toilet. Press USE(e) near the toilet to flush it. Sound entities added to 3 air vents outside the sub.
- Two radios in the uboat sub can also play music by pressing USE(e) a few times.

- Red and green lasers added to the rooftops near the ocean, indicating solid walls (green) and roof-edges that players can jump off from (red).

---------------

#### M2l2C fully modded

- 4 flyable planes, 5 higgins boats, 4 uboats, 5 jetpacks, 2 flak88s, 2 nebelwerfers, 1 tank and 6 vehicles added to the map. 2 sets of radiobomb-walkies, 8 extra throwing knives also added.
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

#### M2L3 fully modded

- 4 flyable planes, 1 flak88, 1 nebelwerfer, 3 tanks, 4 vehicles added to the map. 2 sets of radiobomb-walkies, 5 extra throwing knives also added.
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

#### M3L1A fully modded

- 5 flyable planes, 2 jetpacks, 2 flak88s, 2 nebelwerfers, 4 tanks, 2 boats added to the map. 2 sets of radiobomb-walkies, extra throwing knives not added.
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

#### M3L1B fully modded

- 5 flyable planes, 3 flak88s, 2 nebelwerfers, 5 tanks, 4 vehicles added to the map. 2 sets of radiobomb-walkies, extra throwing knives not added.
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

#### M3L2 fully modded

- 5 jetpacks, 3 flak88s, 2 nebelwerfers, 8 extra throwing knives added to the map.

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

#### M3L3 fully modded

- 4 vehicles, 4 tanks, 4 jetpacks, 3 flak88s, 4 nebelwerfers, 8 extra throwing knives added to the map.

- 2 vehicle teles: one between the middle Allies road and the destroyed buildings, and one to travel through the Axis road barbwire.
- Random explosions added within all mortar craters on the map.
- Airstrikes occur at random times, and along any X-Y-axis direction on the map.

- The walls near the central roofless building with dead bodies inside (and a small wall outside, across from the building) can be blown up by any explosions not coming from grenades.
- Since the 4 nebelwerfers have player-clips from the map's .BSP that cannot be removed, a script thread prevents players that get off the nebelwerfers from getting stuck in these player-clips.

- 5 blue laser ladders added within 5 buildings.
- Toilet can be flushed and bathtub faucet loopsound can be turned on/off. 
- 4 cabinets can be opened/closed, including the mini podium in the Axis church.

---------------

#### M4L0 fully modded

- 6 vehicles, 3 tanks, 4 flyable planes, 3 jetpacks, 3 flak88s, 5 nebelwerfers, 8 extra throwing knives added to the map.

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

#### M4L1 fully modded

- 10 vehicles, 4 tanks, 3 flak88s, 3 nebelwerfers, 8 extra throwing knives added to the map.

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

#### M4L2 fully modded

- 4 vehicles, 3 flak88s, 2 nebelwerfers, 8 extra throwing knives added to the map.

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

#### M4L3 fully modded

- 4 vehicles, 1 flak88, 2 nebelwerfers, 8 extra throwing knives added to the map. Only drivable opeltrucks are included (speed increased to 400, only for this map).

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

#### M5L1A fully modded

- 4 vehicles, 1 flak88, 2 nebelwerfers, 8 extra throwing knives added to the map.
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

#### M5L1B fully modded

- 4 vehicles ("g_ubermods 2" only), 3 flak88, 3 nebelwerfers, 8 extra throwing knives added to the map.

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

#### M5L2A fully modded

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

#### M5L2B fully modded

- All "cache" models from dmprecache.scr are removed for this level, since too many precaches will cause players' games to crash (not sure why yet),
- so loading this level will cause some "^~^~^ Add the following line to the *_precache.scr map script" console errors to print.

- Airstrikes occur at random times across any X-Y-axis direction on the map.
- One mortar dirt explosion will occur randomly on the map after a random short amount of time.
- Water wade sounds added for the river.

- Ladder trigger added at the wooden spotlight tower for players to climb up/down from it.
- The wooden spotlight tower can fall over and collapse if the red explosive barrels are blown up, if a rocket/tank projectile hits the tower, or if a $world radiusdamage occurs near it.
- Small smoke emitters occur at the tower's 4 support beams, before tilting over, crashing onto the ground, spawning a dirt shockwave emitter, and playing crashing wooden sounds.
- Anyone standing under the tower will be crushed and killed, while the 4 spawn points on the tower are removed, the ladder trigger is removed, and attached spotlights & spotlight color switches are removed.

- Since this map has 48 exploders (and hundreds of exploder-related entities), almost all mods are disabled & all exploders are enabled if the cvar "g_ubermods 1" is set.
- For "g_ubermods 2":
	- 4 tanks, 8 flak88, 8 extra throwing knives added to the map (vehicles, nebelwerfers, flyable planes, guided missiles, jetpacks removed due to too many sound aliases being loaded in, causing players' games to crash).
	- All red teleporters, crates, and banquet tables are added.
	- At least 5 bangalore wallbombs in small Axis buildings, and a set of detonator wallbombs around the large Allies house.
	- 2 vehicle teles at the Allies & Axis spawns for vehicles to go around the invisible walls (vehicle_clip brushes, players can still walk through them).
	- Drivable vehicles are removed by default, since this map causes players' games to eventually crash, possibly due to too many sound aliases being loaded in.

- For "g_ubermods 1":
	- Only a few red teleporters are added.
	- Airstrikes, crater mortar explosions, and random mortar strikes (occurring anywhere on the map) are included for "g_ubermods 1".
	- 48 structures can be blown up with rockets/tanks or other large explosives (not including grenades). These exploders are removed if "g_ubergametype bb" is set (base-builder).

---------------

#### M5L3 fully modded

- Airstrikes occur at random times across any X-Y-axis direction on the map.
- One mortar dirt explosion will occur randomly on the map after a random short amount of time.
- Water wade sounds added for the river.

- Numerous lasers outline invisible building wall, the map's edges in the Axis spawn, and invisible platforms inside some buildings.
- The blue map edge lasers' color will always be the negative color of the $world farplane_color.
- Solidified floors inside various Allies spawn buildings.
- 3 fireplaces in Allies spawn buildings have a valve switch for closing/opening the chimney valve, which causes black smoke to emit/stop emitting (respectively) out of the fireplace.
- 1 cabinet can be opened/closed.
- The undermap teles will kill players instead of respawning them, since simply respawning caused player client lag.

- Since this map is very large, some mods are enabled/disabled only if the cvar "g_ubermods 1" or "g_ubermods 2" is set.
- For "g_ubermods 2":
	- 4 tanks, 8 flak88, 8 extra throwing knives added to the map (vehicles, nebelwerfers, flyable planes, guided missiles, jetpacks removed due to too many sound aliases being loaded in, causing players' games to crash).
	- Only a few red teleporters are added.
	- Some lasers & teles are removed, while others are added when some buildings blow up.
	- The detonator near the bridge will blow up the entire bridge, with numerous added emitters ($exploderchunk ents were modified to not fly everywhere, since this caused lots of player client lag).
	- The leftmost Axis destructible building (#set 5) originally had unused chunks. Now if exploded, this building will fly up into the air before crashing down, making a 2nd explosion, and spreading the formerly unused chunks.
	- 11 structures can be blown up with rockets/tanks or other large explosives (not including grenades). These exploders are removed if "g_ubergametype bb" is set (base-builder).

- For "g_ubermods 1":
	- All red teleporters are added.
	- Airstrikes, crater mortar explosions, and random mortar strikes (occurring anywhere on the map) are included for "g_ubermods 1".
	- 8 spotlights and a spotlight_colorswitch in the sniper tower, LED Dot traps, and 2 radiobomb walkies added (removed if "g_ubergametype bb", base-builder, is set).
	- 6 bangalore wallbombs added, and 2 sets of bangalore wallbombs that are triggered by detonators.
	- The detonator near the bridge blows up a large set of bangalore wallbombs across the bridge.

---------------

#### M6L1A fully modded

- 7 drivable vehicles, 9 nebelwerfers, 2 flak88s added to the map.
- 2 sets of bangalore wall bombs triggered by alarm switches, 3 sets of bangalore wall bombs triggered by detonators.

- 2 20mm turrets can be blown up with grenades.
- Invisible walls block off the map's outer border (no teles added to go behind them) since players can shoot through these walls from the outside edges of the map.

---------------

- M6L1B fully modded. 8 drivable vehicles, 8 nebelwerfers, 4 flak88s added to the map.
- 2 sets of bangalore wall bombs triggered by alarm switches, 1 set of bangalore wall bombs triggered by a detonator.
- 1 20mm turret can be blown up with grenades.
- Invisible walls block off the map's outer border (no teles added to go behind them) since players can shoot through these walls from the outside edges of the map.

- White lasers added behind the Allies spawn outlining the invisible wall that blocks off the rest of Allies spawn. Shooting this wall will make the lasers flash brighter.
- A radio can play music or static sounds by pressing USE(e) near it.
- The nearby water droplets sound entity has a valve switch next to it. This valve can turn on/off "steam control", causing steam to emit from the metal pipe and grow/shrink in scale.

- Any mortar_dirt_explosions from Giant Bombs, airstrike bombs, vehicle/turret explosions, etc. that explode on top of the large central bunker will cause bunker dust to emit from the ceiling.
- An invisible ladder allows players to climb the telephone pole near the large central bunker.

---------------

#### M6L1C fully modded

- Added "hail" weather ("snow" and "blizzard" don't work very well, since the map is too tall; "func_rain" entities must be spawned with custom setsizes lower than the map's height for these weather types).

- The final underground StG44 room can be blown up with grenades/rockets.
- The hidden vents on this level can now be accessed via red teles, and also provides a secondary path between the StG44 room and the transformer room.

- 2 white laser walls in the Allies/Axis spawns outline invisible walls, which blocks players but allows bullets/projectiles to fly through. Shooting these walls causes them to briefly flash brighter.
- Green lasers on the building rooftops outline the skybox walls from the map's .BSP. These walls extend to the map's ceiling, block players/entities, and cannot be shot through.

- Various papers, blueprints, uniform and coffee kettle (kettle only work in Reborn/Nightfall since it has no targetname), can be blown up with grenades.
- 3 radios can cycle through off, static 1, static 2, radio music, static 3 sounds by pressing USE(e).
- 5 water drip, 14 air vent, 12 transformer, 2 generator, 3 tower wood creak, 4 small missile room, 1 large missile room sounds added to the map (the missile room sounds provide a deep rumbling ambience).
- A generator switch box in the corner of the transformer room with the large brown oil container can turn/on off the 2 generators, causing red alarm ceiling lights to flash periodically when the switch is off.
- 3 ladders added to climb into the wooden spotlight towers.

- For "g_ubermods 2":
	- 2 tanks, 3 vehicles, 2 jetpacks, 4 radiobomb walkies, 8 extra throwing knives added to the map (removed if "g_ubergametype bb", base-builder, is set).
	- 4 vehicle teles added for passing through metal fences & barbedwire (most metal fences can already be driven through).
	- Some teles to rooftops are removed.
- For "g_ubermods 1":
	- 4 auto-spotlights in the 3 wooden towers will follow loops of SplinePath nodes on the map, following any player that gets too close to the lights.
	- 6 sets of bangalore wallbombs added.
	- All red teleporters are added.

---------------

#### M6L2A fully modded

- Added "hail" weather ("snow" and "blizzard" don't work very well, since the map is too tall; "func_rain" entities must be spawned with custom setsizes lower than the map's height for these weather types).

- 5 jetpacks added for players to fly onto any rooftop, since adding too many teles will max out the map's 1024 max entities.
- 3 ladders added for the 2 wooden towers & in the Axis spawn for climbing up/down the snowy park building window near the edge of the map.
- 5 hanging road signs ($swinger1 to 5) will swing back and forth with randomizing speeds. If swinging fast enough, the sign will play a "gate_iron_open" sound.
- 2 wooden spotlight towers will occasionally play wood creaking sounds.

- For "g_ubermods 2":
	- 6 vehicles, 4 flyable planes, 1 radiobomb walkie, 8 extra throwing knives added to the map (removed if "g_ubergametype bb", base-builder, is set).
	- 1 vehicle tele added for passing through the central metal fence.
	- 6 radios inside the bunkers can turn on/off and cycle through playing 3 static sounds or music while turned on.
	- 2 metal stoves inside the bunkers can turn on/off to play fireplace sounds with orange illumination.
	- 1 fireplace has a valve switch next to it that can turn on/off black smoke emitting from the fire.
	- 1 toilet can be flushed & 2 sink/tub faucets can turn on/off to play water drip sounds.
	- 11 cabinets can be opened/closed.
	- The cello & piano can temporarily play music.
	- The 2 central bunkers can be separately blown up by rocket launchers (only while inside them) or by other radiusdamage explosions (objects inside them will disappear).
	- Some lasers added to outline the map's edges and other invisible walls/edges.
- For "g_ubermods 1":
	- 2 auto-spotlights in the 2 wooden towers will follow loops of SplinePath nodes on the map, following any player that gets too close to the lights.
	- 2 spotlight color switches can turn on/off the rapid color-changing of the auto-spotlights or turn on/off slower color-changing.
	- 3 sets of bangalore wallbombs added.
	- 4 radiobomb walkies added.
	- All lasers added to outline the map's edges and other invisible walls/edges.

---------------

#### M6L2B fully modded

- Added "hail" weather ("snow" and "blizzard" don't work very well, since the map is too tall; "func_rain" entities must be spawned with custom setsizes lower than the map's height for these weather types).

- Numerous hidden rooms, pathways, rooftops, and shortcuts are accessible via red teleporters across the map.
- Some lasers added to outline the map's edges, the 2nd floor inside the Allies spawn snowy park building window, hidden rooms inside Axis spawn, and other invisible walls/edges.
- 4 jetpacks added for players to fly onto any rooftop.
- 7 ladders added for the 6 wooden towers & one in the Allies spawn for climbing up/down the snowy park building window near the edge of the map.
- 6 wooden spotlight towers will occasionally play wood creaking sounds.
- The Axis building door can be opened/closed like a real door.

- For "g_ubermods 2":
	- A rideable train comes out of the Allies-side tunnel and travels towards the Axis spawn (removed if "g_ubergametype bb", base-builder, is set).
	- By default, the train travels on the left track, slows down & stops at the train station in Axis spawn.
	- The train will wait there until a player enters the train's passenger seat (pressing USE(e) near the doors), then slowly moving again and into the tunnel.
	- A train switch in the Axis rail control tower can switch the tracks below left (default & not pulsating) or right (pulsating red).
	- If switched to the right-side track, the train will not stop, and instead travel through the tunnel, off map, then back out of the Allies-side tunnel again.
	- Players can switch seats within the train by leaning left/right. If in the middle seat (facing forward) and exiting the train by pressing JUMP, the player will move to the top of the train.
	- Players can blow up the train with a Radiobomb-Walkie, Giant Bomb or Light Bomb, or blowing up a vehicle near them. The train will crash & fall depending on which direction the radiusdamage came from.

	- 4 vehicles (removed if "g_ubergametype bb", base-builder, is set), 2 flyable planes, 2 radiobomb walkies, 8 extra throwing knives added to the map.
	- Vehicles can drive through any metal fence on this map.
	- 1 radios inside the 2nd floor Axis spawn can turn on/off and cycle through playing 3 static sounds or music while turned on.
	- 2 sets of bangalore wallbombs added.
	- 2 radiobomb walkies added.
	- Airstrikes will randomly occur by first choosing 1 of 3 map zones, then randomizing the zone's dimensions (instead of the entire map, since part of it is long and skinny).
- For "g_ubermods 1":
	- 6 auto-spotlights in the 6 wooden towers will follow loops of SplinePath nodes on the map, following any player that gets too close to the lights.
	- 5 regular spotlights also added that players can control.
	- 1 spotlight color switches can turn on/off the rapid color-changing of the white spotlight near the Axis rail control tower.
	- 2 spotlight color switches can turn on/off the rapid color-changing of the auto-spotlights or turn on/off slower color-changing.
	- All lasers added to outline the map's edges and other invisible walls/edges.

---------------

- All other singleplayer maps will eventually be modded: M3 (v7.97), M4 (v7.98), M5 (v7.99), M6 (v7.999), and final version edits (v8.00).

#

# Updates & Bug Fixes

v7.993 (10-15-2025):

New CVAR created: "help".

	- Type "help 1" or "help all" into console to print all available UBER MODS cvars.
	- From the printed list, type "help [cvar name]" to print all available options & info for that cvar.

	- Updated READMEs for all the UBER MODS cvars to match the text printed from the "help all" cvar.

New CVAR created: "faceto".

	- Run "exec global/faceto.scr" in any map script to use the "faceto [targetname without $]" cvar.
	- For multiple entities with same targetname: "faceto barrel[1]", "faceto barrel[2]", etc.
	- This cvar makes all players on the map face towards/look directly at the entity (also printing: coords, angles, entnum, target, etc).

Drivable vehicles & flak88 turrets improved.

	- Passenger players' models will now rotate properly in their seats, regardless of the vehicle/boat's angles (facing up/down, banked on sloped terrain, etc).
	- Sine & cosine functions of the passenger & vehicle's relative-yaw angle prevent the passenger's angles from clipping into the vehicle (player's actual camera, however, is still stuck vertical. hopefully a fix soon).
	- When passengers hold secondary FIRE(zoom) to look around (not stuck to vehicle's angles), these math functions update in real-time to adjust their player model's angles and keep them perpendicular to the vehicle.

	- For drivable tanks, ensured that jeep_30cal_viewmodels are removed to prevent them sticking to players' screens when they detach from the turret, and fixed some NULL errors from tank projectiles.
	- For Flak88 Turrets, holding secondary FIRE(zoom) for looking around also adjusts the driver dummy model's angles to keep it perpendicular to the turret's angles (since the dummy is an attachmodel, it doesn't need sine & cosine functions).

	- Fixed players that could switch teams in a passenger seat and respawn back to the vehicle, instead of respawning normally.
	- Fixed passengers becoming solid when changing seats, since they must remain notsolid while the vehicle's trig_shot & trig_proj determines damage.
	- Fixed issue with "passengers" thread not remembering who the player is (local.player was sometimes NIL), but this rarely caused the script to break since it was still waiting a "waitframe".
	- Passengers that are taunting (by pressing USE(e) 5+ times within 1 second) are now able to JUMP to exit the vehicle & cancel the taunt.

Flyable planes improved (when ejecting/crashing).

	- Crashing flyable planes will now twist & bank its angles while falling if the player ejected at a non-horizontal angle (non-zero roll angle), improving plane crash realism.
	- The twist rate depends on how much roll-angle the player had before ejecting, and how fast the plane was traveling.

	- Players ejecting from planes will be briefly notsolid until 100+ units away from the plane.
	- This keep the plane from suddenly stopping and falling straight down when touching the parachuting player, and keeps the player from suddenly falling full-speed after "landing" on the plane (cancelling parachute).
	- Players ejecting from planes and currently parachuting downwards will now stop moving down if their velocity suddenly becomes 0 (landed on an entity, not just ground) or if they fall too far under the map.

	- Crashing flyable planes' explosion emitters will now always be 25 units behind the plane's angles, ensuring the explosions remain visible if a fast-moving plane crashes into a wall, ground, water, etc.
	- Fire & smoke emitters are now binded instead of glued to the crashing plane, ensuring they emit from directly inside the plane.

Misc improvements.

	- For UBER Base-Builder ("g_ubergametype bb"), fixed Lifts that were moving too far down when moving up/down.
	- While holding an Object, players can now hold secondary FIRE(zoom) while not holding USE(e) to rotate it up/down with the same angles as the player's viewangles (Reborn / Nightfall only).

	- Fixed bugs between "g_uberhardcode" and "g_ubergametype" cvars for some cases, only after the map initially loaded.
	- The "proximity_pointer" cvar will now print "multiple entities found at origin = [coords]" and a list of entnums & targetnames if more than one entity shares that exact origin.
	- Type "help proximity_pointer" into console for more info.

	- Increased Guided Missile's shoot-down trigger box from 25 units radius to 75 units radius, and ensured that the trigger always stays with the missile (binded it instead of gluing it).
	- This makes Guided Missiles much easier to shoot down with bullets, as intended.

	- Fixed Giant Bomb & Light Bomb explosions occuring at their groundtarget destination even if the bomb itself did not make it all the way there (an object/vehicle/etc blocked its path).
	- Explosions will now always occur at the Giant/Light Bomb's projectile origin.
	- Added a lanternflame emitter onto the Joint trigger's tip. 

	- Reduced each set of Bangalore Wall-Bomb's idle entities by 2 (maps/training_mapscripts/bangalore_wallbomb.scr), by only briefly spawning in the explosion & debris emitters when a player triggers the alarmswitch.

	- Replaced the elevator script in M1L3C with "global/elevator.scr", and removed some unwanted switches & invisible wall clips.
	- Added trainsparks & smoke emitters for the train in M2L1 that occasionally speeds cross the tracks behind Allies spawn.
	- Replaced the train & traincab scripts in M2L3 with "global/trainsequence.scr".
	- Added flyable planes in M4L2. Replaced the train, trainswitch1, and trainswitch2 scripts in M4L2 with "global/trainsequence.scr", and replaced the elevator script with "global/elevator.scr".
	- Changed some outdoor ambience sounds in M6L2A.

	- Custom death animations (global/custom_deaths.scr) improved by turning physics on for the spawned dead body, and matching the new body's velocity with the player's actual hidden dead body (also making the real body notsolid).
	- Players that are killed by any $world damage will no longer spawn a dead body for a custom death animation, preventing the unnecessary extra body from blocking part of the dead player's view.

	- Added "speed" function in "global/math.scr", allowing scripters to add "local.speed = waitthread global/math.scr::speed local.velocity" to quickly determine a "( 0 0 0 ) format" velocity's speed, outputted as an integer.

	- Fixed "global/respawn_fix.scr" script (always respawn players at farthest spawn point from all other enemy players) that wasn't properly respawning players if they were alive but their ".dead = 1" (spectating in deathcams mod).

	- For "global/weather.scr", fixed a bug that caused interior weather sounds to stop playing if running through an interior ambience volume with < 1 max volume (i.e. set to 0.5).
	- Also fixed a spamming NULL error if a player's weather_soundent or weather_soundent2 is somehow NULL.

New scripts created: "global/trainsequence.scr" & "global/trainsequence_switch.scr".

	- See these scripts for more README info on how to use them, or see examples from M2L3, M4L2, M6L2B.

	- The "global/trainsequence.scr" script spawns a rideable train that follows down a simple array of path nodes, and resets after a specified "off time".

		- There are 4 general path cases for the train:
			- entrance tunnel to exit tunnel.
			- entrance tunnel to stop, stop to exit tunnel.
			- entrance tunnel to stop.
			- entrance tunnel to crash.
			- At the end of each path when going through the exit tunnel, the train will keep traveling off-map for 1/2 the "off time" duration,
			- then move from off-map towards the entrance tunnel and back on-map for the other 1/2 duration.
			- Multiple path cases can be mixed together. For example, entrance tunnel to stop, stop to next stop, stop to crash.
			- The train will not continue its path after crashing.

		- The train will start at the 1st node in its path and move to each node down the list, facing the node's angles & moving at the relative speed value once reaching that node.
			- Once reaching a "stop" or "tram" node, the train will stop completely.
			- The script makes all "stop" & "tram" nodes' speed = 0 ("crash" nodes maintain their speed) to slow down the train before reaching this node.
			- Any passengers inside the train will be kicked out once reaching a "stop" or "tram" node.
			- If reaching a "stop" node if there's more nodes to travel to, the train waits until a passenger enters the train to continue moving.
			- Otherwise if reahing a "tram" node, the train waits until "off time" passes.
			- If the train path ends at a "stop", "crash", or "tram" node, the train will not fully reset until "off time" passes.
			- If there's more nodes to travel to, the stopped train will slighly move its current node to prevent jumping forward the train once the train continues its path again.
			- If the train reaches a "crash" node, the train will explode, rotate left/right, and fall onto its side, emitting smoke.
			- Any player or vehicle that gets in front of the train will be killed or blown up.

		- Players can ride the train by standing near the train windows and pressing USE(e). Cancel entering the train by leaning left/right.
			- Once inside the train, lean left/right to change seats. JUMP to exit the train.
			- If exiting from the middle seat (facing forward), the player will exit at the top of the train instead of its sides.

		- If the map has a rideable traincab (i.e. $choochootrain in M2L3), the traincab can be added for players to ride in once the train begins moving.
			- An optional cabdoor can also be added for the 1st traincab passenger to open/close the door.

		- If the train has a traincab, players will be auto-attached to the traincab once the train begins moving.
			- Once moving, players can JUMP to detatch and remain inside the traincab, and then press USE(e) to reattach.
			- Traincab riders can lean left/right to change seats.
			- Traincab riders in the 1st seat (closest to the cabdoor), can lean left/right to open/close the cabdoor.
			- Traincab riders in the 1st seat must hold FIRE(zoom) & lean left/right to change seats.
			- Any players that exit the train or traincab while off-map will be respawned instead.

		- Projectiles can also crash the train immediately, and settings can be changed to allow grenades, etc to blow up the train.
			- When impacting the train, the train will fall and explode based on the direction the projectile came from.
			- If hitting the train's front side, the train blows up the exact same way as when the train blows up at a scripted node (when dostuff = 2 for crash, but instead crashing immediately), by blowing up while it's falling over.
			- If hitting the left or right sides, the train falls over, then blows up. If hitting the back side, the train moves to one side, falls over, then blows up.
			- The train resets after its "off time" passes.

	- The "global/trainsequence_switch.scr" script spawns in train switches to change a train's path. This script also deals with global/trainsequence.scr's spawning & changing of a train path's spline nodes.

		- Train switches are initially not pulsating red by default.
		- While the train is traveling down a path (not off-map), train switches cannot be switched, since paths can only be changed once the train stops following the path.
		- For this script, the array of spline nodes for the train path must be in the map's .scr file, and must be in a thread called: "train_splinepath".
		- If the train switch already exists (i.e. the custom map-made $trainswitch1 in M4L2), the script will move this train switch instead of spawning a new one.
		- Optionally, include the targetnames for the left & right rails. The train switch will move these rails & play rail-switching sounds (or if no rails, they can instead be NIL to spawn a sound entity that plays a rail-switching sound).

New script created: "global/elevator.scr".

- See these scripts for more README info on how to use them, or see examples from M1L3C, M4L2.

- This script allows players to use the map's current elevator or use any other object as an elevator.
	- The elevator has 2 switches inside: a switch to move the elevator up one floor (up-switch), and another switch to move the elevator down one floor (down-switch).
	- Each floor can have a gate that moves down when the elevator arrives at that floor.
	- Each floor can also have an elevator-calling switch somewhere on an adjacent wall, which moves the elevator up/down to the call-switch's current floor.

- The elevator will always move the same speed when moving up/down one floor or multiple floors.
	- All switches will stop pulsating red while the elevator is moving.
	- When the elevator reaches a floor, that floor's call-switch will be disabled.
	- If the elevator is at the bottom floor, the down-switch will be disabled. If the elevator is at the top floor, the up-switch will be disabled.

New script created: "global/spectator_jointeam.scr".

- This simple script keeps track of spectators that chose a team (".dmteam" is no longer "spectator"), but have not chosen a weapon & have not spawned yet.
- Some scripts, such as throwingknife.scr, may allow mods to be used/thrown/activated by spectators that only chose teams.
- In any other mods/scripts that have ".dmteam != "spectator"" or similar, it is recommended to also add ".spectator_jointeam != 1" as well.

	- Example: "if(self.dmteam != "spectator" && self.spectator_jointeam != 1)" will check if the player has fully left spectator.
	- Example: "if(self.dmteam == "spectator" || self.spectator_jointeam == 1)" will check if the player is still in spectator, even after selecting a team but not yet a weapon.

- In any of those mods/scripts, also add "exec global/spectator_jointeam.scr" to run this script & determine ".spectator_jointeam" values for each player.

- The "global/give_players_knives.scr" script that spawns players with 1+ throwing knives (Hold USE(e) + FIRE(zoom) to throw) will now check if players have fully joined a team before giving them a knife.
	- This fixes the bug that allowed players to choose a team but not yet a weapon, and still be able to noclip around and throw knives at people.

New map modded: m6l2b

[Singleplayer Map Mods](https://github.com/searingwolfe/UBER-MODS-v8.00-MOHAA?tab=readme-ov-file#singleplayer-maps-mods)



















