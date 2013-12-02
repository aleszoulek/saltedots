weechat:
  pkg:
    - installed

/home/a/.weechat:
  file.recurse:
    - source: salt://weechat/.weechat
    - user: a
    - group: a
