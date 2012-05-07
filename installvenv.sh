#!/bin/bash

virtualenv --no-site-packages venv

# VITAL
venv/bin/easy_install -U django
venv/bin/easy_install -U mysql-python
venv/bin/easy_install -U South
venv/bin/easy_install -U django_extensions

# OPTIONAL
venv/bin/easy_install -U mechanize
venv/bin/easy_install -U xmpppy
venv/bin/easy_install -U python-gettext
venv/bin/easy_install -U firepy
