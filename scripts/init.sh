#bin/sh
echo "=====================================Creating Connector============================================="
es=$HOST_IP
data='
{
  "name": "elasticsearch-sink",
  "config": {
    "connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
    "tasks.max": "1",
    "topics": "topic1,topic2",
    "key.ignore": "true",
    "schema.ignore": "true",
    "connection.url": "http://'"$es"':9200",
    "type.name": "json",
    "name": "elasticsearch-sink"
  }
}
'

sed -i 's/\r$//' $data
echo $data
curl -v -H "Content-Type: application/json" --data "$data" http://$HOST_IP:8084/connectors