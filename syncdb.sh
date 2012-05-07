#!/bin/bash

./manage_local syncdb
./manage_local convert_to_south groo
./manage_local schemamigration groo --auto
./manage_local migrate
