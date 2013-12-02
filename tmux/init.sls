tmux:
  pkg:
    - installed

/home/a/.tmux.conf:
  file.managed:
    - source: salt://tmux/.tmux.conf
    - user: a
    - group: a

