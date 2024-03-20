This guide is copied from TG documentation. Not all points may apply (for example we only use one map) but broadly, it does.

## DOWNLOADING
There are a number of ways to download the source code. Some are described here,
an alternative all-inclusive guide is also located at:
http://www.tgstation13.org/wiki/Downloading_the_source_code

Option 1:
Follow this: http://www.tgstation13.org/wiki/Setting_up_git. Make sure to do
this for Dusty Trails instead of TG, i.e. replace the URL for TG's
repository with `https://github.com/F13-Dusty-Trails/F13-Dusty-Trails`
and go to the Dusty Trails repo when it mentions TG's repo.

Option 2: Download the source code as a zip by clicking the ZIP button in the
code tab of https://github.com/F13-Dusty-Trails/F13-Dusty-Trails
(note: this will use a lot of bandwidth if you wish to update and is a lot of
hassle if you want to make any changes at all, so it's not recommended.)

## INSTALLATION
First-time installation should be fairly straightforward. First, you'll need
BYOND installed. You can get it from https://www.byond.com/download. Once you've done
that, extract the game files to wherever you want to keep them. This is a
source code only release, so the next step is to compile the server files.
Use the **BUILD.bat** file as the regular DM compiler can't handle the codebase
properly. This'll take a little while, and if everything's done right you'll get
a message like this:

```
saving fortune13.dmb (DEBUG mode)
fortune13.dmb - 0 errors, 0 warnings
```

If you see any errors or warnings, something has gone wrong - possibly a corrupt
download or the files extracted wrong. If problems persist, ask for assistance
in the Coderbus discord: https://discord.gg/Vh8TJp9

You'll also want to edit config/admins.txt to remove the default admins and add
your own. "Host" is the highest level of access, and probably the one
you'll want to use for now. You can set up your own ranks and find out more in
config/admin_ranks.txt

The format is

```
byondkey = Rank
```

where the admin rank must be properly capitalised.

This codebase also depends on a native library called rust-g. A precompiled
Windows DLL is included in this repository, but Linux users will need to build
and install it themselves. Directions can be found at the [rust-g
repo](https://github.com/tgstation13/rust-g). Exact version info can be found
in `dependencies.sh` in this folder.

Unlike TGstation, this codebase also relies on a library called Auxmos. A
precompiled Windows DLL is included in this repository, but Linux users will
need to build and install it themselves. Directions can be found at the [Auxmos
repo](https://github.com/Putnam3145/auxmos), maintained by Putnam3145. Exact
version info can be found in `dependencies.sh` in this folder.

Finally, to start the server, run Dream Daemon and enter the path to your
compiled fortune13.dmb file. Make sure to set the port to the one you
specified in the config.txt, and set the Security box to 'Trusted'. Then press
GO and the server should start up and be ready to join. It is also recommended
that you set up the SQL backend (see below).

## UPDATING
To update an existing installation, first back up your /config and /data folders
as these store your server configuration, player preferences and banlist.

Then, extract the new files (preferably into a clean directory, but updating in
place should work fine), copy your /config and /data folders back into the new
install, overwriting when prompted except if we've specified otherwise, and
recompile the game.  Once you start the server up again, you should be running
the new version.

## HOSTING
If you'd like a more robust server hosting option for tgstation and its
derivatives. Check out /tg/'s server tools suite at
https://github.com/tgstation/tgstation-server

## MAPS
Maps have their own code file that is in the base of the _maps directory. Maps are loaded dynamically when the game starts. Follow this guideline when adding your own map, to your fork, for easy compatibility.

The map that will be loaded for the upcoming round is determined by reading data/next_map.json, which is a copy of the json files found in the _maps tree. If this file does not exist, the default map from config/maps.txt will be loaded. Failing that, BoxStation will be loaded. If you want to set a specific map to load next round you can use the Change Map verb in game before restarting the server or copy a json from _maps to data/next_map.json before starting the server. Also, for debugging purposes, ticking a corresponding map's code file in Dream Maker will force that map to load every round.

If you are hosting a server, and want randomly picked maps to be played each round, you can enable map rotation in [config.txt](config/config.txt) and then set the maps to be picked in the [maps.txt](config/maps.txt) file.

**Anytime you want to make changes to a map it's imperative you use the [Map Merging tools](http://tgstation13.org/wiki/Map_Merger).**

## SQL SETUP
The SQL backend requires a Mariadb server running 10.2 or later. Mysql is not supported but Mariadb is a drop in replacement for mysql. SQL is required for the library, stats tracking, admin notes, and job-only bans, among other features, mostly related to server administration. Your server details go in /config/dbconfig.txt, and the SQL schema is in /SQL/tgstation_schema.sql and /SQL/tgstation_schema_prefix.sql depending on if you want table prefixes.  More detailed setup instructions are located here: https://www.tgstation13.org/wiki/Downloading_the_source_code#Setting_up_the_database

## WEB/CDN RESOURCE DELIVERY
Web delivery of game resources makes it quicker for players to join and reduces some of the stress on the game server.

1. Edit compile_options.dm to set the `PRELOAD_RSC` define to `0`
1. Add a url to config/external_rsc_urls pointing to a .zip file containing the .rsc.
    * If you keep up to date with /tg/ you could reuse /tg/'s rsc cdn at http://tgstation13.download/byond/tgstation.zip. Otherwise you can use cdn services like CDN77 or cloudflare (requires adding a page rule to enable caching of the zip), or roll your own cdn using route 53 and vps providers.
	* Regardless even offloading the rsc to a website without a CDN will be a massive improvement over the in game system for transferring files.
