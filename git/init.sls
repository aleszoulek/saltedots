git:
  pkg:
    - installed

/home/a/.gitignore:
  file.managed:
    - source: salt://git/.gitignore
    - user: a
    - group: a

/home/a/.gitconfig:
  file.managed:
    - source: salt://git/.gitconfig
    - user: a
    - group: a


