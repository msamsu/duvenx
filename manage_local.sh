#!/bin/bash

venv/bin/python web/rmsbackup/manage.py $@ --settings=rmsbackup.settings_local
