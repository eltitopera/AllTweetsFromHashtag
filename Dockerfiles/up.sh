docker-compose up -d; #&& docker-compose scale taskmanager=10;

get_id_cont () {
i=0
#echo $cont_id $cont_name $3 $4
while [ $i -lt $total ]
do
#echo "e" ${cont_name[$i]}
	if [ ${cont_name[$i]} == $4 ]
	then
		id=${cont_id[$i]}
	fi

	i=$(expr $i + 1)
done

echo $id

}

declare -a cont_id
declare -a cont_name

cont_id=($(docker ps -a | tr -s ' ' | cut -d ' ' -f1 | sed '1d'))
cont_name=($(docker ps -a | tr -s ' ' | cut -d ' ' -f2 | sed '1d'))

total_cont=$(docker ps -a | tr -s ' ' | cut -d ' ' -f1-2 | wc -l)
total=$(expr $total_cont - 1)

flink=$(get_id_cont $cont_id $cont_name $total "flink_custom")

docker-compose scale taskmanager=3 kafka=3
sleep 30
docker exec $flink ./bin/flink run -p 3 -c flink2Elastic.Main ./ToElastic.jar

