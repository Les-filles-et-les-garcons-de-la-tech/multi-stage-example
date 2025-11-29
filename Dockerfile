# Étape 1: Construction de l'application (builder)
ARG PROXY_DOCKERHUB="docker.io/library"
ARG VERSION=3.9.11-amazoncorretto-25-debian
FROM $PROXY_DOCKERHUB/maven:$VERSION  AS build

WORKDIR /app
# Copier les fichiers source et de configurations
COPY pom.xml .
COPY src/ /app/src

# Construire l'application
RUN mvn clean package -DskipTests


# Étape 2 : Exécution de l'application (runtime)
ARG VERSION=25-alpine3.22
FROM $PROXY_DOCKERHUB/amazoncorretto:$VERSION

WORKDIR /app

# Copier l'artefact jar depuis l'étape précédente
COPY --from=build /app/target/multi-stage-java-1.0-SNAPSHOT.jar my-java-app.jar

ENTRYPOINT ["java", "-jar", "my-java-app.jar"]
