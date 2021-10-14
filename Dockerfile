# syntax=docker/dockerfile:1
FROM python:latest

ENV FLASK_APP=flaskr
EXPOSE 8080
WORKDIR /app

RUN python3 -m pip install --upgrade pip && pip install waitress flask
ADD https://github.com/ang67/Flask_web_app/blob/main/dist/flaskr-1.0.0-py2-none-any.whl . 
RUN pip3 install flaskr-1.0.0-py2-none-any.whl

RUN flask init-db
ENTRYPOINT [ "waitress-serve" ]
CMD ["--call", "flaskr:create_app" ]