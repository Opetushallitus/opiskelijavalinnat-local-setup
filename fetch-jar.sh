#!/bin/bash
VERSION=1.8.3
mvn dependency:copy -Dartifact=com.alibaba:dns-cache-manipulator:$VERSION -DoutputDirectory=./download
cp ./download/dns-cache-manipulator-$VERSION.jar ./dns.jar
