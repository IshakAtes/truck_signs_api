# 1. Starte mit einem Base-Image
FROM python:3.9-slim

# 2. Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# 3. Kopiere notwendige Projektdateien und Abhängigkeiten in den Container
COPY requirements.txt /app/
COPY . /app

#Bash-Skript benutzt nc, aber im python:3.9-slim Image ist netcat nicht vorinstalliert!
RUN apt-get update && apt-get install -y netcat-openbsd && apt-get clean


# 5. Installiere alle Abhängigkeiten
RUN pip install -r requirements.txt

RUN cp ./truck_signs_designs/settings/simple_env_config.env .env



# ENV DB_HOST=db
# ENV DB_PORT=5432

# 7. Exponiere den Port, auf dem die Anwendung läuft
EXPOSE ${APP_PORT}

# Variable mit der ip
ENV SERVER_IP=localhost

# Entrypoint
ENTRYPOINT [ "./entrypoint.sh" ]
