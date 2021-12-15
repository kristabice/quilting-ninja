FROM python:3.8-alpine

# install system packages

## helpful utilities
RUN apk add --no-cache bash

## python build dependencies
## (necessary for installing some python packages)
RUN apk add --no-cache build-base python3-dev libffi-dev gcc musl-dev

WORKDIR /usr/src/app

# install application dependencies

## start with pipenv
RUN pip install pipenv

## copy in our Pipfile
COPY ["./Pipfile", "Pipfile.lock", "./"]

## generate a requirements file from the Pipfile
## and install those dependencies listed in it
RUN pipenv lock --dev -r > requirements.txt\
    && pip install -r requirements.txt


# app configuration
ENV PYTHONPATH=/usr/src/

# TODO copy in application source code and/or mount the local application code into our container
COPY . .

# TODO define a "CMD" to run at the start e.g. ["gunicorn", ...]
CMD ["gunicorn", "--bind", "0.0.0.0:5000",  "wsgi:app"]
