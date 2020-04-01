FROM continuumio/anaconda3:4.4.0
MAINTAINER UNP, https://unp.education

RUN useradd -r -u 1001 -g root root
USER root


COPY ./ .

RUN pip install -r requirements.txt

