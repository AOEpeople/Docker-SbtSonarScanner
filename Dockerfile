FROM java:8-jre

# install sonarQube client
COPY sonar-scanner-cli-3.1.0.1141-linux.zip /
RUN unzip sonar-scanner-cli-3.1.0.1141-linux.zip && mv /sonar-scanner-3.1.0.1141-linux/ /sonar/
ENV SONAR_SCANNER_HOME=/sonar