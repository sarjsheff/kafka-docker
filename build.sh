#!/bin/sh

if ! test -f ./kafka_2.12-2.8.0.tgz ; then
    wget https://downloads.apache.org/kafka/2.8.0/kafka_2.12-2.8.0.tgz
fi

docker build -t sheff/kafka .
