FROM python:3.8-slim-buster

WORKDIR /app


COPY . .

RUN apt-get update && apt-get install -y default-libmysqlclient-dev build-essential

RUN pip3 install django

RUN pip3 install mysqlclient==2.2.0

#RUN python3 manage.py makemigrations  

#RUN python3 manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
