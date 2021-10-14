# syntax=docker/dockerfile:1
FROM alpine:3.14

ARG dist=flaskr-1.0.0-py3-none-any.whl
ENV FLASK_APP=flaskr

WORKDIR /app
COPY dist/$dist .
RUN apk --update add py-pip && \
    pip3 install waitress $dist

EXPOSE 8080

RUN flask init-db
ENTRYPOINT [ "waitress-serve" ]
CMD ["--call", "flaskr:create_app" ]