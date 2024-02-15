<><><> <><><>

<><><> Features (UBER FFA/TDM/OBJ Mods) <><><>

These are the main, realism server-friendly mods that everyone sees when first checking this mod. 

- ALL MAPS: Lots more player pain and death sounds (see uberdialog.scr "//Player Pain" and "//Player Death"). Lots of red teleporters and crates across every map, just enough to access every physical area behind the walls (where you can walk around in). The crates create new bridges, standing areas, and barrier walls. The crate walls are mainly for blocking off a player's ability to shoot through a wall or floor when hiding in a tele-accessable area. The player may be able to see through some walls, but they won't be able to shoot through them. mohdm1, mohdm2, mohdm5, mohdm6, mohdm7 have a lower amount of crates and teles, since there aren't many accessable areas behind walls. In mohdm3 and mohdm4, however, players can stand inside many buildings if they have a crate or table floor, so there's many more crates and teles there. For obj_team1 (the hunt), there's a higher number of crates and tables than usual, and all roofs like in the DM maps are accessable. For obj_team2 (v2 rocket), there's a higher number of teles than crates, where many doors have teles that take the player across the map. Also, most ladders and metal staircases have teles nearby for faster traveling. For obj_team3 (omaha beach), theres teles on the boats and on the beach for allies to travel faster, and the entire left bunker has tables and stairs added inside. Invisible walls and barbwire prevent players from shooting through the ground, such as in obj_team3. For obj_team4 (the bridge), all teles, crates, tables, triggers, etc are almost identical to mohdm4. [origins for crates/teles for all maps are in maps/UBER_mapextras folder].

- Grenades: Twice their normal size, green light when thrown with very slightly less gravity. When they explode, a big red light flashes indicating its blast radius. Much more painful if a player is too close. Secondary Fire: shoots a horizontal small blue-streamed rocket that deals 40-50 damage on impact. Has a reduced kickback that can be used as a smaller more painful rocket jump. The blue stream from the rocket remains visible for several seconds, and the rocket glows orange, flashing red upon impact.         

- Panzerschrek: This shoots rockets with heavy gravity, like mortars. The rockets have a blue light Once exploded, the light remains on the ground for a few more seconds. Make sure to shoot them upwards at an angle, but not vertically upwards. Great for shooting over walls; both rocket launchers' rockets only do about 20 damage each. The shield is also made of glass and is transparent (now similar to a bazooka). To remove this texture/shader, remove the "textures/models/weapons/ofenrohr/ofenrohr.tga" file, and remove the "scripts/ofenrohr.shader" file.

- Bazooka: This shoots rockets with zero gravity and in smooth straight lines. The rockets have a purple light, also remaining on the ground for a few seconds after exploding. For both rocket launchers: shoot at the ground after jumping in order to rocket jump to new places; be careful since fall damage is still on.

- BASIC TRIGGERS: All maps (dm, obj, training) have about 10 different triggers. 6 of them have 10 origins spread across the map, randomly jumping to a new location after being triggered (giant bomb, light bomb, grenade, rocket, snowball, +200 hp). The other 4 have stationary origins (dog, blunt, spotlights, LED dot). All these triggers' model rotations and colors react to being shot at with bullets.
	
(1.) Giant Bomb: Found mainly in open areas on rooftops. When picked up, the bomb attaches to the player's hand. Pressing USE & Left/Right-click simultaneously will fire the bomb directly where your crosshairs are aiming at. This blue-lit bomb takes about 1.5 seconds to hit its target. Upon impact, a large red-lit explosion occurs, similar to a big grenade explosion but much more painful (in case they have more than 100 health). 
- Parameters: 10 origins for the trigger to randomly go to.
- Example: exec map_triggers/bomb.scr ( 0 1 0 ) ( 0 2 0 ) ( 0 3 0 ) ( 0 4 0 ) ( 0 5 0 ) ( 0 6 0 ) ( 0 7 0 ) ( 0 8 0 ) ( 0 9 0 ) ( 0 10 0 ) 

(2.) Light Bomb: Found mainly in open areas on 2nd-floor-level. When picked up, the bomb attaches to the player's hand. Pressing USE & Left/Right-click simultaneously will fire the bomb directly where your crosshairs are aiming at. This teal-lit bomb (with a bright lensflare effect) takes about 0.35 seconds to hit its target. Upon impact, a watery green-lit explosion occurs, with a similar radius to a big grenade explosion, but dealing no more than 10 damage. However, the knockback is very high for this water explosion. Use these to push someone away from you, or jump and shoot below your own feet to "rocket jump" up onto roofs or across the map (be careful, since fall damage is still on). 
- Parameters: 10 origins for the trigger to randomly go to.
- Example: exec map_triggers/lightbomb.scr ( 0 1 0 ) ( 0 2 0 ) ( 0 3 0 ) ( 0 4 0 ) ( 0 5 0 ) ( 0 6 0 ) ( 0 7 0 ) ( 0 8 0 ) ( 0 9 0 ) ( 0 10 0 ) 

(3.) Grenade Ammo: Found mainly in open areas on ground-level. When picked up, one extra grenade is given if you already have some grenades. If you have none, then two grenades are given. Trigger then moves to a new random location.
- Parameters: 10 origins for the trigger to randomly go to.
- Example: exec map_triggers/grenade_ammo.scr ( 0 1 0 ) ( 0 2 0 ) ( 0 3 0 ) ( 0 4 0 ) ( 0 5 0 ) ( 0 6 0 ) ( 0 7 0 ) ( 0 8 0 ) ( 0 9 0 ) ( 0 10 0 ) 

(4.) Rocket Ammo: Found mainly in corners on 2nd-floor-level. When picked up, one extra rocket for bazooka or panzerschrek (randomized, not based on teams) is given if you already have some rocket ammo. If you have none, then two rockets are given. Trigger then moves to a new random location.
- Parameters: 10 origins for the trigger to randomly go to.
- Example: exec map_triggers/rocket_ammo.scr ( 0 1 0 ) ( 0 2 0 ) ( 0 3 0 ) ( 0 4 0 ) ( 0 5 0 ) ( 0 6 0 ) ( 0 7 0 ) ( 0 8 0 ) ( 0 9 0 ) ( 0 10 0 ) 

(5.) Toxic Snowball Ammo: Found mainly in corners on rooftops. When picked up, one toxic snowball (one silenced pistol round) is given. You can only have one toxic snowball at a time. Trigger then moves to a new random location. When fired, the snowball is affected by gravity. Upon impact, a foggy yellow-illuminated cloud appears for 5 seconds. Anyone who walks inside or near the cloud will take rapid painful damage until they die.
- Parameters: 10 origins for the trigger to randomly go to.
- Example: exec map_triggers/snowball_ammo.scr ( 0 1 0 ) ( 0 2 0 ) ( 0 3 0 ) ( 0 4 0 ) ( 0 5 0 ) ( 0 6 0 ) ( 0 7 0 ) ( 0 8 0 ) ( 0 9 0 ) ( 0 10 0 ) 

(6.) +200 Health: Found mainly in corners on ground-level. When picked up, the player gets +200 health beyond the usual max of 100. These health boosts do stack, so players could go beyond 1000 health if they're lucky. Trigger then moves to a new random location.
- Parameters: 10 origins for the trigger to randomly go to.
- Example: exec map_triggers/health.scr ( 0 1 0 ) ( 0 2 0 ) ( 0 3 0 ) ( 0 4 0 ) ( 0 5 0 ) ( 0 6 0 ) ( 0 7 0 ) ( 0 8 0 ) ( 0 9 0 ) ( 0 10 0 ) 

(7.) Living Dog: The original "global/dog.scr" script was revamped to fix dog animations for all player movements. Only 1 per map, mainly on ground-level. When triggered, the player loses all guns and becomes a living moveable dog. Crounch to lay down the dog. Walk while standing (not crouching) to move silently. Hold USE + Left/Right-click to bark, and Left/Right-click to bite. Looking downwards bites a player's legs, and looking upwards bites a player's face. Biting a player causes 9999 damage, an instant death. Jumping while holding USE key will gives the dog a shorter jump animation, while jumping regularly gives the dog a higher jump animation; both jumps are the same physical height. If the dog is doing a running animation (player is standing and running) for 5 seconds or more, then the dog will do a "dog_leash_stop" animation (dog's front legs jump up briefly) after it stops running. The dog trigger reacts with pain animations each time it gets shot at. If the dog trigger is shot at too many times ("bulletsanger" times) within 4 seconds, the trigger's light will turn red for "angertime" seconds, killing any players that get too close to the dog. When killed, the player becomes human again. Dogs cannot pick up weapons, but they can pick up Giant Bombs, Light Bombs, Blunt, and all other explosives.
- Parameters: origin, angles, bulletsanger, angertime.
- Example: exec global/dog.scr ( 4444 1488 -338 ) ( 0 90 0 ) 15 20

(8.) Blunt: Only 1 allowed per map, mainly hidden in corners or in difficult places to reach on rooftops. When picked up, the player gets a big blunt/joint/cigarette in their mouth, fire coming off their body, and a big yellow-greenish color illuminating the player (slight color variations are randomized each time the blunt is picked up). Hold USE for 1 or 2 seconds to hear a smoking-blunt sound. Hold USE for 5 seconds to drop it. When the player is killed, the blunt drops directly below their feet, not back at its initial origin.
- Parameters: origin
- Example: exec map_triggers/joint.scr ( 3939 4274 496 )

(9.) Spotlights: The original player-spotlight script is modded to allow all 4 mounted orientations, instead of just the ground/floor. Mountwall parameter: (0 = floor, 1 = left side wall mount, 2 = ceiling, 3 = right side wall mount). Orient parameter: (0 = rotate along x-axis, 1 = along y-axis, only for mountwall = 1 or 3). Try both orients if using mountwall = 1 or 3 to get the best rotation, you'll know a number needs to be changed if the spotlight doesn't rotate correctly with the player's angles. Press USE to turn on or off the spotlight. All spotlights except for some in the Training map are mounted on the floor. When another player touches the spotlight's beam, that player is illuminated with a big light, whose color is identical to the spotlight beam's color (run by "led_spotlight.scr"). The color of the spotlight's beam can also be changed with an alarm switch or similar switch (see spotlight_colorswitch.scr), thanks to two if-statements inside a while(1) loop that wait until level.spotlight[local.name] = 1 for a one-time random color change, or until level.spotlight_rainbow[local.name] = 1 for randomly, rapidly, continuously changing colors. 
- Parameters: origin, rgb color [ex: ( 1 0 0 ) for red], name, health, angle-start, mountwall, orient, removeafterdeath (0 = keep everything, disable spotlight; 1 = remove spotlight, keep spotlightbase; 2 = remove everything). 
- Example: exec map_triggers/player_spotlight.scr ( 696 -3145 -127 ) ( 1 0 0 ) s6 700 90 0 0 1

(10.) LED Dot Trap: About 3 per map, mainly hidden behind walls on ground-level, accessible only with teles. This complex trigger is first a small rainbow-flashing white corona light. When picked up, the player carries the LED Dot with an almost invisible illumination below them. When the player dies, a big light of randomized color drops below them, now an LED Dot "Trap". The next player that touches this big light will immediately become illuminated with another different randomized color of similar light-radius. Depending on "ledtraptype" and after this illuminated player dies, the LED Dot will respawn/reset at a new location (not its initial origin). 
- Parameters: origin, name, ledtraptype [1 = respawn LED Dot on trap carrier's dead body (1st death in script), 2 = respawn LED Dot on illuminated trapped dead body (2nd death in script)]. 
- Example: exec map_triggers/led_trap.scr ( 1511 2345 -386 ) led1 2

<><><> <><><>

<><><> <><><>

<><><> Features (UBER OBJ Map Mods) <><><>

- The Bridge is the only OBJ map without airstrikes, medics, or health tables, due to a high amount of entities already in the Bridge (from crates and teles). 3 medics are on Allies side, 2 health tables are on Axis side. Each side has a pair of radiobomb-walkies. 

- (1.) Airstrikes: Labeled as "Bomber Plane Airstrikes", a spline path and path targets are first initialized. Two bomberplane threads are also initialized, one plane named "first" and another named "second", waiting for a specified time in seconds. After a few minutes, two planes will appear either from the Axis or Allies side at a very high speed. These planes, one traveling 1 second behind the other, will each drop 12 to 15 bombs onto the ground. When you see an iprintlnbold message saying "Airstrike Carpet Bomb Incoming! Take Cover!" you have about 3 seconds to hide inside. The airstrike bombs will blow up pretty much everything within its path. Any airstrike bomberplanes in this mod can be shot down with bullets (plane catches fire, begins smoking before exploding) or blown up instantly with a Giant Bomb or a Light Bomb. After the plane is shot at enough times, a long trail of black smoke follows behind the burning plane before blowing up a few seconds later; it blows up at the map's edge if it's about to leave the map. As soon as a plane catches fire, any bombs that it still needs to drop will be cancelled and removed. Two additional parameters (both can be NIL for default settings) specify how many bullets/triggerings it takes for a plane to begin catching fire ("bulletstokill") and how many seconds until the burning plane explodes ("killtime").
- Parameters for bomberplanes: plane position ("first" or "second"), time until airstrike, bombs (0 = on, 1 = off), bulletstokill, killtime.
- Example: thread splinepath; thread bomberplane first 210 0; thread bomberplane second 210 0 7 2.3

- (2.) Radiobomb-Walkie Triggers: The most complex trigger script in this mod, these two triggers are spawned in with one exec line. Both the radiobomb and walkie are pulsating red initially. The walkie always pulsates, while the radiobomb stops after being picked up. This bi-trigger is ideally a two-person job, with one player holding a radiobomb or walkie (cannot hold both, or hold any other triggers for that matter). If carrying the radiobomb, hold the USE key at any time for 3 seconds to plant it at your feet. This radiobomb cannot be blown up or destroyed, except by the walkie's signal. If carrying the walkie, hold the USE key for 3 seconds to send a signal only to the radiobomb with the same "bombwalkie" name. Be careful carrying around the walkie though. If you trigger the walkie while a player is still carrying the radiobomb, you will blow up that player too (could be useful though). Anyone can pick up the radiobomb you planted. If the radiobomb carrier dies, he simply drops the bomb on the ground, still allowing it to be blown up by the walkie. Same thing for the walkie; if the walkie carrier dies, it drops to the ground. Blowing up the radiobomb is the only way to respawn both the radiobomb and walkie back to their initial origins. All radiobomb-walkie explosions deal 500 damage. If the parameter "move1st_b4blowup = 1" (ideally the best option), then the radiobomb must first be moved from its initial origin before the walkie can blow it up; if the walkie carrier still tries to blow up the radiobomb, then the walkie drops to the ground. If pulsating = 1, then a red pulsating afterglow effect will appear for 8 seconds (or another specified "pulsetime") after the radiobomb exploded, showing where the bomb was placed. The afterglow occurs as a separate thread from the rest of the radiobomb-walkie code, thus the triggers do not wait for 8 seconds before resetting. As long as the bombwalkie names are different per "exec" line, numerous pairs of radiobombs and walkies can be placed in one map.
- Parameters: bombwalkie name, radiobomb's origin, angles, walkie talkie's origin, angles, explosion damage radius, move1st_b4blowup, pulsating, pulsetime. 
- Example: exec maps/gen_mapscripts/radiobomb_walkietrig.scr bombwalkie1 ( -888 4969 -150.5 ) ( 0 139 0 ) ( -293 5422 -170 ) ( 0 -151 0 ) 500 1 1 8 

- (3.) Medics & Smoker Medics: The original medic script was modified to allow three different medic skins, heal anyone or just Allies, adjust max health to allow healing, and specify if the medic is a cigarette smoker or not. If a smoker, the medic waits 10 seconds before pulling out a cigarette and lighting it. Sometimes, a grenade is thrown near the medic and he ducks and covers (game-automatic due to the medic entity being a "human"). The script fixes his stance by always standing him back up after 10 seconds with "self setmotionanim idle". After about 2 minutes, the smoker medic throws his cigarette away with 1 of 2 randomized throw-cig-away animations. Max Health specifies the amount of player health that a medic allows you to have before full-healing you (example: maxhealth = 80, player has 85 health, must have 80 or less to get healed). The medics cannot be killed.
Parameters: medic origin, yaw-angle, medicmodel (0, 1, 2), healanyone (0 = only allies, 1 = yes), maxhealth to allow healing (default = 75), medic smoker (1 = yes, will smoke after 10 seconds).
Example: exec maps/obj_medicstuff/medics.scr::main ( -186 5470 -172 ) 114 1 0 75 1

- (4.) Health Tables: These bunkertables, placed only at 90-180-270-360 degrees, have 6 health packs on top of them that each respawn several seconds after being taken by players. The health tables are placed mainly on the Axis side, while the medics are placed on the Allies side.
- Parameters: table origin, yaw-angle (must be 90,180,270,360), healthpacks orientation (0 or 1, larger ones left side or larger ones right side).
- Example: exec maps/obj_medicstuff/healthtables.scr::main ( 1448 -817 -279 ) 90 1

- (5.) Objectives Blowing Up: In the original map scripts, The Hunt has a flak88 objective, V2 Rocket Facility has a control room and V2 rocket objectives, Omaha Beach has two AA Gun objectives, and The Bridge has a bridge objective, all of which blew up after placing explosives and waiting for the timer to end. These objectives have been modified to allow any bomb, radiusdamage explosion, or rocket explosion to blow them up (for this mod, rockets do very little damage; it's unlikely that a rocket will blow these up). This was achieved by spawning in a few mini invisible tanks next to the objectives. Since tanks cannot be damaged by grenades or bullets, they serve as trigger sensors (setsizes have been downsized in "models/vehicles/kingtank.tik"). Once a tank's health goes to 0, the objective blows up and deals a huge radiusdamage, just like they would if the objectives were blown up and the game subsequently ended. The game does not end now, and blown up objectives do not count to any scoreboard. For this mod, the Radiobomb-Walkie Triggers or the Giant Bomb are the best two weapons to blow up one of these objectives.
- Parameters: objective's health, explosion damage, explosion radius.
- Example: thread flak88 400 500 1100

- (6.) Random Crater Explosions: Modified from Omaha Beach's original crater explosions, all "random_explode" threads are initialized with coords, damage, and radius first. These threads, one for each crater, wait a randomized amount of time before blowing up anything inside their crater.
- Parameters: explosion damage, explosion radius.
- Example: thread random_explode_setup 256 275

<><><> <><><>

<><><> <><><>

<><><> Features (Map-Specific Mods), the fun stuff <><><>

- mohdm1: There are 2 dark wooden cabinets that can be opened and closed (animated cabinets); the cabinet doors can be shot through.

- mohdm3: (Extra Map Stuff): The 2nd-floor bathroom on the Axis side has a bathtub, sink, and toilet. When the bathtub or sink is triggered, a water dripping sound is looped. When triggered again, the loopsound turns off. When the toilet is triggered, a flushing sound is played for about 6 seconds. There are 3 cabinets in the pub and 1 in the library that can be opened and closed (animated cabinets); the cabinet doors can be shot through.

- mohdm6: (Extra Map Stuff): One "slidingobject" cabinet located outside and below the 4 blacked out windows. This cabinet can be pushed across the ground in any direction that a player is facing, thanks to global/math.scr computing the x and y coordinates [distance*sin(playerangle), distance*cos(playerangle), roofheight], with distance = 15 coord units. 4 invisible walls (trigger_use) are placed before the roof's edges, building walls, and long-segment sandbags. When the cabinet touches a trigger_use wall, both the cabinet and player are moved back about 15 units, that way the player doesn't get stuck inside the cabinet. When moved to a convenient spot, this cabinet can be used as cover for sniping or hiding in corners.
- Parameters: model, origin, angles, distance (how far it moves per push), movetime (how long to move per push), fov (how close the object must be in the player's center view to push it; keep around 45-60 degrees). A standalone script is also found in "maps/gen_mapscripts/slidingobject.scr".
- Example: thread slidingobject static/cabinet_large.tik ( 1010 -100 304 ) ( 0 0 0 ) 18 0.8 60

- mohdm7: (Extra Map Stuff): (1.) The 2nd-floor military radio has 5 "waittill trigger" lines; each time it's triggered, a loopsound from the radio changes. No sound plays initially. 1st trigger = radiostatic3, 2nd trigger = radiostatic2, 3rd trigger = radio music plays, 4th trigger = radiostatic1, 5th trigger = stoploopsound.

(2.) The fireplace near the 4 beds, large cabinet, and broken wall has a valve switch in the upper right corner. When triggered, the valve slightly rotates, closing the chimney and releasing thick black smoke into the room. The entire rightside corner can now be used as a great hiding spot, hidden from the nearby doorway. Trigger the valve again to turn off the black smoke. [See "Features (UBER OBJ Map Mods)" for more details on the following OBJ map contents below].
- Parameters: origin, angles, valve rotate time, rotate angle amount, clockwise (keep clockwise = 1 when initializing this valve)
- Example: thread firesmoke; thread fire_valveswitch ( -3185 -276 -6 ) ( -50 90 0 ) 2 90 1

- obj_team4: (1. Bridge Explosion): The bridge can be blown up at any time with a Giant Bomb or Radiobomb-Walkie triggers. Regularly planting explosives are removed, and the game does not end after blowing up the objective.

(2. Extra Map Stuff): The truck in the axis spawn has a hidden trigger next to the driver side door. Holding down the USE key for 3 seconds turns on the truck, playing a truck idle loopsound. Holding the USE key for 1 second or less honks the trunk horn. Holding the USE key for 3 seconds turns off the truck. Unless parameters are changed, the truck horn can only be honked when the truck is on.

- obj_team1: (1. Flak88 Explosion): The Flak88 can be blown up at any time with a Giant Bomb or Radiobomb-Walkie triggers. Regularly planting explosives are removed, and the game does not end after blowing up the objective. Players can press USE near the Flak88 to begin looking around (similar to MG42s) and rapidly firing large slow-moving fireballs (fancyfire emitters). These fireball projectiles are each affected by gravity, are yellow-lit, and deal 50 damage with small kickback (see models/statweapons/flak88turret.tik for code)

(2. Airstrikes): Airstrikes occur every 3 minutes and 30 seconds, blowing up the entire area around the bottleneck points near the curved road, bushes and barbwire, and next to the two 2-story buildings.

(3. Random Crater Explosions): There are 5 craters on the Axis side and 2 behind the Allies-side barbwire, all with painless fire emitters and randomly timed deadly mortar explosions. 

(4. Extra Map Stuff): The 2nd-floor bathroom on the Allies side has a bathtub and toilet. When the bathtub or sink are triggered, a water dripping sound is looped. When triggered again, the loopsound turns off. When the toilet is triggered, a flushing sound is played for about 6 seconds.

- obj_team2: (1. V2 Rocket, Control Room Explosions): Both can be blown up at any time with a Giant Bomb or Radiobomb-Walkie triggers. Regularly planting explosives are removed, and the game does not end after blowing up the objectives. 

(2. Airstrikes): Airstrikes occur every 3 minutes and 30 seconds, blowing up the entire grassy area outside and behind the metal fences, next to the trees. 

(3. Fireworks): Original code was kept, besides changing the amount of corona-entity particles, increasing their lifespan, and making them bigger with a larger light radius. The script spwans in a non-animated alarm switch at the launcher origin, and spawns in a spinning purple-lit V2 rocket at the rocket origin. When the alarm switch is triggered, a V2 rocket flies vertically upwards about "vertical distance" units from the spinning V2 rocket origin. The V2 rocket then explodes, spreading out large particles in all directions that rain down for "particle lifetime" seconds (the longer the time, the further down they fall), before disappearing and resetting the trigger. The explosion's scale can also be specified, where scale = 0 or NIL omits an explosion (only particles).
- Parameters: rocket origin, launcher origin, launcher angles, vertical distance, particle lifetime, explosion scale.
- Example: exec global/fworks.scr ( 2300 1277 -784 ) ( 2362 1210 -740 ) ( 0 270 0 ) 1000 2.5 0.5

(4. Extra Map Stuff): (4a.) Holding down the USE key for 3 seconds turns on the Allies-side truck, playing a truck idle loopsound. Holding the USE key for 1 second or less honks the trunk horn, more audible than the truck idle sound. Holding the USE key for 3 seconds turns off the truck. 

(4b.) Similarly in mohdm7, the two Axis-side 2nd-floor military radios have 5 "waittill trigger" lines; each time one is triggered, a loopsound from the radio changes. 

(4c.) The electric transformers on the wall in the Allies side near the basement ladder has an electrical switch above one of them. When triggered, 3 nearby transformers are turned on, looping 1 of 3 randomized transformer_humming sounds. Triggering the switch again turns off the transformers. 

(4d.) The red vertical steam pipes next to the two Allies-side doors have a hidden electrical switch near the ceiling. When triggered, steam-control turns off, slowly filling the area with white steam over a growtime of 7 seconds. The steam is mainly for show; it does not kill, damage, or completely obscure a player's vision. When triggered again, steam control turns back on, shrinking the steam emitters down to 0 over a shrinktime of 3 seconds.
- Parameters: eswitch origin, angles, pipe steam origin (while standing on floor), steam angles, max scale (default: 4), grow time (default: 7), shrink time (default: 3)
- Example: thread pipesteam ( -448 799 -326 ) ( 0 180 0 ) ( -465 810 -439 ) ( 0 180 0 ) 4 10 3

- obj_team3: (1. AA Gun Explosions): Both Axis-side AA Guns can be blown up at any time with a Giant Bomb or Radiobomb-Walkie triggers. Regularly planting explosives are removed, and the game does not end after blowing up the objective. 

(2. Airstrikes): An airstrike occurs every 3 minutes and 20 seconds, blowing up a huge portion of the central Allies-side beach. Another airstrike occurs every 3 minutes, blowing up most of the outside area on the upper Axis side of the beach. 

(3. Random Crater Explosions): There are 2 craters on the upper Axis side beach, 4 in the middle of the map, and 7 on Allies-side beach, all with painless fire emitters and randomly timed deadly mortar explosions. 

(4. Military Radio Music): Similarly in mohdm7, the Axis-side 2nd-floor military radio has 5 "waittill trigger" lines; each time it's triggered, a loopsound from the radio changes.

(5. Vertical Pipe Steam (two-way switch)): Both the electrical switch from the Allies-side underground bunkers going up the first set of stairs and the switch from the Axis-side underground bunker office (above the military radio) are connected. When one is triggered, the turnon animation occurs for both switches. By default, the switches will not work unless the "Steam Generator" is turned on first. In the Axis-side underground bunker, a metal cylindrical object attached to the pipes (not far from the military radio) also has a valve switch attached. When this valve switch is triggered, the Steam Generator turns on, allowing the two electrical switches to be triggerable. Once an eswitch is triggered, steam slowly grows out of 5 different vertical pipes within the underground bunkers (similarly in obj_team2). Triggering an eswitch again turns off the harmless steam. Since the two switches are connected, both an Allies player and an Axis player could trigger the Vertical Pipe Steam, but the Axis are much closer to the Steam Generator.
- Parameters (a): switch_1 origin, switch_1 angles, switch_2 origin, switch_2 angles, smoke scale, grow time, shrink time (growing/shrinking disables the switches until time duration has passed).
- Example (a): thread pipesteam_init ( 1861 -454 147.8 ) ( 0 180 0 ) ( 403 414 -236.2 ) ( 0 0 0 ) 4.5 10 4
- Parameters (b): steam valve origin, angles, rotate time, rotate angle amount, clockwise (1 = cw, generator is off initially; 0 = counter cw, generator is on initially and eswitches are enabled).
- Example (b): thread steamvalve ( 1617 150 98 ) ( 0 -90 0 ) 3 180 1

(6. Minen (entmint) Crate Explosions): There are 4 boxes of mines labeled "Minen / entmint" throughout the underground bunkers. Similar to the objectives having hidden mini tanks next to them to serve as sensors which only take damage from explosions, bombs, and rockets; these minen crates utilize mini bmwbikes instead of mini tanks. The hidden bmwbike vehicles also allow damage from grenades (tanks do not). Thus, if a grenade is thrown too close to a minen crate, the bmwbike's health will go to 0, blowing up the minen crate and anyone around it and showing a nice explosion and sound effect. A fire emitter then appears above the crate for an offtime of 40 seconds. After 40 seconds, the minen crate can be blown up again. Bmwbikes cannot have the same origin as the fire since they are still heavy vehicles with wheels (droptofloor); they might roll off uneven objects or spawn inside a wall, unless spawned on a wide open flat area.
- Parameters: explosion local.origin, fire local.origin, bmwbike angles, health, explosion damage, radius, offtime
- Example: thread minenbombs ( 976 -552 -547 ) ( 1005 -551 -511 ) 50 400 620 40

(7. Beach Barbwire Bangalores): The 3 central beach barbwire sections are still covered in barbwire, but can be blown up when a bangalore is planted below them. One bangalore is located in each of the 3 higgins boats. Once picked up, the player must hold USE for 3 seconds to plant it on the red-pulsating area below a barbwire section. Once planted, the player has 5 seconds to run away before the bangalore explodes, blowing up the barbwire section and allowing players to run through. The explosion is huge, so make sure you keep running. If a player dies while holding a banglore, it drops below their feet (they never respawn either, so be careful). 
- Parameters (a): red light (1 = yes, light is always on bangalore, 0 = no light), hold_USE_to_plant (1 = yes, 0 = instantly plant), time holding USE to plant, countdown time until explosion.
- Example (a): thread bangalores_init 0 1 3 5 
- Parameters (b): name, origin, angles (need at least 3 bangalores for Omaha Beach, one per barbwire section).
- Example (b): thread barbwire_bombs bangalore1 ( -785 -5040 -448 ) ( 0 30 0 ) 

<><><> <><><>