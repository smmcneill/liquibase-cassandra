from liquibase/liquibase

user root

RUN apt update -y && apt install netcat -y

ENTRYPOINT ["/liquibase/docker-entrypoint.sh"]