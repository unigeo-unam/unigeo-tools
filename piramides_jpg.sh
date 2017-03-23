#!/bin/bash
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2016

mkdir tiles
for archivo in *.jpg
do
  BASENAME=$(basename $archivo .jpg)
  archivosalida=tiles/${BASENAME}_tiles.jpg
  echo "Procesando: ${BASENAME}.jpg"
  if [ -f $archivosalida ] #Brincar si existe
  then
    echo "Saltarse: $archivosalida"
  else
    gdal_translate -co "TILED=YES" -co "BLOCKXSIZE=512" -co "BLOCKYSIZE=512" $archivo $archivosalida;\
    gdaladdo -r average $archivosalida 2 4 8 16 32
  fi
done
