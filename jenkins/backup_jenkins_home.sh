#!/usr/bin/env bash
path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
jenkins_home="/var/jenkins"

mkdir -p ${path}/jenkins_home
rm -rf ${path}/jenkins_home/*
plugins=$(curl -s 'http://localhost:8181/pluginManager/api/json?depth=2&tree=plugins\[shortName,version\]' | perl -pe 's/.*?shortName":"([^"]*)","version":"([^"]*)/\1:\2\n/g' | sed '$ d' | sort -u)
echo $plugins
echo "$plugins" > ${path}/jenkins_home/plugins.txt
cp ${jenkins_home}/*.xml ${path}/jenkins_home/
cd ${jenkins_home}
find jobs nodes hosts -name config.xml | xargs -i% cp -rf --parents '%' "${path}/jenkins_home/"
cd ${path}
