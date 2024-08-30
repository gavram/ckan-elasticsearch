# run_setup.sh
until curl -s http://elasticsearch:9200/_cluster/health | jq .status | grep -q green
do
  echo "Waiting for Elasticsearch to start..."
  sleep 5
done

echo "Elasticsearch is up. Checking if the 'ckan' index exists..."

# Check if the index exists
INDEX_EXISTS=$(curl -s -o /dev/null -w "%{http_code}" http://elasticsearch:9200/ckan)

if [ "$INDEX_EXISTS" -eq 200 ]; then
  echo "Index 'ckan' already exists. Checking if mapping needs to be applied..."

  # You might want to check here if the mapping is already applied or not
  # This can be more complex depending on your mapping structure
  # For simplicity, let's assume you need to apply the mapping anyway
  curl -X PUT "http://elasticsearch:9200/ckan/_mapping" -H 'Content-Type: application/json' -d@mapping.json
  echo "Mapping applied to existing index."
else
  echo "Index 'ckan' does not exist. Creating index and applying mapping..."
  
  # Create index and apply mapping
  curl -X PUT "http://elasticsearch:9200/ckan" -H 'Content-Type: application/json' -d@mapping.json
  echo "Index created and mapping applied."
fi
