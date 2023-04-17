# Dungeon DJ

This is a music management tool for tabletop role-playing games.  
Designed for use with the foobar2000 media player due to the fade in/out functionality and nice features.

## Description

Basically you just play your playlists for the game situations via hotkeys. Like press B for Battle music, press T for Tavern and so on. The player stays hidden and don't bother your small laptop screen. Music can be stored as audio files or youtube-links. Also the fade in/out foobars function works like a charm. 

For Windows use only.

## How to use

1. Download [DungeonDJ](https://github.com/seorgiy/dungeon-dj/releases), unzip it
2. Download [foobar2000](https://www.foobar2000.org/download)
3. Install foobar to `/foobar2000` folder or specify path to .exe in the `config.ini` file. Portable installation is completly fine, but don't forget to set some  [settings](#foobar-settings)
4. Put your music in the `/music` subfolders and name that folders whatever you like. The first letter of the name of each folder stands for a key that you need to press to play music from that folder. Examples included.
5. Run `play.exe`, don't mind Windows Defender. It dislikes autohotkeys scripts. 
6. Press `Alt` and the chosen Key for music
7. **Optional.** Check out recommended [Foobar settings](#foobar-settings) for the best experience.
7. **Optional.** Install Foobar youtube-component if you want to add music from the Youtube videos.

## Foobar settings

* File → Preferences → Playback → Output → Fading → check «Enable smooth seeking...» & set «Manual track change» slider to whatever your like, 4000ms recommended. That makes music changes like in videogames, so nice and smooth 🤙
* File → Preferences → Display → Default User Interface → Background and Notifications → turn on «Minimize hides, close exits» if you want to minimize foobar
* File → Preferences → Shell Integration → turn off «Bring to front when adding new files» if you want foobar to stay hidden during Dungeons track changes
* Playback → Order → set «Random» if you want to run music from folder in random order

## Music from Youtube
Foobar is such a great thing due to possibility of mixing local files and youtube videos in one playlist. Lets do this.

1. Download [component](https://fy.3dyd.com/download/). For me version `foo_youtube_3.9_beta2` works fine.
2. Open Foobar → File →  Preferences → Components → Install → dowloaded file.

Now you may go View → Youtube Source → Search on Site → type something like «ambient music» → add it to currrent playlist with smooth fade in effect!
But even on top of that you may ***save youtube video link as a file***. 
Just right click on video → foobar2000 → File Operations → Copy to → choose your DungeonDJ music subfolder. Name tarck as you want but you need to add `.foo_youtube` extension in the end.

<details>
 <summary>Screenshots</summary>
![image](https://user-images.githubusercontent.com/44596276/232573209-73467f59-fba9-4543-816e-ec4e7c42ad71.png)
![image](https://user-images.githubusercontent.com/44596276/232573810-c3f5fbd2-997b-46f2-a404-af6c1abbd1d3.png)
</details>


## Options

* You may turn off the now-playing notifications in the config.ini file.
* Change language between en or ru. Impact only notifications for now :wink:
* Change key for the combination if you don't like `Alt`. Use ahk [codes](https://www.autohotkey.com/docs/v1/KeyList.htm#modifier)

## More fun

Actually I made it for my custom keyboard so you may also like this idea. With some [VIA](https://www.caniusevia.com/) or [Vial](https://get.vial.today/) you can become the real Dungeon DJ. Personally, I use DOIO KB16-01:

![image](https://user-images.githubusercontent.com/44596276/232434304-dbe02390-e56d-4983-bab5-0b2229a4dff7.png)

## Credits
[Pleasant Notify library](https://www.autohotkey.com/boards/viewtopic.php?f=6&t=6056)
