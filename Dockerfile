FROM python:3.9.9-alpine3.14

MAINTAINER "G Karthik Raja"

# Install dependencies for psycopg2
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev