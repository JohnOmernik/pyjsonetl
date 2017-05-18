FROM ubuntu:latest

WORKDIR /app

RUN mkdir -p /app/code && mkdir -p /app/data

RUN apt-get update && apt-get install -y python3 wget python3-dev python3-setuptools python3-pip zlib1g-dev libevent-pthreads-2.0-5 libssl-dev libsasl2-dev liblz4-dev libsnappy1v5 libsnappy-dev liblzo2-2 liblzo2-dev && apt-get clean && apt-get autoremove -y

RUN pip3 install pytest python-snappy python-lzo brotli requests

RUN wget https://github.com/edenhill/librdkafka/archive/v0.9.4.tar.gz && tar zxf v0.9.4.tar.gz && cd librdkafka-0.9.4 && ./configure && make && make install && ldconfig && cd .. && rm -rf librdkafka-0.9.4 && rm v0.9.4.tar.gz && pip3 install cython confluent-kafka confluent-kafka[avro] kazoo

ADD pyjson.py /app/code/

CMD ["/bin/bash"]
