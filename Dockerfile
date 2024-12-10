# Étape 1 : Construction de l'application (builder)
FROM maven:3.9.9-amazoncorretto-21-debian-bookworm  AS build

WORKDIR /app

# Copier les fichiers source et de confgurations
COPY pom.xml .
COPY src /app/src

RUN mvn package -DskipTests

# Étape 2 : Exécution de l'application (runtime)
FROM amazoncorretto:21.0.5-alpine3.20

# Créer un répertoire pour l'application
WORKDIR /app

# Copier l'artefact jar depuis l'étape précédente
COPY --from=build /app/target/multi-stage-java-1.0-SNAPSHOT.jar /app/my-java-app.jar

# Commande pour exécuter l'application
ENTRYPOINT ["java", "-jar", "my-java-app.jar"]