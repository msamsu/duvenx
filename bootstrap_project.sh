#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` <project_name>"
    exit 1
fi

PROJECT_NAME=$1

git remote rm origin

git mv web/duvenx web/$PROJECT_NAME
find . -name "*" -exec sed -i "s/{{duvenx}}/$PROJECT_NAME/g" {} \;
git add .
git ci -m "project $PROJECT_NAME init"