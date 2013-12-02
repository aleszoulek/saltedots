# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# Set a background color

source ~/.fehbg

tint2 &


# Trackpoint TODO: Move to xorg.conf

# Vertical
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 8 200
# Horizontal
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5

# Don't turn off display
xset -dpms
