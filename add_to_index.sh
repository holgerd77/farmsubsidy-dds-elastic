#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: ./add_to_index.sh FILENAME(JSON Lines formatted/Elastic indexing format)" >&2
  exit 1
fi

curl -XPUT 'localhost:9200/farmsubsidy-dds/payment/_bulk?pretty' --data-binary "@$1"
printf "\n"
sleep 1
curl 'localhost:9200/_cat/indices?v'
