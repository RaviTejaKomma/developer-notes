#!/bin/bash

# Created by RaviTejaKomma
# MongoDB script to dump the contents of given collections of a database.

db=$1
collections=$@
host=127.0.0.1
port=27017
out_prefix=/home/ravi/mongo_dumps

for i in "${!collections[@]}"; do
  printf '${collections[%s]}=%s\n' "$i" "${collections[i]}"
done

for collection in $collections; do
	echo $collection
  	out_dir="${out_prefix}/${db}_${collection}/"
	mkdir -p ${out_dir}
  	mongodump --host $host --port $port --collection $collection --db $db --out ${out_dir}
done