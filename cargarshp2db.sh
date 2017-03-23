#/bin/bash
# Script para cargar un shapefile a una base de datos en postgis usando latin1
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2014

export PGPASSWORD='tuContraseña'
for i in $(ls *.shp); do
	nombre=$(echo $i | cut -d "." -f 1);
	shp2pgsql -I -s 4326 -W latin1 $i $nombre | psql -h hostname -d geodatabase -U usuario
done;
