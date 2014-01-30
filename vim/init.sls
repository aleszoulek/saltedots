gvim:
  pkg:
    - installed

vim-plugins:
  pkg.installed:
    - pkgs:
      - vim-systemd

/home/a/.vim:
  file.recurse:
    - source: salt://vim/.vim
    - user: a
    - group: a

/home/a/.vimrc:
  file.managed:
    - source: salt://vim/.vimrc
    - user: a
    - group: a

vim-command-t:
  cmd.run:
    - name: yaourt -S --noprogressbar --noconfirm vim-command-t
    - unless: pacman -Q vim-command-t
  require:
    - pkg: gvim
