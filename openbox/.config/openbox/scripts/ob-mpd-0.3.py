#!/usr/bin/env python
#
# Author: John McKnight <jmcknight@gmail.com>
# License: GPL 2.0
#
# This script depends on py-libmpdclient which you can get from 
# http://www.musicpd.org/py-libmpdclient.shtml
#
# Usage:
# Put an entry in ~/.config/openbox/menu.xml:
# <menu id="mpd" label="MPD" execute="~/.config/openbox/scripts/ob-mpd-$version.py" />
#
# Then put the following wherever you'd like it to be displayed in your menu:
# <menu id="mpd" />
#
# New in 0.2:  Added a controls menu that allows you to play, pause and stop
#              MPD from the Openbox menu.
#
# New in 0.3:  Added a stats submenu that displays number of songs, artists and
#              albums in the MPD database.  Also did some minor cleanups.

import mpdclient, os, sys

# The default port for MPD is 6600.  If for some reason you have MPD running
# on a different port, change this setting to whatever you have it running on.
mpdPort = 6600

connect = mpdclient.MpdController(port=mpdPort)
song = connect.getCurrentSong()
stats = connect.stats()
status = connect.status()

if status.stateStr() == "stop":
  state = "Not playing"
elif status.stateStr() == "pause":
  state = "Playing: %s - %s (paused)\"/>" % (song.artist, song.title)
else:
  state = "Playing: %s - %s\"/>" % (song.artist, song.title)

def play():
  if status.stateStr() == "stop" or status.stateStr() == "pause":
    connect.play()
  else:
    pass

def pause():
  if status.stateStr() == "play":
    connect.pause()
  elif status.stateStr() == "pause":
    connect.play()
  else:
    pass

def stop():
  if status.stateStr() == "play" or status.stateStr() == "pause":
    connect.stop()
  else:
    pass

def prev():
  if status.stateStr() == "play":
    connect.prev()
  else:
    pass

def next():
  if status.stateStr() == "play":
    connect.next()
  else:
    pass

try:
  if (sys.argv[1] == "play"):
    play()

  if (sys.argv[1] == "pause"):
    pause()

  if (sys.argv[1] == "stop"):
    stop()
  if (sys.argv[1] == "prev"):
    prev()
  if (sys.argv[1] == "next"):
    next()
except IndexError:
  pass

print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
print "<openbox_pipe_menu>"
print "  <menu id=\"controls\" label=\"Controls\">"
print "    <item label=\"Play\">"
print "      <action name=\"Execute\"><execute>~/.config/openbox/scripts/ob-mpd-0.3.py play</execute></action>"
print "    </item>"
print "    <item label=\"Pause\">"
print "      <action name=\"Execute\"><execute>~/.config/openbox/scripts/ob-mpd-0.3.py pause</execute></action>"
print "    </item>"
print "    <item label=\"Stop\">"
print "      <action name=\"Execute\"><execute>~/.config/openbox/scripts/ob-mpd-0.3.py stop</execute></action>"
print "    </item>"
print "    <item label=\"Previous\">"
print "      <action name=\"Execute\"><execute>~/.config/openbox/scripts/ob-mpd-0.3.py prev</execute></action>"
print "    </item>"
print "    <item label=\"Next\">"
print "      <action name=\"Execute\"><execute>~/.config/openbox/scripts/ob-mpd-0.3.py next</execute></action>"
print "    </item>"
print "  </menu>"
print "  <menu id=\"stats\" label=\"Stats\">"
print "    <item label=\"Artists in database: %d\"/>" % stats.artists
print "    <item label=\"Albums in database: %d\"/>" % stats.albums
print "    <item label=\"Songs in database: %d\"/>" % stats.songs
print "  </menu>"
print "  <separator />"
print "  <item label=\"%s\"/>" % state
print "</openbox_pipe_menu>"
