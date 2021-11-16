docker run \
  --rm \
  -it \
  -v $(pwd)/changelog.sql:/liquibase/changelog/changelog.sql \
  -v $(pwd)/liquibase.properties:/liquibase/liquibase.properties \
  -v $(pwd)/lib:/liquibase/classpath \
  --entrypoint=bash \
  --network=cassandra-migration_default \
  liquibase/liquibase


liquibase update --log-level=FINE --classpath=/liquibase/changelog:/liquibase/classpath/CassandraJDBC42.jar:/liquibase/classpath/liquibase-cassandra-4.5.0.jar --defaultsFile=liquibase.properties --username=cassandra --password=cassandra --changelog-file=changelog.sql


liquibase update


https://docs.liquibase.com/workflows/database-setup-tutorials/cassandra.html