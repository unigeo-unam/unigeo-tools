#!/bin/bash
# Script para crar un mosaico a partir de varias imagenes y optimizarlo
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2016

# Une todas las imagenes en una sola
gdal_merge.py -n 0 -v *.tif -o mosaico.tif

# Reproyectar a WGS84
gdalwarp -t_srs '+proj=merc +datum=WGS84' mosaico.tif mosaico_wgs84.tif
gdal_translate -co "TILED=YES" -co "BLOCKXSIZE=512" -co "BLOCKYSIZE=512" mosaico_wgs84.tif mosaico_wgs84_piramide.tif
gdaladdo -r average mosaico_wgs84_piramide 2 4 8 16 32