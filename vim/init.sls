gvim:
  pkg:
    - installed

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

