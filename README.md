andrewrothstein.cmctl
=========

![Build Status](https://github.com/andrewrothstein/ansible-cmctl/actions/workflows/build.yml/badge.svg)

Installs the [cert-manager](https://github.com/cert-manager/cert-manager) cmctl cli.

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
    - andrewrothstein.cmctl
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
