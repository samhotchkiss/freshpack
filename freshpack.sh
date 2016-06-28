#!/bin/bash

url="https://betadownload.jetpack.me/jetpack.zip"
opt=$1

if [ "rc" == "$1" ]; then
	url="https://betadownload.jetpack.me/rc/jetpack.zip"
fi

if [ "repo" == "$1" ]; then
	url="jetpack"
fi

wp core update
wp core update-db
wp jetpack disconnect blog
yes yes | wp jetpack reset options
wp plugin uninstall --deactivate jetpack
wp plugin install $url
wp plugin activate jetpack
wp plugin update akismet
wp plugin update vaultpress
