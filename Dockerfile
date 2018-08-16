FROM aoepeople/sbt-alpine

RUN echo ${JAVA_HOME}

# install fullsupport unzip
RUN apk add --no-cache unzip

# install sonarQube client
COPY sonar-scanner-cli-3.1.0.1141-linux-withoutjre.zip /
RUN unzip sonar-scanner-cli-3.1.0.1141-linux-withoutjre.zip && mv /sonar-scanner-3.1.0.1141-linux-withoutjre/ /sonar/ && rm sonar-scanner-cli-3.1.0.1141-linux-withoutjre.zip
ENV SONAR_SCANNER_HOME=/sonar