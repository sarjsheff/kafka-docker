#!/bin/sh

if ! test -f ./kafka_2.12-2.8.0.tgz ; then
    wget https://downloads.apache.org/kafka/2.8.0/kafka_2.12-2.8.0.tgz
fi

if ! test -d ./kafka_2.12-2.8.0 ; then
    tar -zxf kafka_2.12-2.8.0.tgz
fi

docker rm -f kafka
docker run -d --name=kafka -p 9092:9092 sheff/kafka
kafka_2.12-2.8.0/bin/kafka-topics.sh --create --topic kraft-test --bootstrap-server localhost:9092
kafka_2.12-2.8.0/bin/kafka-topics.sh bin/kafka-topics.sh --bootstrap-server localhost:9092 --list