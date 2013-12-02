include:
  - vim
  - zsh
  - git

default-packages:
  pkg.installed:
    - pkgs:
      - htop
      - tmux
      - sudo

a:
  user.present:
    - fullname: Ales Zoulek
    - home: /home/a
    - shell: /bin/zsh

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

# TODO store priv key in pillar?


