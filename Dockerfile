FROM continuumio/anaconda3:4.4.0
MAINTAINER UNP, https://unp.education

RUN useradd -r -u 1001 -g jenkins jenkins
USER jenkins


COPY ./ .

RUN pip install -r requirements.txt

