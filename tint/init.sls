tint2:
  pkg:
    - installed

/home/a/.config/tint2:
  file.recurse:
    - source: salt://tint/.config/tint2
    - user: a
    - group: a


