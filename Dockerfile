FROM continuumio/anaconda3:4.4.0
MAINTAINER UNP, https://unp.education


USER root


COPY ./ .

RUN pip install -r requirements.txt

