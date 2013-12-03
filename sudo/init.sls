sudo:
  pkg:
    - installed

/etc/sudoers:
  file.managed:
    - source: salt://sudo/etc/sudoers


