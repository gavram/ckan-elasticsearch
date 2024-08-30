This repository contains deployment of the Elasticsearch and Kibana for local development in CKAN.

The memory usage is limited:
- Elasticsearch 2G
- Kibana 512MiB

The setup is automatically checking if `ckan` index exists in Elasticsearch and if doesn't exist it will create it and also will apply provided `mapping` as a schema

To spin up this stack simply run `docker compose up --build`
