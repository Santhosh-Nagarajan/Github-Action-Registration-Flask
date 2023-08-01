FROM python:3.8-slim-buster

WORKDIR /app


COPY . .

RUN apt-get update

RUN pip3 install virtualenv

RUN python3 -m venv bro

ENV PATH="/bro/bin:$PATH"

RUN pip3 install django

RUN apt-get update && apt-get install -y libmariadb-dev-compat

RUN pip install --upgrade pip

RUN pip3 install mysqlclient==2.2.0

RUN python3 manage.py makemigrations && python3 manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
