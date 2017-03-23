#!/bin/bash
# Script para quitar espacios en nombre de archivos
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2014

for actual in *
  do nuevo=$(echo $actual | tr ' ' _)
  mv "$actual" $nuevo
done
