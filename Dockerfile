FROM sebp/elk

RUN apt-get update

RUN apt-get install -y git python-virtualenv

RUN git clone https://github.com/Jahia/jahia-logstash-kibana-config

RUN ln -s /jahia-logstash-kibana-config/logstash/jahialog.conf /etc/logstash/conf.d/09_jahialog.conf
RUN ln -s /jahia-logstash-kibana-config/logstash/local_jahia.conf /etc/logstash/conf.d/01_local_jahia.conf

RUN ln -s /jahia-logstash-kibana-config/logstash/patterns/jahia /opt/logstash/patterns/jahia


#ADD ./local_jahia.conf /etc/logstash/conf.d/01_local_jahia.conf
#ADD ./jahialog.conf /etc/logstash/conf.d/09_jahialog.conf

#ADD ./patterns/jahia /opt/logstash/patterns/jahia


ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 5601 9200 9300 5044 5045
VOLUME /var/lib/elasticsearch

RUN rm -rf /etc/logstash/conf.d/30-output.conf
RUN rm -rf /etc/logstash/conf.d/10-syslog.conf
RUN rm -rf /etc/logstash/conf.d/11-nginx.conf
RUN rm -rf /etc/logstash/conf.d/02-beats-input.conf

EXPOSE 5601

CMD [ "/usr/local/bin/start.sh" ]