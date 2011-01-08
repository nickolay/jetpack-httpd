#!/bin/bash

MOZILLA_CENTRAL=~/dev/mozilla-work/src/
UPSTREAM_CHANGESET=`hg parents $MOZILLA_CENTRAL/netwerk/test/httpserver/httpd.js --template "{node|short}"`
echo $UPSTREAM_CHANGESET > upstream-changset.upd
echo "Creating package.json.upd..."
cat package.json | sed "s@/file/............/netwerk/@/file/$UPSTREAM_CHANGESET/netwerk/@" > package.json.upd
echo "Creating httpd.js.orig.upd..."
cp $MOZILLA_CENTRAL/netwerk/test/httpserver/httpd.js ./httpd.js.upstream.upd
echo "Creating lib/httpd.js.upd..."
cp ./httpd.js.upstream.upd ./lib/httpd.js.upd
patch ./lib/httpd.js.upd ./httpd.patch
