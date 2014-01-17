include:
  - vim
  - zsh
  - git
  - weechat
  - tmux
  - sudo
  - feh
  - npm

default-packages:
  pkg.installed:
    - pkgs:
      - htop
      - wget
      - ntp
      - lshw
      - acpi
      - rtorrent
      - dosfstools
      - powertop
      - cpupower
      - python-virtualenvwrapper
      - jdk7-openjdk
      - wine-mono
      - wine_gecko
      - nmap
      - ipython
      - unrar
      - lftp
      - dnsutils
      - s3cmd
      - nodejs
      - redis
      - nginx
      - python2-pylint

a:
  user.present:
    - fullname: Ales Zoulek
    - home: /home/a
    - shell: /bin/zsh
    - groups:
      - wheel
      - audio

/home/a/.ssh:
  file.directory:
    - mode: 700
    - user: a
    - group: a
    - require:
      - user: a

/home/a/.ssh/id_rsa.pub:
  file.managed:
    - source: salt://user/ales.pub
    - user: a
    - group: a
    - require:
      - file: /home/a/.ssh

/home/a/bin:
  file.recurse:
    - source: salt://user/bin
    - user: a
    - group: a
    - file_mode: 755

# TODO store priv key in pillar?

pam_ssh:
  cmd.run:
    - name: yaourt -S --noprogressbar --noconfirm pam_ssh
    - unless: pacman -Q pam_ssh

vim-pylint:
  cmd.run:
    - name: yaourt -S --noprogressbar --noconfirm vim-pylint
    - unless: pacman -Q vim-pylint

/etc/pam.d/login:
  file.managed:
    - source: salt://user/pam_login
    - require:
      - cmd: pam_ssh
