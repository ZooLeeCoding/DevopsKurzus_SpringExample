FROM frolvlad/alpine-oraclejdk8:slim
COPY $PWD/build/libs/DevopsKurzus_SpringExample-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
