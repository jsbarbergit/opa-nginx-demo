FROM python:3.9.5-alpine3.13
WORKDIR /app

# Set some default values for env vars users may want to override
ARG FLASK_PORT=8181
ENV FLASK_PORT=${FLASK_PORT}

COPY ./src .
# Need some build tools to build uwsgi
RUN apk add --no-cache build-base linux-headers python3-dev libxslt-dev
RUN pip3 install -r requirements.txt

EXPOSE 8181

# Create a group and user to run our app
ARG APP_USER=auth-proxy
RUN adduser -D ${APP_USER} 
USER ${APP_USER}

CMD [ "sh", "-c", "uwsgi --socket 0.0.0.0:${FLASK_PORT} --protocol=http -w main:app"]
