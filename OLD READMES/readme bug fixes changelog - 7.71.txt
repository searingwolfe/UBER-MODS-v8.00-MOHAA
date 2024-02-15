<><><> Updates & Bug Fixes <><><>

v7.0 (12-1-2022): - Released.

---------------

v7.01 (2-1-2023): - Found and fixed a major bug in flickerrotate.scr; delete trig_shot trigger and allow while(1) loop to end whenever a droppable trigger is picked up [joint, LED dot traps], otherwise more and more trig_shot triggers keep spawning. 

- Added droptofloor for the Training explosive, the walkie for radiobomb-walkie triggers, and bangalores on Omaha Beach.

- Added the "spectating or switched teams" exception for Omaha Beach bangalores, so they respawn back to where they were last picked up, instead of falling straight to the ground.

---------------

v7.25 (4-17-2023): - Fixed almost all Reborn server-side errors and crashes for the multiplayer maps. Training still needs a lot of work (v7.50 coming soon), and singleplayer maps will slowly be reworked into multiplayer-ready maps complete with falling-under-map fixes (v8.00 coming way later).

- Most notably: Light Bombs no longer cause crashes, secondary-fire grenades now have an orange lensflare & projectile is now visible, HUD reworked & no longer crashes players (text is also much smaller now), throwing knives added, cyber attack / search & destroy game mode included (more work on merging these mods together may be needed in the future).

- Server/Client-side console error fixes via "developer 2": vertex errors, missing map textures, dmprecache updated, models with script errors or missing shaders or missing animations all fixed, ubersound and uberdialog fixed (no more duplicate aliases), aliascache_triggersounds.scr fixed to also prevent "expected steamed or loaded" errors (change any "local" parameter to "auto" and remove the "subtitle" parameter if present).

- All map scripts updated, some errors in UBER_mapextras objects and triggers were updated and now include NULL player cases. If holding a Giant Bomb or Light Bomb and throwing knives, the bombs will be thrown first with USE + Right-click, instead of bombs/knives simultaneously. 

- The medics in some OBJ maps needed self.model exceptions in anim/attack.scr, anim/stand.scr, anim/standflinch.scr, and anim/standshock.scr for the 3 human medic .tik models, to prevent them from using "unarmed" animations that didn't exist.

- Added global/fastsky.scr in all map scripts for making players' skies either "r_fastsky 1" or 0, only one time for each player. Added empty reborn/reborn_server.scr and global/mike_torso.scr scripts to stop "missing script" and "couldn't parse" console errors.

---------------

v7.50 (5-4-2023): - Fixed all remaining Reborn server-side NULL errors for the multiplayer OBJ maps. UBER_mapextras teleporters for all multiplayers maps now use 1 entity instead of 2 (greatly reduces entities for maps like mohdm3 & mohdm4).
- This update is focused on fixing the numerous errors in the mods for Training map. Training is now ready for playing in Reborn servers (for both "drive" and "static" tanks from maps/training_mapscripts/tank_m3_replace.scr).
- By default, the tunnelbase_nazi.scr is enabled; the firefields.scr, finalfield_bombs.scr, and sky_platform.scrs are disabled. Reborn servers will not allow all players to join if Training's entity count is larger than 725; console prints indicate the amount of entities after Training has loaded.

- Playertank.scr & playervehicle.scr finally updated to fix all the spamming errors. Major script overhaul: tank drivers who die, switch teams, go to spectator can now see their guns again and are no longer frozen in mid-air (playervehicle.scr somehow doesn't have the "invisible weapons" bug when players exit the vehicle).
- Players who leave the game while driving does not crash the server anymore. A new "mainreset" thread allows destroyed tanks/vehicles to fully reset and become driveable again after a desired amount of time.

- Ubersound & uberdialog were updated again, preventing any max512 sound overflow errors from too many sounds being loaded into a map (particularly Training). If somehow a max512 error still crashes the server, delete uberdialog.scr.

- All map_triggers, jetpack trigger, and dog trigger were updated to fix remaining NULL errors. tele.scr further simplified for easily spawning new teles. Teles for falling under the map are now in their own script: undermap.scr. All map_triggers (as well as any triggers/objects that are held by players) no longer disappear if the player holding the trigger/object leaves the game.

- Fixed an error in throwingknife.scr & give_players_knives.scr, preventing the 1st knife thrown from having velocity only if extra knives were not spawned in the map.

- global/settings.scr, global/strings.scr, and global/ac/commands_with_extra.scr were all updated to stop printing NULL errors to the console.
- global/barrel.scr updated to stop printing NULL errors that occur whenever exploding barrels are added/cloned from existing ones in the map, particularly for Training. More work could still be done on this script, since the barrels that were cloned do not kill players when exploded (sometimes an explosion does not appear either, the barrel simply disappears).

- "reborn" folder and included files added from one of the various zzzzzzzz_Reborn_pak8.pk3s, so the "reborn_loader.scr not found" error doesn't appear.
- Old 2002 .shader scripts are included, preventing stationary tanks' treads from constantly moving. Some stuff added to stop map-related errors (textures & models/nil.tik for Training).
- Client-side-only smoke trail and lights added for tank shell projectiles, which were originally invisible.

- ui/fix.scr script loaded into every map script, only for the provided zzzzzzzIn-game Menu Skin.pk3. Without first going to MP options to load in their UI playermodels, players with the Menu Skin will not see their own models in the in-game menu; they will be blank boxes instead.
- This server-side script fixes client-side consoles from spamming "RE_RegisterModel: NULL name" errors, occuring when the "Esc" menu stays open, by making all players do stufftext "ui_getplayermodel" only once (after they load into a map), so their menu skin models can appear immediately.

- 4 new cvars added (in the "cvars" folder): check.scr, entitycount.scr, playercount.scr, track.scr. Track.scr merely turns the old track.scr into a cvar that can be turned on/off anytime in the server's console window by typing in "track 1" or "track 0" (coords & angle tracking for all living players ENABLED/DISABLED).

- playercount.scr can check the number of players and/or their names at anytime in the server's console window by typing in "players 1", "players 2", or "players 3": "players 1" = print to console the # of players in-game (type these into the server's console window), "players 2" = print to console the # of players in-game & their usernames, "players 3" = see which players in $player array are NULL.

- entitycount.scr can check the number of entities and/or their targetnames by typing in "entities 1", "entities 2", or "entities 3":
"entities 1" = wait 4 seconds to print # of entities & remaining entities until maxentities (1024) is reached,
"entities 2" = print all entities & their targetnames (or NULL) from 1 to maxentities,
"entities 3" = print all entities & their targetnames, but print slower.
- players' games may crash joining Reborn servers (singleplayer maps like Training) if current entities = 725+ (or 140+ remaining entities).
NOTE: the "getentity()" module has a bug in Reborn's code, preventing it from counting beyond 0 - 868 (or 869 entities).

- check.scr is meant for determining the locations for any of the triggers with up to 10 randomizing origins (giant bomb, light bomb, health, grenade ammo, rocket ammo, snowball ammo, and finaldoorkey for Training only), by typing in "check_[trigger]": "check_giantbomb 1", "check_giantbomb 2", "check_lightbomb 1", "check_lightbomb 2".
[triggers] = giantbomb, lightbomb, health, grenade, rocket, snowball, finaldoorkey.
"check_[trigger] 1" = teleports all spectators to each of the ("giantbomb", "health", "rocket", etc) trigger's randomized origins every 3 seconds.
"check_[trigger] 2" = spawn in a dummy model at each of the trigger's origins (only works once to prevent duplicates).
"check_[trigger] 0" = stop teleporting & delete the dummy models.
"check 0" = make all "check_[trigger]" cvars "0".

---------------

v7.51 (5-6-2023): - Fixed a critical server crashing issue when a spotlight with its color-beam on gets destroyed by a tank, due to the spotlight's main while loop never fully ending.
- Fixed the while-loop self.useheld for bangalores on Omaha Beach that were causing lag, now checking if the bangalore triggers and the player aren't NULL first. 

---------------

v7.70 (6-8-2023): - alienx/basebuild.scr given several new updates: Players can now Lean Left / Lean Right to change the basebuild object's ( ??? x x ) / ( x x ??? ) angles respectively in 90 degree increments, only while holding USE. When not holding USE, the object's angles return to ( 0 player.angle[1] 0 ).
- A new "objectlimit_fix" thread counts all entities on the map and subtracts them from the initial basebuilder's maximum object limit (usually 1000), after the map finishes loading. This prevents players from accidentally placing beyond 1024 entities (MOHAA's hard-coded maxentities), and subsequently crashing the server.
- Fixed initial console spamming if basebuild.scr::basebuild threads are run without basebuild.scr::main running before them (usually before level waittill prespawn).
- All 3 builder.angles update now, instead of just builder.angle. When an object is placed, all 3 object's angles are also printed, instead of just angle.
- Fixed all $player errors if no one is in the server, by first checking if $player.size >= 1.
- Fixed huddraw errors caused by _align missing a "center" parameter.
- Fixed a while-loop NULL error for deleting basebuild triggers by first checking if they exist.
- Commented out some unneeded threads: set_shark, changestring, messages etc.
- basebuild.scr script now caches the object's model before spawning it in ("cache local.model"), to avoid "add the following line to the _precache.scr map script" errors.
- Fixed NULL spamming errors and stopped the held object from becoming invisible (NULL), caused when a player picks up and holds an MG42 or Flak88 turret first, then picks up a script_model object.

- find.scr is a new cvar added (in the "cvars" folder). Run "exec global/find.scr" in any map script to use the "find [targetname without $]" cvar. In the server's console window, type in "find truckclip", "find endtrigger", "find aispawn", or multiple ents with the same targetname: "find barrel[1]", "find barrel[2]", which will teleport & face all players on the map to the entity's coords & angles (also printing the coords & angles).

- Fixed "command overflow, infinite loop" server crashing error in anim/stand.scr, caused when an airstrike bomb hits a medic and spams "idlestand" animations.
- Replaced all invisible mini kingtank.tik models (trigger sensors that don't include grenade explosions) with tigertank.tik models. Modders can now use MOHAA's original driveable kingtanks with the new global/playertank.scr script (original setsizes kept).
- Small NULL error fixed in playertank.scr. DMprecache.scr updated to include destroyed tank models. Brightened tank shell projectile's smoke trail.
- Fixed some NULL errors in global/obj_dm.scr, caused when the tank sensors blow up some stuff in OBJ maps (particularly V2 control room).
- Removed earthquake camera shaking when tanks/vehicles get damaged, and instead added camera shaking when they are destroyed.
- Added tank/vehicle turn-off sounds whenever players exit a driveable tank/vehicle.
- Fixed a bug where in rare cases, a 2nd tank/vehicle could spawn immediately after the 1st one is destroyed at the 1st one's destroyed model's origin.

- Added a movestuck_fix thread for all bombs that get dropped from airstrikes, in case a bomb gets stuck inside a tank while nobody is driving it; blow up the dropped bomb after a few seconds.
- Added earthquake camera shaking after flak88 explodes in The Hunt.
- Added earthquake camera shaking for all giant bomb and light bomb explosions.

- Commented out all unused single-player animations from models/human/new_generic_human.tik that were causing "TIKI_FixFrameNum: illegal frame number in anim" errors.
- Removed global/loadout.scr from all maps (not needed for Reborn). Added ui/fix.scr & alienx/hud.scr for all single-player maps.

- Fixed global/throwingknife.scr knife angles so they face down properly when thrown downwards from very high distances.

- Fixed all the NIL errors in maps/gen_mapscripts/doorsgates.scr when players open doors in m1l1.
- Fixed all NULL errors in maps/gen_mapscripts/truckstuff_trig.scr. Added "deadcorona" lights thread for opeltruck headlights in maps/gen_mapscripts/truckstuff_trig.scr
- Fixed client-side game crashing issue when lightbombs are launched at tanks' treads. Water artillery explosion sound now works for all maps.
- Fixed led_trap.scr and joint.scr so they do not droptofloor anymore; if spawned on top of objects like crates or tables, these triggers could droptofloor through them.
- Fixed spotlights' initial angles[1] not matching the local.angle parameter given to player_spotlight.scr, and readjusted all spotlights' initial angles[1] for all maps.
- Fixed some NULL errors in global/obj_dm.scr, and added parameters for "damage" and "damage radius".
- Fixed more NULL errors in radiobomb_walkietrig.scr, global/dog.scr, obj_team3.scr, obj_team4.scr, and some map_triggers/gen_switch scripts.

- Fixed living dog trigger not properly ending its threads when the player dies (could've caused a server crash if too many players were dogs).
- The dog model is now removed if dog-players fall out of the map without dying.
- Biting enemy players now counts as kills for the living dog player.

- Sounds for the dog trigger, living dog-players, light bomb explosions, airstrike bomb exposions and others were all given custom aliascaches, allowing them to be heard client-side without any mods or a modded ubersound.scr.
- Fixed ubersound.scr, uberdialog.scr, and global/aliascache_triggersounds.scr again, minimizing as many aliascache sounds per map as possible, to avoid "max512" sound errors crashing the server.

---------------

- M1L1 fully modded (maybe a few things added later, but pretty much done). Crates, teles, tables added to walk inside of most buildings, on their rooftops, or on stairs between rooftops, including on top of the Axis-side tower and the Allies-side light house (tele to it behind the Axis spawn).
- Playertanks and a destructible opeltruck added. Hold USE near truck's door to it turn on/off. Once on, let go of USE early to honk the horn (< 1 second), or turn on/off the headlights (> 1 second & < 3 seconds).
- There are 3 sets of bangalore wallbombs that can blown up from alarm-switches: behind the Axis-side crate room, inside the Axis-side crate room, and inside the Allies-side tan building.
- Simplified Allies/Axis airstrikes added (every 2 mins, 30 seconds), since entity count is already approaching 700+ after adding the 3 splinepaths needed for the vehicle convoy.

- M1L1 Vehicle Convoy arrives after 90 seconds: opeltruckgreen_canopy, opeltruck, and panzer_tank_europe following the street path from the Allies side. Opeltruckgreen_canopy has radiobomb-walkies and two extra throwing knives; it cannot be destroyed.
- Regular opeltruck explodes before parking near the tan building. The panzer_tank_europe's turret looks at the explosion while turning to the left, before rotating the turret back forward, parking, and becoming a driveable tank.

- All singleplayer maps will eventually be modded: M1 and M2 (v7.80), M3 and M4 (v7.90), M5 and M6 + final version edits (v8.00).

---------------

v7.71 (6-13-2023): - Found a critical server crashing error in nangle_aa_torso.st, nangle_sh_torso.st, nangle_bt_torso.st (the server's g_statefile), caused when a player types in a particular string into his console, causing several "^~^~^ Warning: Can't find player animation 'unarmed_stand_idle'" and "Possible infinite loop in torso state 'RAISE_WEAPON'" errors, shortly before crashing the server with: "ERROR: Stopping due to possible infinite torso state loop". The old 2005 script global/modelfix.scr is now commented out (already commented out in Reborn's mike_torso.st, but wasn't in this mod).

- Fixed the find.scr added CVAR (typing into console: find aispawn, find chairclip, find truck2, find barrel[1], find barrel[2], etc.) to include double-digit array positions (find door_locked[10], find door_locked[99]). Triple-digits are not included since arrays larger than 100 are rarely ever used, but can be added at the top of the script.
- Moved singleplayer maps' cache models into their respective _precache.scr scripts. M1L2A halfway finished: crates & teles added, script cleaned up to remove most console errors printing when the map first loads.
- Minor basebuild object limit fixes to stay below maxentities = 1024 in case the map already has more than 869 entities.

---------------

<><><> <><><>
