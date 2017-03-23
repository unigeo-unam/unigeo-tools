#!/bin/bash
# Script para optimizar imágenes raster para su publicación en geoserver
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2016

mkdir optimizado
for i in `find *.tif`; 
	do gdal_translate -CO "TILED=YES" -CO "BLOCKXSIZE=512" -CO "BLOCKYSIZE=512" $i ../optimizado/$i; gdaladdo -r average ../optimizado/$i 2 4 8 16 32; 
done
