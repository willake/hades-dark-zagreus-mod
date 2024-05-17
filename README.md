# Dark Zagreus

A mod of a well-known game, [Hades](https://store.steampowered.com/app/1145360/Hades/). It turns the final boss, Hades himself, into a mirror image of the player character, whom I call Dark Zagreus. Inspired by similar concepts in other games, like Dark Link from the Zelda series. In each encounter, Hades equips the same weapon as the player's previous successful run. What sets this mod apart is the AI of Dark Zagreus is powered by a deep learning model trained on the player's historical gameplay data of previous successful run. This experimental feature creates a dynamic and challenging confrontation tailored to the individual's style and strategies.

## Installation

### Step 1 - Install mod importer
Follow the [tutorial](https://www.nexusmods.com/hades/mods/26) to install mod importer. We will use this to import mods.

### Step 2 - Import Dark Zagreus
To install the mod, download it and place it in the mod folder of Hades, located at `{$YourHadesRootFolder}\Content\Mods.` Next, run the mod importer. Once the importer has finished, you're ready to go.

## Feature
After installing the mod, you can start a run. At the end of the run, you will see Dark Zagreus standing opposite you, ready to fight. In the first attempt, since there is no previous run data, Dark Zagreus will equip the most basic weapon, and his AI will be driven by random values. After completing the run, the next time you encounter Dark Zagreus, he will equip the weapon you used in your previous run.

> Note that only successful runs will be considered. If you die during a run, the AI will not be updated.

## Limitation
### Cast, call, and summon support
Cast, call, and summon are complex systems in Hades, requiring considerable time to implement. Therefore, Dark Zagreus will not use these actions. Cast might be supported in the future as it is somewhat easier to implement.

### Boons and Daedalus Hammer
Boons and Daedalus Hammer upgrades are driven by the trait system in the game code. The challenge in implementing these for non-player characters is that many mechanics are specifically designed for player use. The functions these upgrades introduce are tailored for manipulating the player character, requiring replication and reimplementation of all traits and their functions for Dark Zagreus. This is a substantial amount of work and may be supported in future versions. Other mod developers are welcome to build upon this mod and extend its capabilities.

## Known issues
- Hades animations are not fully changed
- Bow charging animations are missing
- Aspect of Lucifer (The 4th gun weapon) attack is not working