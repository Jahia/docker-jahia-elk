# logstash-config

This repository features default ELK and filebeat configuration that can be used to fully monitore Jahia Digital Experience 7+ installations. It contains Logstash patterns as well as Kibana dashboards.

These patterns have only been tested on Tomcat 8.

*Features:*
 * Jahia page rendering monitoring (render time, paths, users, errors)
 * Garbage collection monitoring
 * JahiaRequestLoad and JahiaSessionLoad monitoring

*Requirements:*
 * -XX:+PrintGCDateStamps should be added to tomcat/bin/setenv.sh in order to enhance Garbage Collection monitoring
