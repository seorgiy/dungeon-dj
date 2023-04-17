# Dungeon DJ

This is a music management tool for tabletop role-playing games.  
Designed for use with the foobar2000 media player due to the fade in/out functionality and nice cmd features.

For Windows use only.

## How to use

1. Download [DungeonDJ](https://github.com/seorgiy/dungeon-dj/releases), unzip it
2. Download [foobar2000](https://www.foobar2000.org/download)
3. Install foobar to `/foobar2000` folder or specify path to .exe in the `config.ini` file. Portable installation is completly fine, but don't forget to set some  [settings](https://github.com/seorgiy/dungeon-dj#foobar-settings)
4. Put your music in the `/music` subfolders and name that folders whatever you like. The first letter of the name of each folder stands for the key that you need to press to play music from that folder. Examples included.
5. Run `play.exe`, don't mind Windows Defender. It dislikes autohotkeys scripts. 
6. Press `Alt` and chosen Key for music

## Foobar settings
Recomended for the best experience.

* File > Preferences > Playback > Output > Fading > check «Enable smooth seeking...» & set «Manual track change» slider to whatever your like, 4000ms recomended
* File > Preferences > Shell Integration > turn off «Bring to front when adding new files» if you want foobar to stay hidden during Dungeons track changes
* Playback > Order > set «Random» if you want to run music from folder in random order

## Options

* You may turn off the now-playing notifications in the config.ini file.
* Change language between en or ru. Impact only notifications for now :wink:
* Change key for the combination if you don't like `Alt`. Use ahk [codes](https://www.autohotkey.com/docs/v1/KeyList.htm#modifier)


## Credits
[Pleasant Notify library](https://www.autohotkey.com/boards/viewtopic.php?f=6&t=6056)
