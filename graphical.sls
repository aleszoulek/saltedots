include:
  - openbox
  - xorg
  - tint

graphical-packages:
  pkg.installed:
    - pkgs:
      - xterm
      - xlockmore
      - openbox
      - chromium
      - firefox
      - xorg-xinit
      - bashrun
      - geeqie
      - flashplugin
      - alsa-lib
      - alsa-utils
      - alsa-oss
      - alsa-plugins
      - alsa-tools
      - mplayer

google-talkplugin:
  cmd.run:
    - name: yaourt -S --noprogressbar --noconfirm google-talkplugin
    - unless: pacman -Q google-talkplugin
  require:
    - pkg: graphical-packages

