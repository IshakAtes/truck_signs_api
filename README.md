<div align="center">

![Truck Signs](./screenshots/Truck_Signs_logo.png)

# 🚛 Signs for Trucks – Dockerized Django REST API

![Python version](https://img.shields.io/badge/Pythn-3.8.10-4c566a?logo=python&&longCache=true&logoColor=white&colorB=pink&style=flat-square&colorA=4c566a) ![Django version](https://img.shields.io/badge/Django-2.2.8-4c566a?logo=django&&longCache=truelogoColor=white&colorB=pink&style=flat-square&colorA=4c566a) ![Django-RestFramework](https://img.shields.io/badge/Django_Rest_Framework-3.12.4-red.svg?longCache=true&style=flat-square&logo=django&logoColor=white&colorA=4c566a&colorB=pink)


</div>

## Table of Contents
- [🚛 Truck Signs API](#-truck-signs-api)
- [⚡ Quickstart](#-quickstart)
- [⚙️ Environment Variables](#️-environment-variables)
- [📁 Project Structure](#-project-structure)
- [💡 Notes](#-notes)
- [Useful Links](#useful-links)
- [Screenshots of the Django Backend Admin Panel](#screenshots-of-the-django-backend-admin-panel)

## 🚛 Truck Signs API

This is a Django-based backend API for an online shop that allows users to browse, customize, and order truck vinyl stickers. The API supports product management, customer uploads, and order processing.


## ⚡ Quickstart
**1. Clone the repository**
``` bash
git clone https://github.com/your-username/truck-signs-api.git
cd truck-signs-api
```

**2. Build and Run with Docker**
> [!Note]
> No Docker Compose is used. You'll run the PostgreSQL container and app manually.

***2.1 Create Docker network***
``` bash
docker network create --driver=bridge mynet
```

***2.2 Start PostgreSQL***
``` bash
docker run --name db -e POSTGRES_DB=truck-signs -e POSTGRES_USER=foo -e POSTGRES_PASSWORD=foopassword -p 5432:5432 -v pgdata:/var/lib/postgresql/data --network mynet --restart unless-stopped -d postgres:13
```

***2.3 Build the application***
``` bash
docker build -t truck-app -f Dockerfile .
```

***2.4 Run the app***
``` bash
docker run --env-file truck_signs_designs/settings/example_env.env --name app --network mynet -p <EXAMPLE_HOST>:<EXAMPLE_PORT> -e SERVER_IP=localhost -d truck-app
```
> [!Note]
> Replace <EXAMPLE_PORT> with the desired port, e.g. 8020.

## Congratulations 🎉 !!! The App should be running in `localhost:<EXAMPLE_PORT>`
**Optional step** To create a super user run:
``` bash
docker exec -it app python manage.py createsuperuser
```
> [!Note]
> Superuser creation does not work directly in Docker with python. The createsuperuser command would have to be called via `docker exec`.


## ⚙️ Environment Variables
The application uses a `.env` file for managing sensitive environment variables [.example_env](https://github.com/IshakAtes/truck_signs_api/blob/lab/truck_signs_designs/settings/.example_env).

If you're running the app inside Docker, the necessary `.env` file will be copied automatically via the `Dockerfile`:
``` dockerfile
RUN cp ./truck_signs_designs/settings/simple_env_config.env .env
```

## 📁 Project Structure
- truck_signs_designs/ – Django project configuration
- `entrypoint.sh` – Entry script that waits for DB, applies migrations, collects static files, and runs Gunicorn
- `Dockerfile` – Container setup for the app
- `requirements.txt` – Python dependencies

## 💡 Notes
- The app uses environment variables from `simple_env.env`. Adjust if needed.
- Data is stored persistently in the `pgdata` Docker volume.


<a name="useful_links"></a>
## Useful Links

### Postgresql Database
- Setup Database: [Digital Ocean Link for Django Deployment on VPS](https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-16-04)

### Docker
- [Docker Oficial Documentation](https://docs.docker.com/)
- Dockerizing Django, PostgreSQL, guinicorn, and Nginx:
    - Github repo of sunilale0: [Link](https://github.com/sunilale0/django-postgresql-gunicorn-nginx-dockerized/blob/master/README.md#nginx)
    - Michael Herman article on testdriven.io: [Link](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/)

### Django and DRF
- [Django Official Documentation](https://docs.djangoproject.com/en/4.0/)
- Generate a new secret key: [Stackoverflow Link](https://stackoverflow.com/questions/41298963/is-there-a-function-for-generating-settings-secret-key-in-django)
- Modify the Django Admin:
    - Small modifications (add searching, columns, ...): [Link](https://realpython.com/customize-django-admin-python/)
    - Modify Templates and css: [Link from Medium](https://medium.com/@brianmayrose/django-step-9-180d04a4152c)
- [Django Rest Framework Official Documentation](https://www.django-rest-framework.org/)
- More about Nested Serializers: [Stackoverflow Link](https://stackoverflow.com/questions/51182823/django-rest-framework-nested-serializers)
- More about GenericViews: [Testdriver.io Link](https://testdriven.io/blog/drf-views-part-2/)

### Miscellaneous
- Create Virual Environment with Virtualenv and Virtualenvwrapper: [Link](https://docs.python-guide.org/dev/virtualenvs/)
- [Configure CORS](https://www.stackhawk.com/blog/django-cors-guide/)
- [Setup Django with Cloudinary](https://cloudinary.com/documentation/django_integration)


<a name="screenshots"></a>

## Screenshots of the Django Backend Admin Panel

### Mobile View

<div align="center">

![alt text](./screenshots/Admin_Panel_View_Mobile.png)  ![alt text](./screenshots/Admin_Panel_View_Mobile_2.png) ![alt text](./screenshots/Admin_Panel_View_Mobile_3.png)

</div>
---

### Desktop View

![alt text](./screenshots/Admin_Panel_View.png)

---

![alt text](./screenshots/Admin_Panel_View_2.png)

---

![alt text](./screenshots/Admin_Panel_View_3.png)