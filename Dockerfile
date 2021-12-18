FROM python:3.7-alpine
LABEL author="Sukanta"

ENV PYTHONUNBUFFERED 1

# Copy the requirements file to the image and install it
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create a separate user to run the docker image for security purposes
# The -D makes sure the user has only privilages to run the image
RUN adduser -D user
USER user