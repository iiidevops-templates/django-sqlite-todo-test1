FROM dockerhub/library/python:3.7
RUN pip install django==3.1.7

COPY ./app /app
RUN pip freeze > requirement.txt
WORKDIR /app
EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080", "--noreload"]
