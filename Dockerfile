FROM python:3.10.12

WORKDIR /home/app

COPY python-tools .
COPY requirements.txt .

RUN pip install -r requirements.txt
