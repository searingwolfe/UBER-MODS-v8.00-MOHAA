<><><> UBER FFA/TDM/OBJ & BASEBUILDER v7.0 + In-Game Menu Skin <><><>

After more than 13 years since Version 6 of this MOHAA mod was released, at long last Version 7 is online. This mod maintains most of the realism without modifying the main weapons too much, making a typical FFA/TDM/OBJ game much more interesting (and colorful). This mod adds new features to all multiplayer maps including and especially the Training map, with more stuff in the OBJ maps than the DM maps. Most importantly, this mod is easily customizable from the outermost map's .scr file. Some maps may be reaching too close to the max entity count of 1024 entities, such as Omaha Beach, The Bridge (obj), and Training. This max number seems to be hard coded in the game, so in order to run these maps with lots of players, some exec mods in the map script may or may not need to be commented out. For Training specifically, I recommend commenting out the "Fire Fields" exec mod and "Nazi Tunnel Base" exec mod (plus other triggers inside the tunnel) when using this map for a server with more than 6 players. All Training mods should work by yourself (no dedicated server), to test all available mods and decide which ones to omit for a public server.

<><><> <><><>

<><><> <><><>

<><><> How To Install / Uninstall <><><>

If packed in a .zip, unpack the .pk3 files. Copy the .pk3 files and paste them in the "Medal of Honor/main" folder (same folder as Pak0.pk3, Pak1.pk3, Pak2.pk3).

Uninstall by deleting the .pk3 mod files from the "main" folder.

<><><> <><><>

<><><> <><><>

<><><> Known Bugs <><><>

- Max Entity Error (Server Shutdown): some maps are almost at the 1024 max entity count, hard-coded in game, such as mohdm4, obj_team3, obj_team4, and training. Comment out some mods (starting with "exec") to prevent that issue happening again. Sometimes, the max entity error displays different errors, and other times it just crashes the whole game. Typically, seeing red text displayed before the map loads or the server suddenly crashing to red text is a good indicator that the server went beyond 1024 max entities.

- In-Game Menu Skin: sometimes, the player skins will be invisible. If you open the console, NULL name errors will be spamming. Simply open the skins menu (MP options, or choose new team button) and close it. The skins will now appear in the in-game menu, and the console spamming will stop. For some reason, the game needs to see your current Allies and Axis skins only one time before they can appear in the In-Game Menu.

- playertank.scr: each time a player exits a driveable tank, their guns are invisible but they can still shoot with sounds and muzzle flashes. Switching to a new gun makes all their guns visible again. When driving the tank, sometimes getting the tank stuck in multiple walls or poles, or if the tank is inclined at some weird angle, will cause the game to completely crash as soon as the player exits the not-so-leveled tank. It's best to keep the driveable tanks on large flat surfaces or fields (example: not in mohdm1, getting stuck between walls and stairs near the monument with the tank is known to crash the game). No crashes yet when driving the tanks on Training.

<><><> <><><>

<><><> <><><>

<><><> Features (BASEBUILDER Mod) <><><>

- Not much has changed since Version 6 of UBER BASEBUILDER, other than adding new parameters for easier modding/scripting. Since this version (Version 7) of the UBER mods is more focused on FFA/TDM matches, basebuilding for all maps is commented out by default. However, the scripts are all still provided, in case you wish to have basebuilding first without guns, or even basebuild while shooting and playing TDM at the same time. No more wait-times for placing objects either; they are placed down instantly with Left/Right-click while holding the USE key. Whenever an object is placed, the object's coordinates and its yaw-angle (object.angles[1]) are iprinted to the player. This makes adding extra objects to maps much easier as a developer.

- Parameters: levelwaitstarttime (build time, added to map's time limit), objectlimitx (amount of objects that can be placed; be wary of 1024 hard-coded maxentity count), buildspeed (player movement speed, default = 250), buildtakeweaps (0 = keep weapons while building, 1 = take weapons), buildfalldamage (0 = no fall damage while building, dmflags 8; 1 = fall damage, dmflags 0) countdownhide (0 = no; 1 = yes, do not show "70 seconds left" buildtime countdown or play music), hudhide (0 = no; 1 = yes, do not show basebuild's HUD at the bottom, mainly for hybrid basebuild/TDM/FFA/OBJ games). If you want cheats on while building, make sure to "set cheats 1" and "set thereisnomonkey 1" at top of map's script before the "exec alienx/basebuild.scr::basebuild" code line, and make sure buildtakeweaps = 1. The basebuild.scr script will automatically turn all cheats off after basebuilding has ended.
-Example: exec alienx/basebuild.scr::main 360 500 250 0 1 0 0 // keep weapons, yes fall damage, no 70-second countdown, no basebuild hud.

- Admin basebuild console commands: "alx_basebuild 0" (turn off basebuilding immediately, respawns everyone). "alx_timeboost 120" (increase build time limit by 120 seconds, or any # of seconds). "alx_timedown 120" (decrease build time limit by 120 seconds, or any # of seconds). "alx_objectlimitboost 200" (increase basebuild object limit by 200, or any # of objects). "alx_objectlimitdown 200" (decrease basebuild object limit by 200, or any # of objects).

<><><> <><><>

<><><> <><><>

<><><> Features (Singleplayer Maps) <><><>

- I'm still working on adding mods to all the singleplayer maps, but m1l1 and m1l2a are mostly finished. All singleplayer maps have player spawns for both TDM and FFA gametypes, and all their map scripts have been neatly formatted for future mods. The AI actors and any incompatible targetnamed objects/triggers are removed for each map, including emptying and ending any setthreads that can be called by other entities in the map. Credit goes to the =ROCK= clan for the original modded map scripts and almost all of the player-spawn origins/angles (=ROCK= cplbilly, =ROCK= sklipnoty et al, formerly at www.rock.clanservers.com). Besides m1l1 and m1l2a, most of their singleplayer map code is still unedited (all found within the "setup" thread, and all threads below it). 

- Giant Bombs, Joint, LED Dots, and Radiobomb-Walkies are included in m1l1 and m1l2a, soon to include all other triggers. All trucks can be turned on by holding USE for 3 seconds near the driver-side door, honking the horn if holding USE again for less than 1 second. All opeltrucks' headlights can turn on if a player holds USE for 1 to 3 seconds while the truck is on. All opeltrucks can also be blown up with radiobomb-walkies and giant bombs. Various doors, gates, and shutters that are otherwise locked/closed (but provide access to other rooms/areas) are all openable if targetnames were provided for them in MOHAA's original .bsp file for the map.

- All singleplayer maps have 3 info_player_deathmatch spawns for TDM matches only. These spawns are for spectators that just joined the TDM game, but haven't chosen a team yet. Instead of always spawning at the singleplayer's info_player_start spawn (only one for each map), now spectators spawn in the air facing eye-appealing areas of each map.

- m1l1: With a radiobomb-walkie or giant bomb, the ceiling near the Axis spawn can be blown up, blocking the pathway below with debris. A tele spawns on both sides of the debris for players to travel around it.

- m1l2a: A laser door blocks off most of the Allies spawns near the flak88s. This door has explosives set up on the ground on both sides of the door. If shot at, the green lasers briefly flash to red, before becoming green again. Touching the door iprints to the player to try throwing a grenade at this door. With a grenade, the door can be blown up, opening up the pathway to the Allies spawn. The two flak88s can be used by players, similar to the flak88 in obj_team1 (The Hunt). With a radiobomb-walkie or giant bomb, the two flak88s can be blown up. The cluster of explosives in the basement of the Axis spawn building can also be blown up with a radiobomb-walkie or giant bomb.

<><><> <><><>