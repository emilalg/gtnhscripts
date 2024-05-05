# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Install Java 21
RUN apt-get update && \
    apt-get install -y openjdk-21-jdk

# Set the working directory
WORKDIR /minecraft

# Expose port 25565 for Minecraft
EXPOSE 25565

# Set entrypoint to the script that will start the server
ENTRYPOINT ["./serve.sh"]