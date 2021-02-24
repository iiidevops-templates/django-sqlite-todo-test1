FROM dockerhub/library/python:3.7
# FROM python:3.7
RUN pip install django psycopg2

COPY ./app /app
WORKDIR /app
EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080", "--noreload"]
