#!/bin/sh
# Script para cambiar de mayúsculas a minúsculas
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2014

for archivo in * ; do 
	mv $archivo `echo $archivo | tr '[A-Z]' '[a-z]'` ; 
done
