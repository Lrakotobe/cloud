# Définition de l'image de base
FROM openjdk:17

# Définition du répertoire de travail
WORKDIR /app

# Copie des fichiers nécessaires dans l'image Docker
COPY target/App-0.0.1-SNAPSHOT.jar app.jar
COPY src/main/resources/application.properties application.properties

# Exposition du port 8080
EXPOSE 8080

# Commande à exécuter pour lancer l'application
CMD ["java", "-jar", "app.jar"]
