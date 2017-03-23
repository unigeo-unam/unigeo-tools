#!/bin/bash
# Transformar archivos JPG a GEOTIFF (.tif)
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2016

mkdir tif

for archivo in (ls *.jpg);
do echo "Procesando $archivo"
    gdal_translate -of GTiff -a_nodata 0 $archivo ./tif/$archivo.tif
done
