import environ
from .base import *

DEBUG = True

env = environ.Env()
# reading env file
environ.Env.read_env()

SECRET_KEY = env("DOCKER_SECRET_KEY")
DEBUG = True

PORT = env("APP_PORT", default="4200")
IP = env("IP_ADRESS", default="localhost")

CORS_ALLOWED_ORIGINS = [
    f"http://{IP}", 
    f"http://{IP}:{PORT}", # Port angabe führt zum fehler, es muss nur die ip adresse angegeben werden. Diese zeile kann eigentlich gelöscht werden. Server läuft, dont touch a running System ;)
]



DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': env("DB_NAME"),
        'USER': env("DB_USER"),
        'PASSWORD': env("DB_PASSWORD"),
        'HOST': env("DB_HOST"),
        'PORT': env("DB_PORT"),
    }
}

STRIPE_PUBLISHABLE_KEY=env("DOCKER_STRIPE_PUBLISHABLE_KEY")
STRIPE_SECRET_KEY=env("DOCKER_STRIPE_SECRET_KEY")



EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_USE_TLS = True
EMAIL_PORT = 587
EMAIL_HOST_USER = env("DOCKER_EMAIL_HOST_USER")
EMAIL_HOST_PASSWORD = env("DOCKER_EMAIL_HOST_PASSWORD")

ALLOWED_HOSTS = [
    'localhost',
    '127.0.0.1',
    env("IP_ADRESS", default="localhost"),
]