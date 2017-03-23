for %%f in (*.shp) do shp2pgsql -I -s 4326 %%f %%~nf > %%~nf.sql
for %%f in (*.sql) do psql -d geodatabase -f %%f
