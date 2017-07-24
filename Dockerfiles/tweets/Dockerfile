FROM java:8
MAINTAINER eltitopera

WORKDIR "/opt/"
ADD tweets.jar .
RUN echo "sleep 30; java -cp tweets.jar Twitter2Kafka.Main -a '#JuevesDeArquitectura'; tail -f /dev/null" >> start.sh && chmod 755 start.sh
CMD ["/bin/bash","start.sh"]
