#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` <project_name>"
    exit 1
fi

HERE=`pwd`
PROJECT_NAME=$1
NEW_PATH=$HERE/$PROJECT_NAME

# project init
git remote rm origin
git mv web/duvenx web/$PROJECT_NAME
git mv web/debian/duvenx.logrotate web/debian/$PROJECT_NAME.logrotate
find . -name "*" -exec sed -i "s/duvenx/$PROJECT_NAME/g" {} \;
git add .
git ci -m "project $PROJECT_NAME init"

# local settings
cp web/$PROJECT_NAME/settings_local.tpl.py web/$PROJECT_NAME/settings_local.py
find . -name "web/$PROJECT_NAME/settings_local.py" -exec sed -i "s/local_project_root/$NEW_PATH/g" {} \;
mkdir -p $NEW_PATH/devices

# venv
./installvenv.sh

# syncdb
./syncdb.sh
