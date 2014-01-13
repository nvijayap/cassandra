#!/bin/bash

# cli.sh - demos how to work with cqlsh for bunch of statements

# Create a statements file
cat > statements <<!

drop keyspace ks;

create keyspace ks with replication = {
  'class':             'SimpleStrategy',
  'replication_factor': 3
};

use ks;

create table users (
  username      varchar,
  email         varchar
  PRIMARY KEY (username)
);

insert into users values (
  'jdoe', 'john@doe.com'
);

select * from system.schema_keyspaces;
select * from system.schema_columnfamilies;
select * from system.schema_columns;

!
# end of statements file

# Change line below to match your install area
~/apache-cassandra-2.0.4/bin/cqlsh -f statements

# Cleanup
/bin/rm statements
