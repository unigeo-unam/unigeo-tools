#  script to add layer/style information
#  for every SLD file in our collection
# Autor: Luis Octavio Ramírez Fernández
# correo: lramirez@igg.unam.mx
# fecha: enero 2016
#
restapi=http://localhost:8080/geoserver/rest
login=admin:geoserver
workspace=osm
store=osm
stylename=mystyle

for shpfile in *.shp; do

  # strip the extension from the filename to use for layer/style names
  layername=`basename $shpfile .shp`

  # create a new featuretype in the store, assuming the table
  # already exists in the database and is named $layername
  # this step automatically creates a layer of the same name
  # as a side effect
  curl -v -u $login -XPOST -H "Content-type: text/xml" \
    -d "<featureType><name>$layername</name></featureType>" \
    $restapi/workspaces/$workspace/datastores/$store/featuretypes?recalculate=nativebbox,latlonbbox

  # associate the style with the layer as the default style
  curl -v -u $login -XPUT -H "Content-type: text/xml" \
      -d "<layer><enabled>true</enabled><defaultStyle><name>$stylename</name><workspace>$workspace</workspace></defaultStyle></layer>" \
      $restapi/layers/$workspace:$layername

done
