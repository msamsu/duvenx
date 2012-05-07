#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` <project_name>"
    exit 1
fi

TEMPLATE_DIR=$(cd "$(dirname "$BASH_SOURCE")"; pwd)
PROJECT_NAME=$1
NEW_PROJECT_DIR=$TEMPLATE_DIR/../$PROJECT_NAME

mkdir $NEW_PROJECT_DIR
cd $NEW_PROJECT_DIR

# template init
cp -R $TEMPLATE_DIR/* ./
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
find . -name "web/$PROJECT_NAME/settings_local.py" -exec sed -i "s/local_project_root/$NEW_PROJECT_DIR/g" {} \;
mkdir -p $NEW_PROJECT_DIR/devices

# venv
./installvenv.sh

# syncdb
./syncdb.sh

# cleanup
rm bootstrap_project.sh
