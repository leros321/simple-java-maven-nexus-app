#!/usr/bin/env bash

#echo 'extracts the value of the <version/> element within <project/> instead.'
#set -x
mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"
#set +x
