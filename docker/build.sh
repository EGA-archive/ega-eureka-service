#!/bin/bash
git clone https://github.com/elixir-europe/ega-data-api-v3-eureka.git
mvn -Dmaven.test.skip=true -f /ega-data-api-v3-eureka/pom.xml install
mv /ega-data-api-v3-eureka/target/DiscoveryServer-0.0.1-SNAPSHOT.war /EGA_build
mv /ega-data-api-v3-eureka/docker/eurekad.sh /EGA_build
mv /ega-data-api-v3-eureka/docker/Dockerfile_Deploy /EGA_build
mv /ega-data-api-v3-eureka/docker/monitrc /EGA_build
