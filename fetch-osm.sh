#!/bin/sh

# usage: cat overpass-query.ql | ./fetch-osm.sh > ghost_bikes.osm
curl --fail --user-agent "github.com/ellieayla/burlington-ghost-bikes" --retry 5 --retry-delay 30 -v -d @- -X POST http://overpass-api.de/api/interpreter
