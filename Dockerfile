FROM python:3.10

RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

ARG DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs 

RUN mkdir /src
COPY . /TaskManager
WORKDIR /TaskManager/apps

COPY requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt


ENTRYPOINT ["tail", "-f", "/dev/null"]