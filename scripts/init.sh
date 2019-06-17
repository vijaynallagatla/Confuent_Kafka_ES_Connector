#bin/sh
echo "=====================================Creating Connector============================================="
es=10.0.0.223
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
curl -v -H "Content-Type: application/json" --data "$data" http://10.0.0.223:8084/connectors