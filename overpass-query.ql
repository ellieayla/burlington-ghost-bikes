/* @name Ghost Bikes in Burlington */

[timeout:300];
area[admin_level=8]["name"="Burlington"]["place"="city"]->.boundaryarea;
(
node(area.boundaryarea)[memorial=ghost_bike];
);
out geom;
