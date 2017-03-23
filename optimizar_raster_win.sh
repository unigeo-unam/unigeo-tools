#!/bin/bash
# Script para optimizar rasters
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2016

mkdir optimizado
for rasters in $(ls *.tif); 
    do /C/OSGeo4W64/bin/gdal_translate -co "TILED=YES" -co "BLOCKXSIZE=512" -co "BLOCKYSIZE=512" $rasters ./optimizado/$rasters; 
    /c/OSGeo4W64/bin/gdaladdo -r average ./optimizado/$rasters 2 4 8 16 32 
done
