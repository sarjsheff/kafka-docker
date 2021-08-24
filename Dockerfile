FROM alpine

COPY kafka_2.12-2.8.0.tgz /app/

WORKDIR /app

RUN apk update && apk add openjdk11-jre-headless bash
RUN tar -zxf ./kafka_2.12-2.8.0.tgz
RUN rm kafka_2.12-2.8.0.tgz
WORKDIR /app/kafka_2.12-2.8.0
COPY server.properties /app/
RUN ./bin/kafka-storage.sh format -t "$(./bin/kafka-storage.sh random-uuid)" -c /app/server.properties
CMD ["./bin/kafka-server-start.sh" ,"/app/server.properties"]
