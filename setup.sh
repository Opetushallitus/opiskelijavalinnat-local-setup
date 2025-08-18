#!/bin/bash

# haetaan kirjasto
CACHE_MANIPULATOR_VERSION=1.8.3
mvn dependency:copy -Dartifact=com.alibaba:dns-cache-manipulator:$CACHE_MANIPULATOR_VERSION -DoutputDirectory=./download
cp ./download/dns-cache-manipulator-$CACHE_MANIPULATOR_VERSION.jar ./dns.jar

# luodaan self-signed -certti
openssl req -x509 -newkey rsa:2048 -keyout docker/nginx/selfsigned-key.pem -out docker/nginx/selfsigned-cert.pem -days 3650 -nodes -subj "/CN=*.untuvaopintopolku.fi" -addext "subjectAltName=DNS:*.hahtuvaopintopolku.fi,DNS:*.testiopintopolku.fi"

# importataan self-signed -certti JVM ca-tiedostoon
cp cacerts_original cacerts
keytool -importcert -file ./docker/nginx/selfsigned-cert.pem -keystore ./cacerts -alias selfsigned -noprompt