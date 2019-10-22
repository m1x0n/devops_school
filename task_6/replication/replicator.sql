CREATE USER 'replicator'@'%' IDENTIFIED BY 'password';
CREATE DATABASE test;
GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';
