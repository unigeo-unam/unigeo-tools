#!/bin/bash
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2014

mkdir tif
for archivo in *.ecw
do
  BASENAME=$(basename $archivo .ecw)
  OUTFILE=tif/${BASENAME}.tif
  echo "Procesado: ${BASENAME}.ecw"
  if [ -f $OUTFILE ] #Omiti si existe
  then
    echo "Omitir: $OUTFILE"
  else
    /usr/local/bin/gdal_translate -of GTiff -a_srs epsg:4326 -co "TILED=YES" -co "INTERLEAVE=PIXEL" -co "TFW=YES" $archivo $OUTFILE
  fi
done

