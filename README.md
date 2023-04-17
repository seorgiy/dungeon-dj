# Dungeon DJ

This is a music management tool for tabletop role-playing games.  
Designed for use with the foobar2000 media player due to the fade in/out functionality and nice cmd features.

For Windows use only.

## How to use

1. Download [DungeonDJ](https://github.com/seorgiy/dungeon-dj/releases), unzip it
2. Download [foobar2000](https://www.foobar2000.org/download)
3. Install foobar to `/foobar2000` folder or specify path to .exe in the `config.ini` file. Portable installation is completly fine, but don't forget to set some  [settings](#foobar-settings)
4. Put your music in the `/music` subfolders and name that folders whatever you like. The first letter of the name of each folder stands for a key that you need to press to play music from that folder. Examples included.
5. Run `play.exe`, don't mind Windows Defender. It dislikes autohotkeys scripts. 
6. Press `Alt` and the chosen Key for music

## Foobar settings
Recomended for the best experience.

* File > Preferences > Playback > Output > Fading > check «Enable smooth seeking...» & set «Manual track change» slider to whatever your like, 4000ms recomended. That makes music changes like in videogames, so nice and smooth 🤙
* File > Preferences > Display > Default User Interface > Background and Notifications > turn on «Minimize hides, close exits» if you want to minimize foobar
* File > Preferences > Shell Integration > turn off «Bring to front when adding new files» if you want foobar to stay hidden during Dungeons track changes
* Playback > Order > set «Random» if you want to run music from folder in random order

## Options

* You may turn off the now-playing notifications in the config.ini file.
* Change language between en or ru. Impact only notifications for now :wink:
* Change key for the combination if you don't like `Alt`. Use ahk [codes](https://www.autohotkey.com/docs/v1/KeyList.htm#modifier)

## More fun

Actually I made it for use with custom keyboard so you may also like this idea. Using some [VIA](https://www.caniusevia.com/) or [Vial](https://get.vial.today/) you can become the real Dungeon DJ. Personally, I use DOIO KB16-01:

![image](https://user-images.githubusercontent.com/44596276/232434304-dbe02390-e56d-4983-bab5-0b2229a4dff7.png)

## Credits
[Pleasant Notify library](https://www.autohotkey.com/boards/viewtopic.php?f=6&t=6056)
