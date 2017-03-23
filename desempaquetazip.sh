#/bin/shell
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2014

ls -l *.zip > lista
for archivo in `cat lista`
do
    unzip $archivo > temp
    mv temp newdir/$archivo
done
