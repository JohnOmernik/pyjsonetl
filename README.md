# pyjsonetl
A application to read JSON off a kafka queue and write into JSON files read able by tools like Apache Drill

## Features
- Read JSON from Kafka Queue
- Pick a field in your JSON to partition by (Uses Apache Drill Format)
- Run multiple instances to increase through put via Kafka Partitions (and use uniq identifiers!)
- Provide Bootstrap servers OR Zookeepers servers to find brokers

## How to use
- Build the docker container with docker build . (tag it with -t)
- Update run_docker.sh with the name of the image you built
- Update the file in ./bin/run_pyjsonetl.sh to match the environment you are ETLing
- Run ./run_docker.sh
- Lots of other ways to run this to, you could just set ENV variables and then run /app/code/pyjson.py directly (for use with Marathon other tools)

## Uses:
- kafka-python (confluent)
- json


## Using with Mapr Streams instead of Apache Kafka
- Using MapR's librdkakfa, it is possible to use this MapR Streams. 
- Instructions:
  - Go to https://github.com/JohnOmernik/maprlibrdkafka clone and build that image
  - Instead of from Ubuntu, change to from the image you built from maprlibrdkafka
  - Comment out the line that builds the normal librdkafka 
  - To use, specify "mapr" as your bootstrap brokers config value, and use the MapR format for topic (i.e. topic=/path/to/streams:topicname)

## Todo:
- Performance optimization testing
- Optimize Docker file. (It's sorta big)
- Currently we only create files to a POSIX compliant Filesystem. Should we look at adding libraries to write direct to HDFS/S3/MapRFS? etc 

