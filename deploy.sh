#! /bin/bash
rm -rf dist/install 2>/dev/null
mkdir dist/install
npm install --prefix dist/install .
rm dist/dist.zip
zip dist/dist.zip ./dist/install/node_modules/alexa-plex/*
echo Function zipped. Updating...
# aws lambda update-function-code --zip-file fileb://dist\dist.zip --function-name alexa-plex
