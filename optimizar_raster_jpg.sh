#!/bin/bash
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2016

mkdir optimizado_jpg
for i in `find *.jpg`; do 
	gdal_translate -CO "TILED=YES" -CO "BLOCKXSIZE=512" -CO "BLOCKYSIZE=512" $i ./optimizado_jpg/$i; gdaladdo -r average ./optimizado_jpg/$i 2 4 8 16 32; 
done
