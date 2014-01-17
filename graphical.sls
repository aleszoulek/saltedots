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
      - mkvtoolnix-cli
      - mkvtoolnix-gtk
      - scrot
      - gnumeric
      - gimp
      - evince

google-talkplugin:
  cmd.run:
    - name: yaourt -S --noprogressbar --noconfirm google-talkplugin
    - unless: pacman -Q google-talkplugin
  require:
    - pkg: graphical-packages


ttf-microsoft-arial:
  cmd.run:
    - name: yaourt -S --noprogressbar --noconfirm ttf-microsoft-arial
    - unless: pacman -Q ttf-microsoft-arial
  require:
    - pkg: graphical-packages

ttf-mac-fonts:
  cmd.run:
    - name: yaourt -S --noprogressbar --noconfirm ttf-mac-fonts
    - unless: pacman -Q ttf-mac-fonts
  require:
    - pkg: graphical-packages
