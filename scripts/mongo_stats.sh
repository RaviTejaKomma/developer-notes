#!/bin/bash

# Created by RaviTejaKomma
# MongoDB script to print the document count, storage size and index size for all collections in all databases.
mongo --quiet --eval '
db = db.getSiblingDB("admin");
var dbs = db.adminCommand("listDatabases").databases;
var totalCount = 0;
var totalStorageSize = 0;
var totalIndexSize = 0;
print("Database\tCollection\tCount\tStorage Size\tIndex Size");
dbs.forEach(function(database) {
  db = db.getSiblingDB(database.name);
  cols = db.getCollectionNames();
  cols.forEach(function(collection) {
    count = db[collection].count();
    totalCount += count;
    storageSize = db[collection].storageSize();
    totalStorageSize += storageSize;
    indexSize = db[collection].totalIndexSize();
    totalIndexSize += indexSize;
    print(db + "\t" + collection + "\t" + count + "\t" + formatBytes(storageSize) + "\t" + formatBytes(indexSize));
  });
});
print("TOTAL\t-\t" + totalCount + "\t" + formatBytes(totalStorageSize) + "\t" + formatBytes(totalIndexSize));
function formatBytes(bytes,decimals) {
   if(bytes == 0) return "0 Bytes";
   var k = 1000,
       dm = decimals + 1 || 0,
       sizes = ["Bytes", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"],
       i = Math.floor(Math.log(bytes) / Math.log(k));
   return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + sizes[i];
};
' | column -s $'\t' -t