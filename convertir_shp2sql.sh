#/bin/bash
# Script para convertir un archivo shapefile a un archivo sql usando latin1
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2014

for i in $(ls *.shp); do
	nombre=$(echo $i | cut -d "." -f 1);
	shp2pgsql -I -s 4326 -W latin1 $i $nombre > $nombre.sql
done;
