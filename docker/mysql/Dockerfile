FROM mysql:8.0

ENV MYSQL_RANDOM_ROOT_PASSWORD true
ENV MYSQL_USER hiveuser
ENV MYSQL_PASSWORD hivepassword
ENV MYSQL_DATABASE metastore
ENV TZ 'utc'

COPY inithive.sql  /docker-entrypoint-initdb.d/inithive.sql

EXPOSE 3306:3306