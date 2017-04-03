#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: ./recreate_index.sh FILENAME(JSON Lines formatted/Elastic indexing format)" >&2
  exit 1
fi

curl -XDELETE localhost:9200/_template/template_1
curl -XPUT localhost:9200/_template/template_1 -d '@conf/template.json'
curl -XDELETE 'localhost:9200/openfarmsubsidies?pretty'
curl -XPUT 'localhost:9200/openfarmsubsidies/payment/_bulk?pretty' --data-binary "@$1"
printf "\n"
sleep 1
curl 'localhost:9200/_cat/indices?v'