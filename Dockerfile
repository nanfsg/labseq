
# Use uma imagem base do Java
FROM openjdk:17

# Copie o arquivo JAR da sua aplicação para o contêiner
COPY target/*.jar /app/labseq-1.0.0.jar

# Defina o comando de inicialização da aplicação
CMD ["java", "-jar", "/app/labseq-1.0.0.jar"]


# Start with a base image containing Java runtime
FROM openjdk:17

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/*.jar

# Add the application's jar to the container
ADD ${JAR_FILE} labseq.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-Dcom.webmethods.jms.clientIDSharing=true", "-jar","labseq.jar"]