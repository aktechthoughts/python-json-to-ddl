FROM ubuntu:18.04

 
RUN apt-get update \
 && apt-get install -y ansible \
 && apt-get install -y awscli \
 && apt-get install -y python3-pip \
 && apt-get install -y mysql-client

RUN mkdir -p /root/.aws
RUN mkdir -p /app/sql
RUN mkdir -p /app/data

WORKDIR /app
COPY sql/* /app/sql/
COPY insert_json_data.py /app
COPY run.sh /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

ENV HOST_NAME=mysql-test.cyqas5b0owfs.eu-central-1.rds.amazonaws.com
ENV USER_NAME=value
ENV PASSWORD=mysql_admin
ENV DB_NAME=1nsecure


# FROM python:3.7-alpine
# WORKDIR /code
# RUN apk add --no-cache gcc musl-dev linux-headers
# COPY . .
# CMD ["flask", "run"]

