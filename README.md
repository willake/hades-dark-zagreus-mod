# Dark Zagreus (Hades Mod) beta1.0

A mod for the game [Hades](https://store.steampowered.com/app/1145360/Hades/). It turns the final boss, Hades himself, into a mirror image of the player character, whom I call Dark Zagreus. Inspired by similar concepts in other games, like Dark Link from the Zelda series. In each encounter, Hades equips the same weapon as the player's previous successful run. What sets this mod apart is the AI of Dark Zagreus is powered by a deep learning model trained on the player's historical gameplay data of previous successful run. This experimental feature creates a dynamic and challenging confrontation tailored to the individual's style and strategies.

![Demo](./ReadmeAssets/demo.gif)

## Requirements
- [Hades](https://store.steampowered.com/app/1145360/Hades/) (V1.38290 or above)
- [Mod Importer](https://www.nexusmods.com/hades/mods/26)
- [ModUtil](https://www.nexusmods.com/hades/mods/27)
- [Max Save With No Run History](https://www.speedrun.com/hades/resources/hshp9) (Optional)

## Installation

### Step 1 - Install Mod Importer
Follow the [tutorial](https://www.nexusmods.com/hades/mods/26) to install mod importer. We will use this to import mods. Installing it is easy, drag the extracted file `modimporter.exe` to `{$YourHadesRootFolder}\Content\`. Next, create a `Mods` folder inside the Content folder. The Mods folder will be the place for the mods you want to import.

> **Where is the root folder for Hades?**
> The location varies depending on which platform you are using.
> - Steam: Library > Right-click on Hades > Manage > Browse local files > Content
> - Epic Games: C:\Program Files\Epic Games\Hades\Content
> - Microsoft Store: `<location you chose when installing via the Store>`\Hades\Content\Content

### Step 2 - Import ModUtil
Dark Zagreus uses some functions from ModUtil, so installing ModUtil is required. Download [ModUtil](https://www.nexusmods.com/hades/mods/27) and place it in the Mods folder.

### Step 3 - Import Dark Zagreus
To install the mod, download it and place it in the Mods folder of Hades, which has shown in the previous steps, the folder is located at `${YourHadesRootFolder}\Content\Mods.` Next, run the mod importer. Once the importer has finished, you're ready to go.

### Step 4 - Import a clean 100% save file (Optional)
The mod will save some data into your save file. Since it replaces the final boss, you might miss some story elements if you haven't finished the game yet. For the best experience, it is highly recommended to use a save file from a completed game. You can duplicate your save file as a backup. Alternatively, you can add a 100% save file to your game. For this, I suggest using [Max Save With No Run History](https://www.speedrun.com/hades/resources/hshp9) by ellomenop from the speedrun community.

#### How to import/backup a save file
The save file is located at C:\Users\${YourUserName}\Documents\Saved Games\Hades. The files are named according to the pattern ProfileX.sav, where X is the number of the save slot. To back up a save file, simply copy the file to another location or rename it. To import a save file, rename the file to ProfileX.sav, with X being the number of the save slot you want to use.

## Feature
After installing the mod, you can start a run. At the end of the run, you will see Dark Zagreus standing opposite you, ready to fight. In the first attempt, since there is no previous run data, Dark Zagreus will equip the most basic weapon, and his AI will be driven by random values. After completing the run, the next time you encounter Dark Zagreus, he will equip the weapon you used in your previous run.

> Note that only successful runs will be considered. If you die during a run, the AI will not be updated.

> Real-time deep learning model training takes time. The model is trained when you enter the boss room, so the screen might freeze for a few seconds during this process. 

## Limitation
### Cast, call, and summon support
Cast, call, and summon are complex systems in Hades, requiring considerable time to implement. Therefore, Dark Zagreus will not use these actions. Cast might be supported in the future as it is somewhat easier to implement.

### Boons and Daedalus Hammer
Boons and Daedalus Hammer upgrades are driven by the trait system in the game code. The challenge in implementing these for non-player characters is that many mechanics are specifically designed for player use. The functions these upgrades introduce are tailored for manipulating the player character, requiring replication and reimplementation of all traits and their functions for Dark Zagreus. This is a substantial amount of work and may be supported in future versions. Other mod developers are welcome to build upon this mod and extend its capabilities.

## Known issues
- Hades animations are not fully changed
- Bow charging animations are missing
- Aspect of Lucifer (The 4th gun weapon) attack is not working

## Special Thanks
The deep learning library in this mod is a modified version of [luann](https://github.com/wixico/luann) by wixico. Thanks to wixico implementing a lightweight and fast neural network in lua.

Thanks to the [mod community](https://github.com/SGG-Modding) of Hades for providing thorough tutorials. I also appreciate everyone on the Discord server for answering my questions and providing useful information.