# 1. Verwende ein minimales Python-Image als Basis
FROM python:3.9-slim

# 2. Setze das Arbeitsverzeichnis im Container auf /app
WORKDIR /app

# 3. Kopiere die requirements.txt und den restlichen Code in das Arbeitsverzeichnis
COPY requirements.txt /app/
COPY . /app

# Hinweis: Das Bash-Skript verwendet 'nc', welches nicht im Base-Image enthalten ist
# Installiere daher netcat-openbsd
RUN apt-get update && apt-get install -y netcat-openbsd && apt-get clean


# 5. Installiere die Python-Abhängigkeiten
RUN pip install -r requirements.txt

# 6. Kopiere eine Umgebungsdatei für die Konfiguration (lokale Einstellungen)
RUN cp ./truck_signs_designs/settings/simple_env_config.env .env


# 7. Exponiere den Port, über den die Anwendung erreichbar ist
EXPOSE ${APP_PORT}

# 8. Setze eine Umgebungsvariable für die Server-IP
ENV SERVER_IP=localhost

# 9. Definiere das Startskript für den Container
ENTRYPOINT [ "./entrypoint.sh" ]
