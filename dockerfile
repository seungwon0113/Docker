FROM python:3.13

# PostgreSQL 패치키 설치
RUN apt-get update && apt-get install -y postgresql-client \
    default-libmysqlclient-dev \
    default-mysql-client \
    build-essential \
    pkg-config

RUN mkdir app/

WORKDIR /app

RUN pip install --upgrade pip

COPY ./ /app

RUN pip install -r requirements.txt

ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]