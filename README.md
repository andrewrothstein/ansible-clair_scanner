andrewrothstein.clair_scanner
=========
![Build Status](https://github.com/andrewrothstein/ansible-clair_scanner/actions/workflows/build.yml/badge.svg)

Installs [clair-scanner](https://github.com/arminc/clair-scanner).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.clair_scanner
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
