# AllTweetsFromHashtag
Welcome! The project is a big data solution to get all news and olds tweets from specific hashtags in order display the data in Kibana.


# Prerequisites
 - Maven to deploy de src files 
 - docker && docker-compose to start the containers.

# Steps to go

## Java file
Use this command in the shell to Compile Java file: 
> mvn clean compile assembly:single

Then copy the file generated inside the folder flink and tweets. The file should be rename in __ToElastic.jar__ inside the folder __flink__ and inside the folder __tweets__ rename to __tweets.jar__ 

Note: the java file has 3 parameters:
 - -o get all old tweets  
 - -s get the new tweets (streaming)
 - -a get old and new tweets 
 
## Create containers

It is important to create at least two containers, inside the folder flink execute the command bellow:
> docker build -t flink_custom .

and the second container:
> docker build -t tweets . 

The next containers will be download in the official repository

Note: It is important to give all permisions in the folder elastic because the data of elastic search will be save there. 
> chmod 777 elastic

## Run containers

Before start the big bang is important to add your twitter credentials in docker-compose.yaml file, then:
> ./up.sh

Before start the project and all containers.  

# Technologies involve in 
 - Flink (1 jobmanager; 3 taskmanager)
 - Kafka (3 partitions 2 replicas )
 - Elastic Search (2 instances elastic search)
 - OpenNLP
 - Twitter4J
 - GetOldTweets-java 
 - Kibana
 
 # Reference
 Inspiration: [sergiokhayyat](https://github.com/sergiokhayyat/SocialFearGreedIndex)
 
 Get old tweets: [Jefferson Henrique](https://github.com/Jefferson-Henrique/GetOldTweets-java)


