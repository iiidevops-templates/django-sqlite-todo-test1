#FROM dockerhub/library/python:3.7
FROM python:3.7
RUN apt-get update && apt-get install -y libmariadb-dev
RUN pip install django==3.1.7 mysqlclient

COPY ./app /app
RUN pip freeze > requirement.txt
WORKDIR /app
EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080", "--noreload"]
