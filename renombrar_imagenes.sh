#!/bin/bash
 ################################
 # renombrar_imagenees.sh       #
 # script renombramiento masivo #
 # numerando desde 1            #
 ################################
 cont=0
 nombre="imagen_"
 for picture in `ls *.png`
 do
 ((cont=$cont+1))
 nuevonombre=$nombre$cont
 echo "Renombrando... $picture"
 echo "a $nuevonombre.png"
 mv $picture $nuevonombre.png
 done
