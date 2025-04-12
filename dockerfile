# 1. Starte mit einem Base-Image
FROM python

# 2. Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# 3. Kopiere notwendige Projektdateien und Abhängigkeiten in den Container
COPY requirements.txt /app/
COPY ./babyshop_app /app

# 4. Installiere python-dotenv, um .env-Dateien zu laden (falls du es benötigst)
RUN pip install python-dotenv

# 5. Installiere alle Abhängigkeiten
RUN pip install -r requirements.txt

# 6. Führe Migrationen und collectstatic aus
# RUN python manage.py collectstatic --noinput
RUN python manage.py makemigrations
RUN python manage.py migrate

# 7. Exponiere den Port, auf dem die Anwendung läuft
EXPOSE 8025

# Variable mit der ip
ENV SERVER_IP=localhost

# 8. Starte die Anwendung
CMD ["python", "manage.py", "runserver", "0.0.0.0:8025"]
