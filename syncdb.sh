#!/bin/bash

./manage_local.sh syncdb
./manage_local.sh convert_to_south groo
./manage_local.sh schemamigration groo --auto
./manage_local.sh migrate
