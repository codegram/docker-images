#!/bin/bash

DATABASE_URL=`heroku pg:backups public-url --app $HEROKU_APP | egrep -o 'http([^\"]*)'`

echo "Downloading database dump from url $DATABASE_URL"

curl -o $2.dump $DATABASE_URL

echo "Importing dump into $2 ..."

pg_restore --verbose --clean --no-acl --no-owner -h $DB_HOST -U $DB_USER -d $DB_NAME $2.dump
