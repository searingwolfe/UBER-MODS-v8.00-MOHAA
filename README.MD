# How To Install / Uninstall

Delete any and all older UBER MODS .pk3 files.<br>
If packed in a .zip, unpack the .pk3 files. Copy the .pk3 files and paste them in the "Medal of Honor/main" folder (same folder as Pak0.pk3, Pak1.pk3, Pak2.pk3).<br>
Uninstall by deleting the .pk3 mod files from the "main" folder.

This mod only works for MOHAA Reborn 1.12 (mainly Allied Assault), and must run in a dedicated server.

<><><> <><><>

<><><> Essential CVARS for UBER MODS Servers <><><>

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

<><><> <><><>

<><><> Essential UBER BASEBUILDER Info <><><>

- exec alienx/basebuild.scr::main 800 1000 250 1 1 0 0 0 // buildtime, objectlimit, buildspeed, buildtakeweaps, buildfalldamage, countdownhide, hudhide, consoleprint

basebuild.scr::main (parameters) --->

	build start time in seconds (ex: 800)
	object limit (ex: 1000)
	player speed while building (ex: >= 280, 250 is default)
	take weapons while building (0 for no)
	fall damage while building (1 for yes)
	hide 70-sec countdown hud (1 for yes)
	hide bottom hud text (1 for yes)
	print object-placed origin, angles, model (1 for yes)

BASEBUILDER CONSOLE COMMANDS:

	alx_basebuild 0 (turn off basebuilding immediately, respawns everyone)
	alx_timeboost 120 (increase build time limit by 120 seconds, or any # of seconds)
	alx_timedown 120 (decrease build time limit by 120 seconds, or any # of seconds)
	alx_objectlimitboost 200 (increase basebuild object limit by 200, or any # of objects)
	alx_objectlimitdown 200 (decrease basebuild object limit by 200, or any # of objects)

While holding object & holding USE key, lean left/right to change object angles. Hold lean left/right for 2 seconds to slowly trim object's angles.<br>
Basebuilder script automatically lowers "objectlimit" count to avoid going beyond 1024 maxentities.<br>
Mini-flak88 objects act as flamethrowers, killing players within 5 hits. 

<><><> <><><>

<><><> UBER CVARS Scripts Info <><><>

| File Name:        | CVAR without quotes:           | Description:   |
|:-------------:|:-------------:|:-----:|
| exec cvars/playercount.scr      | "players 1" | print to console the # of players in-game (type these into the server's console window). |
|       | "players 2" | print to console the # of players in-game & their usernames. |
|       | "players 3" | see which players in $player array are NULL. |

				//		         maxentities = 869 in code, but players may crash joining Reborn servers (singleplayer maps) if current entities = 725+, or 140+ remaining entities.
exec cvars/playercount.scr	// "players" cvar.  	"players 1" = print to console the # of players in-game (type these into the server's console window).
				//	       		"players 2" = print to console the # of players in-game & their usernames.
				//	       		"players 3" = see which players in $player array are NULL.
exec cvars/entitycount.scr 	// "entities" cvar.	"entities 1" = wait 4 seconds to print # of entities & remaining entities until maxentities (1024) is reached.
				//	       		"entities 2" = print all entities & their targetnames (or NULL) from 1 to maxentities.
				//	       		"entities 3" = print all entities & their targetnames, but print slower.
				//			"entities 4" = print only non-NULL entities ($player entities do not print for "entities" 4, 5, 6, 7).
				//			"entities 5" = print only non-NULL entities that have targetnames.
				//			"entities 6" = print only non-NULL entities that do not have targetnames (targetnames = "").
				//			"entities 7" = print only non-NULL entities, and print their classnames.
exec cvars/track.scr		// "track" cvar.    	"track 1" = iprint each players' coords & angle to their own screens. 
				//			"track 2" = iprint and print to console each players' coords & angles once every 3 seconds.
				//			"track 0" = turn off tracking.
exec cvars/check.scr		// "check_[trigger]" cvar. "check_giantbomb 1" "check_giantbomb 2" "check_lightbomb 1" "check_lightbomb 2" (giantbomb, lightbomb, health, grenade, rocket, snowball)
				// 			"1" = teleports all spectators to each of the ("giantbomb", "health", "rocket", etc) trigger's randomized origins every 3 seconds.
				// 			"2" = spawn in a dummy model at each of the trigger's origins (only works once).
				// 			"0" = stop teleporting, delete the dummy models.
				// 			"check 0" = make all "check_[trigger]" cvars "0".
				//
exec cvars/find.scr		// "find [targetname without $]" cvar. "find truckclip", "find endtrigger", "find aispawn", or multiple ents with the same targetname: "find barrel[1]", "find barrel[2]",
				// 			to teleport all players on the map to the entity's coords (also printing: coords, angles, entnum, and target).
exec cvars/findent.scr		// "findent [entnum]" cvar. "findent 65", "findent 450", or any entnum >= "sv_maxclients" cvar to teleport all players on the map to the entity's coords (also printing: coords, angles,
				// classname, model, targetname, target, health).
				//
exec cvars/findclass.scr	// "findclass [classname, case-specific]" cvar. "findclass ScriptModel", "findclass CrateObject", "findclass TurretGun", "findclass Trigger", or any other classname to print all entnums and
				// their targetnames in the map with that classname.
				//
exec cvars/findmodel.scr	// "findmodel [models/...tik]" cvar. "findmodel models/static/indycrate.tik", "findmodel static/indycrate.tik", or any other model to print all entnums and
				// their targetnames in the map with that model name.
				//
exec cvars/drawpath.scr		// "drawpath [1st ent's targetname without $ in a path]" cvar. "drawpath bomberpath", "drawpath spotpath1_1", "drawpath latertruckpath", or multiple paths with the same targetname: "drawpath
				// exploderchunk[1]", "drawpath exploderchunk[12]", to spawn nodes & lasers and draw them to each .target, until there's no more .targets or until the .target reaches an already-drawn node.
				//
exec cvars/cybsnd.scr		// "cybsnd_score 1" cvar, to print the current Cyber Attack, Search & Destroy, or Freeze Tag score (rounds Allies won, Axis won).
				// "cybsnd_info 1" cvar, to print round start time, rounds to win, change sides (0 or 1 for switching bombsites), melt time, melt respawn (0 or 1 for spawning at frozen body or regular
				// spawn), spectators auto-join teams (once round begins), bomb camera (1 or 0, when bomb explodes), bomb camera distance.
				// "cybsnd_debug 1" cvar, to print once per second the Allies/Axis team count (living players) and Allies/Axis team total.
				//
exec cvars/ubergametype.scr	// "g_ubergametype" cvar. 	"g_ubergametype bb" = Base-Builder gametype.
				//				"g_ubergametype cyb" = Cyber Attack gametype.
				//				"g_ubergametype snd" = Search & Destroy gametype.
				//				"g_ubergametype 0" or "" = none, regular TDM or FFA (based on g_gametype).
				// "g_ubermods" cvar.		"g_ubermods 2" = default, all UBER mods enabled.
				//				"g_ubermods 1" = No crates or teles, fewer triggers for multiplayer maps. Crates & teles, but no extra mods for singleplayer maps.
				//				"g_ubermods 0" = all UBER mods disabled.
				// "g_throwingknives" cvar.	"g_throwingknives 1" = all players spawn with 1 throwing knife (hold USE + FIRE to throw), and 4 extra knives spawn around the map.
				//				"g_throwingknives 0" = no throwing knives.
				//
exec cvars/adminstuff.scr	// "hacker_kill" cvar.		"hacker_kill 27" = continuously kill $player[27].
				//				"hacker_kill Searingwolfe" = continuously kill the player with the name "Searingwolfe".
				//				"hacker_takeall [27 or Searingwolfe]" = continuously take all their keys.
				//				"spectator [27 or Searingwolfe]" = continuously force them into spectator.
				//
				// "votekick" cvar.		"votekick [27 or Searingwolfe]" = all players vote to kick: Hold USE Key + Lean Left = VOTE NO (default), Hold USE Key + Lean Right = VOTE YES.
				//
				// "noclip2" cvar.		"noclip2 [27 or Searingwolfe]" = noclip around the map; still works if "cheats" = "0"; $player[1] client num = 1.
				//				other hidden CVARS: "nodamage [27 or Searingwolfe]", "takedamage ", "show ", "hide ", "wuss2 " ("hide" makes a player invisible to wallhacks).
				//
				// "addkills" cvar.		"addkills [27 or Searingwolfe]" = add one kill to $player[27].
				// "adddeaths" cvar.		"adddeaths [27 or Searingwolfe]" = add one death to $player[27].
				//
				// "coord2" cvar.		print all players' coords & angles to a "main/cvars/coords.txt" file (must create this file for CVAR to work).
				//				"coord2 entity" or "coord2 1" = print "( 0 0 0 ) ( 0 0 0 )" coords/angles format on a new line.
				//				"coord2 trigger" = print "( 0 0 0 ) " coords format on the same line.
				//				"coord2 spawn" = print ""0 0 0" "angle" "0"" coords format on a new line.
				//
				// for "players same name" fix: add admin's IPs at top of "adminstuff.scr", to give admins name-changing priority.

<><><> <><><>

<><><> Essential CYBER ATTACK / SEARCH & DESTROY / FREEZE TAG Info <><><>

The popular Cyber Attack and Search & Destroy game modes from Call of Duty: Modern Warfare 2 (2022) have been ported into MOHAA for 2023.<br>
The gameplay, rules, and conditions to win/lose in this mod are almost identical to the originals.<br>
Both game modes use "g_gametype 2" or team deathmatch, but killed players go to team-only spectator instead of respawning.<br>
In Cyber Attack, dead players are frozen like in Freeze Tag and other teammates can revive them (there are no long-range melt lasers in Cyber Attack).<br>
In Search & Destroy, dead players cannot be revived. Bombsites and an explosive are also on the map, allowing a team to blow up the other team's bombsite to win the round.<br>
Teams in both game modes have a specified amount of rounds to win (5 by default) before the map ends or until the map time limit runs out. Specific rules below.

---------------

- When the map loads, the first round begins after a few seconds (8 by default). Until the round begins, the bomb cannot be picked up, and all players can respawn after dying.<br>
Once started, the bomb and bombsites become triggerable. Any players that die will go to team-only spectating mode (not actually in spectator), and a frozen body will appear where players died if playing Cyber Attack.<br>
These frozen players can only be melted by their teammates, similar to Freeze Tag.<br>
When revived, the melted player is respawned and teleported back to where they were frozen, only after all other players have moved far enough away from your frozen body (prevents players getting stuck inside each other).<br>

- While in team-spectating mode and waiting to get melted in Cyber Attack, or waiting for the next round in Search & Destroy, the spectating player can cycle between any living teammates or frozen dead bodies, with FIRE key (cycle forward) or USE key (cycle backward).<br>
If the enemy team wins while your teammates are spectating, all team-spectators will begin spectating the enemy team until the next round begins (usually 3 seconds total).<br>
If somehow all players are dead (round was a draw), then team-spectators will all teleport to and be trapped within their frozen body's beams until the next round begins.

- If a team wins but there are no players on the other team, scorepoints will not be added. A bomb (thread) and at least two bombsites (waitthreads) are added in the main map script.<br>
If a bomb-carrying player dies, the bomb drops to the ground. If a bomb-carrying player leaves or changes teams or goes to spectator, the bomb respawns back to the origin it was last picked up at.

- Cyber Attack: This game mode is best played on DM maps, since bombsites switch team defenders every 3 rounds. Each team has a bombsite to defend at all times, ideally placed near opposite corners of the map in DM maps or near team spawnpoints in OBJ maps.<br>
The Allies bombsite is blue-lit and the Axis bombsite is red-lit. The radiobomb is ideally spawned near the middle of the map. Both teams must find the purple-lit bomb and plant it on the opposite team's bombsite. The bomb takes 1.5 seconds to plant/defuse.<br>
If defused by the enemy team, the defusing player receives the radiobomb, ready to be planted on the enemy team's bombsite. To win, players must kill all enemies or plant and destroy the enemy's bombsite.<br>
Every 3 rounds, the bombsites "change sides": all Allies bombsites become Axis, and all Axis bombsites become Allies.

- Search & Destroy: This game mode is best played on OBJ maps, so the bomb can always spawn near the planting team's spawnpoints.<br>
Depending on "level.changesides" (0 or default = Allies plant first, 1 = Axis plant first), one team has two bombsites to find and defend, while the other planting team must find and destroy a bombsite.<br>
These bombsites are ideally placed near the center of the map where both teams clash in gun battles the most, but kept far enough away from each other so the defending team cannot defend both bombsites with one player simultaneously.<br>
The bomb is ideally spawned near the planting team's spawnpoints, whose origin changes when the planting team changes. The bomb cannot be picked up by players on the defending team. The bomb takes 4.5 seconds to plant/defuse.<br>
If defused by the enemy team, the defusing team wins immediately. To win, players must kill all enemies, plant and destroy the enemy's bombsite, or defuse the enemy's bomb.<br>
Every 3 rounds, the bombsites "change sides": the planting team becomes defenders, the defending team becomes planters, and all bombsites change teams accordingly.

- Freeze Tag: This game mode is an almost identical replica of Mefy's Freeze Tag. Unlike Cyber Attack where melted players respawn back to their dead bodies, Freeze Tag simply respawns the melted players.<br>
There are no bombs or bombsites in Freeze Tag, so any "bombsite" or "bomb" threads are ignored by the script (still requires running the main script, or running "......scr::main" to run this game mode).<br>
After the round begins, the 1st team to kill all enemy players wins the round.

---------------

- bombsite: Make sure these are waitthreads, so the bombsite's targetname can increment after a previous bombsite has finished spawning. Parameters: origin, angle, team.<br>
The "team" parameter only applies to Cyber Attack, since "level.changesides" will determine the team for both bombsites in Search & Destroy.<br>
Both teams in Cyber Attack can have more than 1 bombsite if desired, but make sure they have at least 1 bombsite. Search & Destroy can also have 1, 2, or more bombsites since team parameter is ignored.<br>
Run "exec global/cyberattack_searchdestroy.scr" after level waittill spawn and after all cyberattack_searchdestroy.scr threads run. Example below:

	waitthread global/cyberattack_searchdestroy.scr::bombsite ( -1210 485 168 ) -90 axis // team parameters can be removed for search & destroy.
	waitthread global/cyberattack_searchdestroy.scr::bombsite ( 1297 2461 672 ) 90 allies

- bomb: Parameters: Allies origin, Allies origin, Axis origin, Axis angle, central origin, central angle. Both Allies and Axis origins/angles are for Search & Destroy only.<br>
The central origin/angle is for Cyber Attack only. The bomb color is always blue when Allies are planting, and red when Axis are planting in Search & Destroy. Only spawn in one bomb per map.<br>
If only using Cyber Attack, for example, then don't forget the other parameters (just keep them 0). Examples below:

	thread global/cyberattack_searchdestroy.scr::bomb ( -153 1445 96 ) 180 ( -153 1445 96 ) 180 ( -153 1445 96 ) -90 	// cyb & snd
	thread global/cyberattack_searchdestroy.scr::bomb ( 0 0 0 ) 0 ( 0 0 0 ) 0 ( -153 1445 96 ) -90 			// cyber attack only
	thread global/cyberattack_searchdestroy.scr::bomb ( -153 1445 96 ) 180 ( -153 1445 96 ) 180 ( 0 0 0 ) 0 		// search & destroy only only

---------------

- level.round_starttime: 8 seconds default. This variable determimes the time in seconds until the round begins, disabling respawning and forcing dead players to spectate their teammates until the next round begins.<br>
Waiting a few seconds for a new round to begin serves as a temporary spawn protection. 

- level.rounds_towin: 5 rounds to win default. This determines how many rounds a team must obtain before winning and ending the map, allowing a winning game to be as close as 5 to 4 points by default.

- level.changesides: 0, Allies plant first default. This can only be 0 or 1, where 1 = Axis plant first (for Search & Destroy).<br>
If playing Cyber Attack, setting level.changesides = 1 will flip the bombsite's defending teams to the opposite teams initially.<br>
Every 3 total rounds, level.changesides toggles from 1 to 0 or from 0 to 1. 

- level.keepsamesides: 0, no nothing default. If set to 1, level.changesides will never increment, mainly for OBJ & singleplayer maps (bomb & bombsites will not change teams every 3 rounds).

- level.spectators_jointeams: 0, do nothing default. If set to 1, all actual spectators will be forced to auto-join teams and be given a machine gun, pistol, and grenades when the round begins.<br>
If those players are still AFK, they'll eventually get killed and placed into team-spectating mode until the next round begins.

- level.bombcamera: 0, do nothing default. If set to 1, when a bombsite is about to explode, all players' cameras are moved to the bombsite to view the explosion, before returning all cameras back to their respective players' heads after a few seconds.<br>
While viewing the explosion, players cannot see or kill each other.

- level.cameradistance: 200 default. This determines the distance between a bombsite and all players' cameras when the bombsite blows up.<br>
Some bombsites are indoors. If the camera is inside the wall or the bombsite is invisible during explosion, this variable should be lowered.

- level.melttime: 3 seconds default. This determines the time in seconds for a player to melt/revive a teammate.<br>
Note: there's always roughly a half-second extra time required for all players to move away from the melted/revived teammate, before he respawns.

- level.meltrespawn: 0, respawn melted/revived players back to their frozen bodies default. If set to 1, then all players that get melted/revived will not tele back to their dead bodies (regular respawn instead).<br>
This = 1 by default for Freeze Tag only, unless specified as level.meltrespawn = 0.

- level.meltlaser: 0, laser beam is invisible default (Freeze Tag only). If set to 1, all players' melting laser beams (when holding USE key) are visible.

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

<><><> <><><>

<><><> Killstreak Rewards <><><>

- Killstreak count increases as a player gains kills without dying. Whenever a player dies or changes teams, their killstreak count reverts to 0 again.<br>
- Killstreak damage handler ensures that scorepoints are properly given to killstreak owners, or to enemies that destroy the killstreaks and kill other players.<br>
- Scorepoints are also properly given during chain-reaction explosions, such as a mine destroying another mine before killing an enemy player.<br>
- If a players' killstreak still exists and that player changes teams or leaves the game, the killstreak is removed immediately.

- 4 killstreaks added, more coming soon: 2 claymores (3 kills), airstrike (5 kills), cluster mine (7 kills), sentry turret (9 kills).<br>
- To use killstreaks: hold USE(e) + lean left/right to show the killstreak and begin placing.<br>
- To place killstreaks: hold USE(e) + FIRE(right click) to place down the killstreak.

- Claymores: Lasers point toward enemies. All enemy players (including the claymore-owner, but not his allies) that run too close to a claymore will be killed within 150 degrees from forward.<br>
If an enemy shoots the claymore, the claymore-owner and his allies standing too close can be killed within all 360 degrees.<br>
Claymores remain on the map after the player_owner dies, but disappear after the player_owner respawns.

- Sentry Turret: Rotates continuously. The closest enemy player to the turret will be locked-on (within 120 degrees) for 1 second before firing until the enemy player goes out of sight or dies.<br>
Enemies can destroy the sentry turret with explosions, grenades or rockets (bullets do not deal damage).<br>
Sentry Turrets stay on the map after the player_owner dies and respawns. These will disappear after 180 seconds if not destroyed.

- Cluster Mine: 5 additional mines fly out from center. Similar to claymores, but without lasers and capable of killing enemies within all 360 degrees. These can also be shot and destroyed.<br>
Cluster mines stay on the map after the player_owner dies and respawns.

- Airstrike: Mark the center-point location and the direction of the airstrike's bombing run, before launching the airstrike.<br>
Laser arrows indicate the direction that airstrike planes will follow. Bombs drop from the planes continuously (traveling -8200 to 8200 units from player's origin, 16400 units total).<br>
Dropped bombs that kill players count as scoreponts and cannot damage teammates (but can kill them if driving vehicles).<br>
The airplanes can only be shot down by enemy players after shooting them 8+ times. Any crashing planes can kill any players.

---------------

- Place any script examples before "level waittill spawn". Change "kills" parameter as needed (number of kills in a killstreak, without dying or changing teams).<br>
- Additional level parameters such as "damage", "radius" (radius of damage and distance to trigger explosions), triggering field-of-view in degrees, scale of claymore/mine,<br>
velocity of additional mines spawned, bullet damage for sentry turrets, turret lock-on delay in frames, and maximum lock-on distance, can be edited at the top of each killstreak script.

Claymores Parameters: number of kills, number of claymores given (max = 5).<br>
Claymores Example: exec killstreaks/claymores.scr 3 2

Sentry Turret Parameters: number of kills, time until sentry turret dies.<br>
Sentry Turret Example: exec killstreaks/sentry_turret.scr 6 90

Cluster Mine Parameters: number of kills, number of additional mines spawned (max = 15).<br>
Cluster Mine Example: exec killstreaks/cluster_mines.scr 9 5

Airstrike Parameters: number of kills, number of bullets to kill a plane, map height (40 below skybox ceiling; all modded maps have pre-defined map heights, so "map height" can be left empty).<br>
Airstrike Example: exec killstreaks/airstrikes.scr 5 8

<><><> <><><>

<><><> Drivable Vehicles / Usable Statweapons <><><>

- global/playerboat.scr & global/playertank.scr & global/playervehicle.scr.
- Place any script examples before "level waittill spawn". Change coords & angles as needed.

- Available drivable tanks: kingtank, panzer_tank, panzer_tank_europe. (tigertank & tigertankdsrt cannot be driven, since turret model completely blocks player's screen).
- Available drivable boats: higginsxtrahull (higgins boats).
- Available drivable vehicles: bmwbike, european_car_grey, european_car_silver, european_car_tan, european_delivery_truck_green, european_delivery_truck_grey, european_delivery_truck_red3,
gmctruck, jeep, jeep_bench, m3, mercedes, opeltruck, opeltruckgreen, opeltruckgreen_canopy, sdkfz, sdkfz_afrika, shermantank.

- Passenger seats per vehicle (not including driver seat); can only carry teammates (none if in Free-For-All):
- 2 for bmwbike & jeeps, 3 for european_cars & european_delivery_trucks & mercedes, 4 for gmctrucks & opeltrucks & sdkfzs & m3s, 1 for shermantank, 9 for higgins boats.

- For drivable vehicles: Hold FIRE = look behind, Hold USE for 1 second = exit, Lean Left = honk horn, Lean Right = turn on/off headlights (only if "noheadlights" parameter is not equal to 1).
- For drivable tanks: Press FIRE = shoot turret, Hold USE for 1 second = exit.
- For drivable boats: Hold FIRE = look behind. Hold Left Lean = look left. Hold Right Lean = look right. Hold USE for 1 second = exit.

- Drivable tanks now have an additional 30cal turret gun seat, allowing a 2nd player to shoot the 30cal while the tank driver uses the main tank turret.
- Drivable jeeps & SDKFZ halftracks also have a 30cal turret gun seat. Players using the 30cals can be shot at or killed by explosions, without necessarily destroying the vehicle.

Tank Parameters: targetname (must not exist yet), model path, origin, angles, health, reset time.<br>
Tank Example: exec global/playertank.scr tank01 vehicles/panzer_tank_europe.tik ( -680 2788 -257 ) ( 0 270 0 ) 1000 60

Vehicle Parameters: targetname (must not exist yet), model path, origin, angles, health, vehicle speed, reset time, initial headlights (0 = off, 1 = on), no headlights (1 = keep them off).<br>
Vehicle Example: exec global/playervehicle.scr jeep vehicles/jeep.tik ( -2541 2297 -255 ) ( 0 40 0 ) 250 400 45 1

Boat Parameters: targetname (must not exist yet), model path, origin, angles, health, vehicle speed, reset time.<br>
Boat Example: exec global/playerboat.scr boat1 vehicles/higginsxtrahull.tik ( -6415 -3016 -380 ) ( 0 173.5 0 ) 250 250 45

---------------

- global/playerflak88.scr & global/playernebelwerfer.scr<br>
- Place any script examples before "level waittill spawn". Change coords & angles as needed.

- With these two global scripts, players can now get into, rotate, and shoot with the flak88s & nebelwerfers (mainly for Allied Assault).<br>
- The flak88s shoots one shell before waiting 5 seconds to reload. Player is invisible and cannot be killed unless the flak88 is destroyed.

- The nebelwerfers shoot 6 rockets before waiting 6 seconds to reload. Player is visible and can be shot or killed without destroying the nebelwerfer, or killed after it is destroyed.<br>
- The nebelwerfers cannot reload until all 6 rockets are fired, and it keeps reloading even if the player leaves.<br>
- After a specified amount of reset time, both scripts reset the destroyed turrets back to their initial states.

- The flak88s' shells do not count as kills / scorepoints, but nebelwerfer rockets do count as kills (rockets do not kill teammates).<br>
- Firing the nebelwerfer rockets too close to the nebelwerfer could blow it up and kill the turret player.

- To prevent the turrets from ever resetting, set the reset time to 99999.<br>
- Ideally, health should be 250, so only two grenades or a direct shotgun blast can destroy the turrets (damage scale below):<br>
shotgun: 340 damage, bazooka: 105 damage, sniper: 106 damage, one grenade: 200 damage, two grenades: 400 damage.

Flak88 Parameters: existing flak88 targetname (NIL, if spawning a new one), health, reset time, new flak88 origin, new flak88 angles, remove turret base (0 = no, 1 = yes), turret base angles (if NIL, default = flak88 angles)<br>
Flak88 Example (a): exec global/playerflak88.scr $flak88_weapon1 250 60<br>
Flak88 Example (b): exec global/playerflak88.scr NIL 250 60 ( 2150 3700 -253 ) ( 0 0 0 ) 0 ( 0 90 0 )

Nebelwerfer Parameters: existing nebelwerfer targetname (NIL, if spawning a new one), health, reset time, new nebel origin, new nebel angles<br>
Nebelwerfer Example (a): exec global/playernebelwerfer.scr $nebelwerfer_1 250 60<br>
Nebelwerfer Example (b): exec global/playernebelwerfer.scr NIL 250 60 ( 859 186 282 ) ( 0 -90 0 )

<><><> <><><>

<><><> Singleplayer Maps Mods <><><>

Singleplayer maps finished so far: Training, M1L1, M1L2A, M1L2B, M1L3A, M1L3B, M1L3C.

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

For m1l1, m1l2a, m1l2b, and training:
- Invisible solid walls added to prevent players from hiding inside walls and shooting players through them in common camping spots.
- Fell-under-map teles added at all areas where players can get trapped or walk under parts of the map.
- Cyber Attack / Search & Destroy mods added, as well as mini-flak88 flamethrower build-objects added for UBER BASEBUILDER.
- Most teleporters and objects are removed for UBER BASEBUILDER to minimize maxentities & maximize number of build-objects that can be placed.

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

- Player spawns added and distributed more widely across the Allies/Axis spawns (none near the big building).
- Invisible walls block prevent any players or projectiles from going under the map or going behind rock cliffs and shooting through them.
- Some teles allow players to stand on rock cliffs or platforms on top of large rocks, to shoot players from high above them.
- Alarm switches in the dead-end halls behind the openable doors each blow up a bangalore outside the door.
- Cyber Attack and Search & Destroy bombs and bombsites added to the map. Base-Builder Allies/Axis labels fixed in the map script.

- New airstrikes script (global/bomberplane.scr) simplifies adding them into maps. Only a splinepath is needed; bomb drop coords are automated and drop closer to splinepath's central line.
- Parameters: path targetname, team (allies, axis, c47), number of planes, off time, bombs off (0 = no, 1 = yes), amount of bombs, time until bombs drop, end (1 = only do 1 airstrike).
- Example: exec global/bomberplane.scr bomberpath allies 2 150 0 16 3.2
- Example: exec global/bomberplane.scr bomberpath allies 2 150 1

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

- Player spawns added and distributed more widely across the Allies/Axis spawns.
- Invisible walls block prevent any players or projectiles from going under the map or going behind rock cliffs and shooting through them.
- Some teles allow players to stand on rock cliffs or platforms on top of large rocks, to shoot players from high above them.
- Alarm switches in the dead-end halls behind the openable doors each blow up a bangalore outside the door.
- Cyber Attack and Search & Destroy bombs and bombsites added to the map. Base-Builder Allies/Axis labels fixed in the map script.

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

- Player spawns added and distributed more widely across the Allies/Axis spawns.
- Invisible walls block prevent any players or projectiles from going under the map or going behind rock cliffs and shooting through them.
- Some teles allow players to stand on rock cliffs or platforms on top of large rocks, to shoot players from high above them.
- Cyber Attack and Search & Destroy bombs and bombsites added to the map. Base-Builder objects reorganized.
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
- Player spawns added and distributed more widely across the Allies/Axis spawns. Invisible walls block prevent any players or projectiles from going under the map or going behind rock cliffs and shooting through them.
- Bombsites in Search & Destroy will move closer to defending team's spawn each time the gamemode changes sides (when "level.changesides" changes).

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

- All singleplayer maps will eventually be modded: M1 and M2 (v7.95), M3 and M4 (v7.97), M5 and M6 + final version edits (v8.00).

<><><> <><><>

<><><> Updates & Bug Fixes <><><>

v7.93 (1-26-2023): - New killstreak added: Airstrikes. After 5 kills in a row, players can Hold USE(e) + Lean Left/Right to laze a target for the airstrike, then Hold USE(e) + FIRE to call the airstrike.

- Laser arrows indicate the direction that airstrike planes will follow. Bombs drop from the planes continuously (traveling -8200 to 8200 units from player's origin, 16400 units total).
- Dropped bombs that kill players count as scoreponts and cannot damage teammates (but can kill them if driving vehicles).
- The airplanes can only be shot down by enemy players after shooting them 8+ times. Any crashing planes can kill any players.
- The killstreaks/airstrikes.scr uses the new global/bomberplane_nospline.scr to make planes follow a straight line path without any splinepath nodes.

- Throwing knives, Giant Bombs & Light Bombs will no longer be thrown/launched immediately after launching/placing down a killstreak (must first let go of USE(e) + FIRE).
- Improved script on chain-reaction explosions for explodable killstreaks, and ensured that scorepoints for kills across chain-reactions are correctly applied (killstreaks/damagehandler.scr).

- Added global/respawn_stuck_fix.scr to global/dmprecache.scr for all maps, for preventing any 2 players from getting stuck inside each other after respawning.
- Flyable planes' bullets & rockets, as well as Giant Bombs & Light Bombs no longer deal damage to teammates or deal radiusdamage if they explode near a teammate (unless in FFA or g_teamdamage = 1).

- Major changes in adminstuff.scr: "stufftext" commands replaced with stuffsrv("banip...") or stuffsrv("clientkickr...") due to some hackers modding their game files and preventing stufftexts from affecting them.
- Changed CVARS: "hacker_kill [1 or playername]", "hacker_takeall [1 or playername]", "spectator [1 or playername]" cvars will do these commands continuously until "hacker_kill 0" or similar is entered into console.
- Other hidden CVARS: "votekick []", "noclip2 []", "wuss2 []", "nodamage []", "takedamage []", "show []", "hide []".

- Same-Name Fix: prevents two players from having the same name. Anyone who still tries to copy someone else's name (20 attempts) will get auto-banned.
- Anti-Hacks: any player that joins whose .userinfo has one of the "local.hacks" cvar phrases in the makearray in adminstuff.scr, auto-kick them for joining with preloaded hacks (example: "\cg_wallhack\0\")
- Anti-Stufftext-Hacks: checks if newly-joined players' names can be changed via stufftext command. If their name cannot be changed, auto-kick them for joining with stufftext-hacks.

---------------

- Place any script examples before "level waittill spawn". Change "kills" parameter as needed (number of kills in a killstreak, without dying or changing teams).
- Additional level parameters such as "number of planes" (2 by default), number of bombs dropped (25 by default), and color & scale & alpha of lasers at top of this killstreak script.

Airstrike Parameters: number of kills, number of bullets to kill a plane, map height (40 below skybox ceiling; all modded maps have pre-defined map heights, so "map height" can be left empty).
Airstrike Example: exec killstreaks/airstrikes.scr 5 8

- M2L1 fully modded.

<><><> <><><>
