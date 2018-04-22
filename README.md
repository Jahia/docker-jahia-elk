# logstash-config

This repository features default ELK and filebeat configuration that can be used to monitore Jahia Digital Experience 7+ logs. It contains Logstash patterns as well as Kibana dashboards.

This Docker image can be used to index logs generated on the fly on a running Jahia DX platform, or to analyze logs on a static folder.

These patterns have only been tested on Tomcat 8.

## How to use this Dockerfile
* Build the container: docker build -t jahia/elk:0.12 .
* Run it: sudo docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 --rm -v <LOCAL_PATH_TO_LOG_FOLDER>:/var/logs/logstash_logs -e MAX_MAP_COUNT=262144 -it --name jahia-elk jahia/elk:0.12

## Options
* Persist Elasticsearch's index upon Docker image restart: -v <Local_path_to_index>:/var/lib/elasticsearch
The local path to index must point to an empty folder.

## Features:
 * Jahia page rendering monitoring (render time, paths, users, errors)
 * Garbage collection monitoring
 * JahiaRequestLoad and JahiaSessionLoad monitoring

## Log indexing options
 * -XX:+PrintGCDateStamps should be added to tomcat/bin/setenv.sh in order to enhance Garbage Collection monitoring
