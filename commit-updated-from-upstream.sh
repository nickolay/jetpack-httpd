#!/bin/bash

echo "Moving *.upd files"

UPSTREAM_CHANGESET=`cat upstream-changset.upd` || exit $?
mv package.json.upd package.json
mv httpd.js.upstream.upd httpd.js.upstream
mv lib/httpd.js.upd lib/httpd.js

echo "Running tests..."

cfx test || exit $?

echo "OK, committing changes..."

git commit -o package.json httpd.js.upstream lib/httpd.js -m "Update from upstream $UPSTREAM_CHANGESET" || exit $?

rm upstream-changset.upd