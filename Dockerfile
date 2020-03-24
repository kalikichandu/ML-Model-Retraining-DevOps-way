FROM continuumio/anaconda3:4.4.0
MAINTAINER UNP, https://unp.education

RUN apt-get update && apt-get install -y apache2 \
    vim \
 && apt-get clean \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/*

COPY ./ .

RUN pip install -r requirements.txt

