feh:
  pkg:
    - installed

/home/a/.fehbg:
  file.managed:
    - source: salt://feh/.fehbg
    - user: a
    - group: a

/home/a/.wallpaper.jpg:
  file.managed:
    - source: salt://feh/.wallpaper.jpg
    - user: a
    - group: a


