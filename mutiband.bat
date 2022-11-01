gdalwarp -s_srs EPSG:<current epgs> -t_srs EPSG:<new epgs> -co TILED=YES -co COMPRESS=DEFLATE -r bilinear -dstalpha <input tiff file> <output projected tiff file>
gdal_translate -of GTiff -a_nodata 0 <projected tiff file> <output translate tif file> -b 1 -b 2 -b 3 -b 4 -co BIGTIFF=YES  -co COMPRESS=DEFLATE -co TILED=YES -co BLOCKXSIZE=512 -co BLOCKYSIZE=512 --config GDAL_TIFF_INTERNAL_MASK YES
gdaladdo -r average <input translate tif file>  2 4 8 16 32 --config COMPRESS_OVERVIEW DEFLATE 
gdalinfo scale.tif