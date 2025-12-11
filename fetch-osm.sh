#!/bin/sh

# usage: cat overpass-query.ql | ./fetch-osm.sh > ghost_bikes.osm
curl --fail --retry 4 --retry-max-time 60 -v -d @- -X POST http://overpass-api.de/api/interpreter
