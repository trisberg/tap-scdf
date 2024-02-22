wget https://repo1.maven.org/maven2/org/springframework/cloud/spring-cloud-dataflow-shell/2.11.2/spring-cloud-dataflow-shell-2.11.2.jar
docker buildx build --platform linux/amd64 -t springdeveloper/scdf-shell .
docker tag springdeveloper/scdf-shell springdeveloper/scdf-shell:2.11.2
docker push springdeveloper/scdf-shell:2.11.2
docker push springdeveloper/scdf-shell:latest
