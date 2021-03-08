#!/bin/bash
cd ReaderApi && mvn clean && cd ..
mkdir -p war
cd ReaderFront && npm install
ng build --prod --outputPath=../ReaderApi/src/main/resources/static/
cd ../ReaderApi && mvn clean install
cp target/*.war ../war/reader.war
cd ..
docker build -t reader .
heroku container:push web -a netreader
heroku container:release web -a netreader
