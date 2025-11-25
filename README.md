# multi-stage-example

## Introduction
Ce dépôt contient un exemple de projet Java utilisant la technique des **multi-stage builds** dans **Docker**. L'objectif est de démontrer comment configurer un fichier **Dockerfile** multi-étapes pour optimiser le processus de construction et réduire la taille de l'image Docker finale.  
  
Il est en lien avec les formations sur les **Container Engines (Docker / Podman)** présentes sur le Drive.  


## Fonctionnalités
- Utilisation de **multi-stage builds** pour la production d'une image OCI plus légère.
- Exemple de **Java 25** avec Maven.
- Inclut un fichier **Dockerfile** et un projet Maven minimal.

## Prérequis
- **Docker / Podman** installé sur votre machine.


## Construction de l'image Docker

1. Clonez ce dépôt.
2. Editez le Dockerfile avec les étapes du cours.  
3. Exécutez la commande suivante pour construire l'image Docker :

```bash
docker image build -t multi-stage-java .
```

## Exécution de l'application

Une fois l'image construite, vous pouvez exécuter le conteneur avec :

```bash
docker container run -it --rm multi-stage-java
```

## Structure du projet

- **Dockerfile** : Configuration du multi-stage build.
- **pom.xml** : Fichier de configuration Maven pour la gestion des dépendances et des plugins.
- **src/** : Contient le code source Java.

## Contribution

Les contributions sont les bienvenues ! Vous pouvez ouvrir une **pull request** pour toute amélioration ou ajout de fonctionnalité.

## Licence

Ce projet est sous licence **MIT**.