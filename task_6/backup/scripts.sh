#!/usr/bin/env bash

mysqldump -uroot -pexample --single-transaction -c stats > stats.sql


innobackupex \
    --host=0.0.0.0 \
    --port=3307 \
    --user=root \
    --password=example \
    --no-lock \
    --databases=stats \
    --stream=tar \
    ./ \
    > ${PWD}/backup.gz
