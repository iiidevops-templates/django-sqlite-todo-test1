FROM dockerhub/library/python:3.7
# FROM python:3.7
RUN pip install django==3.1.7 psycopg2==2.8.6

COPY ./app /app
WORKDIR /app
EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080", "--noreload"]
