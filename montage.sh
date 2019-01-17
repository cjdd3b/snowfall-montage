declare -a months=( \
  ["01"]="Jan." \
  ["02"]="Feb." \
  ["03"]="March" \
  ["04"]="April" \
  ["05"]="May" \
  ["06"]="June" \
  ["07"]="July" \
  [10#"08"]="Aug." \
  [10#"09"]="Sept." \
  ["10"]="Oct." \
  ["11"]="Nov." \
  ["12"]="Dec.") \

cd tmp &&

for i in `seq -f "%04g" 3 106`;
do
  echo $i

  # Get date info for use below
  date_seed=$(find . -name "$i-sfav*" | head -n 1)
  month_raw=${date_seed:37:2}
  day_raw=${date_seed:39:2}

  # Put into 3x2 montage
  montage \
    $i\-*.tif.gif \
    -geometry 300x300+2+2 \
    $i-$month_raw$day_raw-montage.gif

  # Add month, day labels
  convert $i-$month_raw$day_raw-montage.gif \
  -font Helvetica-Bold \
      -size 165x70 \
      -pointsize 28 \
      -fill '#a8a8a8' \
      -weight 1000 \
      -gravity SouthWest \
      -annotate +25+20 "${months[month_raw]} $((10#$day_raw))" \
  -font Helvetica-Bold \
      -pointsize 14 \
      -fill '#a8a8a8' \
      -weight 1000 \
      -gravity SouthEast \
      -annotate +25+15 "Source: NOAA National Snowfall Analysis" \
  $i-$month_raw$day_raw-montage.gif
done   

echo "Converting to animated gif ..." && \
convert -delay 10 -loop 0 ./*-montage.gif ./animated-national.gif && \
rm ./*-montage.gif