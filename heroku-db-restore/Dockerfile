FROM ultrayoshi/heroku
MAINTAINER david.morcillo@codegram.com

RUN apt-get update && apt-get install -y postgresql-client

ENV HEROKU_API_KEY 1234
ENV HEROKU_APP example

ENV DB_HOST localhost
ENV DB_USER postgres
ENV DB_NAME example_database

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
