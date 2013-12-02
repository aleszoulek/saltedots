zsh:
  pkg:
    - installed

/home/a/.zsh.d:
  file.recurse:
    - source: salt://zsh/.zsh.d
    - user: a
    - group: a

/home/a/.zshrc:
  file.managed:
    - source: salt://zsh/.zshrc
    - user: a
    - group: a

