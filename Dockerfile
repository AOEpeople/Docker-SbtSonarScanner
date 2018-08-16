FROM openjdk:8-alpine

ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN apk update && apk upgrade && \
    apk add --no-cache bash curl openssh tar jq git

RUN curl -sL $(curl -s 'https://api.github.com/repos/sbt/sbt/releases/latest' | jq -r '.assets[] | select(.content_type == "application/gzip").browser_download_url') | tar -xz -C /usr/local

# preinstalls sbt and scala packages
RUN sbt sbtVersion

# install sonarQube client
COPY sonar-scanner-cli-3.1.0.1141-linux.zip /
RUN unzip sonar-scanner-cli-3.1.0.1141-linux.zip && mv /sonar-scanner-3.1.0.1141-linux/ /sonar/
ENV SONAR_SCANNER_HOME=/sonar