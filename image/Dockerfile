FROM harbor-repo.vmware.com/dockerhub-proxy-cache/eclipse-temurin:17-jdk

RUN mkdir /app
COPY spring-cloud-dataflow-shell-*.jar /app/spring-cloud-dataflow-shell.jar
COPY shell.sh shell.sh
RUN chmod +x shell.sh
