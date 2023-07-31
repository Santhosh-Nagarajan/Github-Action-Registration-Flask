FROM python:3.8-slim-buster

WORKDIR /app


COPY . .

RUN pip3 install django

RUN pip install mysql-connector-python

RUN pip3 install mysqlclient

RUN python3 manage.py makemigrations && python3 manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
