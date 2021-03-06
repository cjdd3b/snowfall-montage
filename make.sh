rm -rf tmp && \

mkdir -p tmp && \
cd ./raw &&

for i in *.tif; do
  year=${i:31:4}

  # Project the images to Albers
  gdalwarp -q -t_srs "EPSG:102003" -srcnodata "-99999" $i ../tmp/proj_$i;

  # Hillshade the snowfall totals
  gdaldem hillshade -z 3000 ../tmp/proj_$i ../tmp/hillshade_$i;
  convert -gamma .5 ../tmp/hillshade_$i ../tmp/gamma_$i;
  rm ../tmp/hillshade_$i;

  # Create color relief of snowfall totals
  gdaldem color-relief ../tmp/proj_$i ../color-ramp.txt ../tmp/shadedrelief_$i;
  rm ../tmp/proj_$i;

  # Combine hillshade and color relief
  convert ../tmp/shadedrelief_$i ../tmp/gamma_$i -compose Overlay -composite ../tmp/colored_$i;

  # Turn into gifs; add year label
  convert ../tmp/colored_$i \
  -resize 50% \
  -font Helvetica-Bold \
      -size 165x70 \
      -pointsize 28 \
      -fill '#686868' \
      -weight 1000 \
      -gravity North \
      -annotate +0+30 $year \
  ../tmp/$i.gif;
  rm ../tmp/colored_$i;

  # Cleanup
  rm ../tmp/shadedrelief_$i;
  rm ../tmp/gamma_$i;
done
