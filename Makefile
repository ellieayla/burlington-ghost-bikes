

# merge results for display
all.geojson: osm.geojson node_modules/@mapbox/geojson-merge/geojson-merge 
	./node_modules/@mapbox/geojson-merge/geojson-merge osm.geojson historic.geojson > all.geojson

# installs
node_modules/osmtogeojson/osmtogeojson:
	npm install osmtogeojson

node_modules/@mapbox/geojson-merge/geojson-merge:
	npm install @mapbox/geojson-merge


# api call
osm.geojson: ghost_bikes.osm node_modules/osmtogeojson/osmtogeojson
	./node_modules/osmtogeojson/osmtogeojson ./ghost_bikes.osm > osm.geojson

ghost_bikes.osm:
	cat overpass-query.ql | ./fetch-osm.sh > ghost_bikes.osm
	# verify output file is ok. If not, these will bubble up an exit=1
	! grep -q Error ghost_bikes.osm
	! grep -q '<html' ghost_bikes.osm
	! grep -q '<strong style="color:#FF0000">Error</strong>' ghost_bikes.osm
	grep -q '<node ' ghost_bikes.osm
	grep -q '<osm ' ghost_bikes.osm

.PHONY: test
test: node_modules/@mapbox/geojson-merge/geojson-merge
	./node_modules/@mapbox/geojson-merge/geojson-merge ./README.md > /dev/null

.PHONY: clean
clean:
	rm -fv ghost_bikes.osm osm.geojson all.geojson
