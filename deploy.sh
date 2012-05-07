#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` <project_name>"
    exit 1
fi

TEMPLATE_DIR=$(cd "$(dirname "$BASH_SOURCE")"; pwd)
PROJECT_NAME=$1
NEW_PROJECT_DIR=`pwd`/$PROJECT_NAME

mkdir $NEW_PROJECT_DIR
cd $NEW_PROJECT_DIR

# template init
cp -R $TEMPLATE_DIR/* ./
cp $TEMPLATE_DIR/.gitignore ./
git init
git add .
git ci -m 'template files'

# project init
git mv web/duvenx web/$PROJECT_NAME
git mv web/debian/duvenx.logrotate web/debian/$PROJECT_NAME.logrotate
find . -name "*" -exec sed -i "s/duvenx/$PROJECT_NAME/g" {} \;
git add .
git ci -m "project $PROJECT_NAME init"

# local settings
cp web/$PROJECT_NAME/settings_local.tpl.py web/$PROJECT_NAME/settings_local.py
NEW_PROJECT_DIR_ESCAPED=$(echo "$NEW_PROJECT_DIR" | sed 's/\//\\\//g')
find . -name settings_local.py -exec sed -i "s/local_project_root/$NEW_PROJECT_DIR_ESCAPED/g" {} \;
mkdir -p $NEW_PROJECT_DIR/web/devices
touch $NEW_PROJECT_DIR/web/devices/default.sqlite

# venv
./installvenv.sh

# syncdb
./syncdb.sh

# cleanup
rm deploy.sh
