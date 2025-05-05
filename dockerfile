# 1. use a minimal Python image as a basis
FROM python:3.9-slim

# 2 Set the working directory in the container to /app
WORKDIR /app

# 3. copy the requirements.txt and the rest of the code into the working directory
COPY requirements.txt /app/
COPY . /app

# Note: The bash script uses ‘nc’, which is not included in the base image
# Therefore install netcat-openbsd
RUN apt-get update && apt-get install -y netcat-openbsd && apt-get clean

# 5 Install the Python dependencies
RUN pip install -r requirements.txt

# 6. copy an environment file for the configuration (local settings)
RUN cp ./truck_signs_designs/settings/simple_env.env .env

# 7. expose the port through which the application is accessible
EXPOSE ${APP_PORT}

# 8. Define the start script for the container
ENTRYPOINT [ "./entrypoint.sh" ]
