#! /bin/bash
rm -rf dist/install 2>/dev/null
mkdir dist/install
npm install --prefix dist/install .
rm dist/dist.zip
(cd dist/install/node_modules/alexa-plex; zip -r ../../../dist.zip * .env)
echo Function zipped. Updating...
aws lambda update-function-code --zip-file fileb://./dist/dist.zip --function-name alexa-plex
