# Hillshaded relief maps of snowfall accumulation

Inspired by projects from the [Washington Post](https://www.washingtonpost.com/graphics/2018/national/snow-accumulation/?utm_term=.0f13e7b9f5a1) and [Garrett Dash Nelson](http://viewshed.matinic.us/2018/01/13/1139/), this project creates nine years of hillshaded relief maps of accumulated snowfall and displays them as a single animated GIF.

Data comes from the [National Weather Service](https://www.nohrsc.noaa.gov/snowfall/).

## Usage

Start by running `scrape.py` to download GeoTIFFs from the NWS. This will take a long time. The files will be stored in a directory called `./raw`.

Next run `./make.sh` to create hillshaded relief maps in the form of GIFs. The `color-ramp.txt` files define the color scheme. Hillshade relief can be changed with the `-z` parameter on the `gdaldem hillshade` command. Other parameters can also be tuned for different results.

Finally run `montage.sh` to merge the files and add labels. The resulting GIF will show up in the `./final` directory.

## Resources

In no particular order:

  * [Derek Watkins' GDAL cheat sheet](https://github.com/dwtkns/gdal-cheat-sheet)
  * [A gentle introduction to GDAL](https://medium.com/planet-stories/a-gentle-introduction-to-gdal-part-1-a3253eb96082)
  * [Making a New York Times map](https://thomasthoren.com/2016/02/28/making-a-new-york-times-map.html)
  * [Creating a transparent hillshade](https://gis.stackexchange.com/)questions/144535/creating-transparent-hillshade/144700#144700)
  * [Smoothing DEM using GRASS](https://gis.stackexchange.com/questions/12833/smoothing-dem-using-grass)
  * [An R-based, colored version of this map](http://strimas.com/r/snowfall/)
  * [GDAL hillshade tutorial](https://github.com/clhenrick/gdal_hillshade_tutorial)
  * [Tilemill guide to terrain data](https://tilemill-project.github.io/tilemill/docs/guides/terrain-data/)
  * [Ways to merge colored relief and shaded relief](http://dirkraffel.com/2011/07/05/best-way-to-merge-color-relief-with-shaded-relief-map/)
  * [A workflow for creating beautiful shaded DEMs using GDAL](https://web.archive.org/web/20120120182050/http://linfiniti.com/2010/12/a-workflow-for-creating-beautiful-relief-shaded-dems-using-gdal/)
  * [Creating hillshades and colored relief maps](https://medium.com/devseed/creating-hillshades-and-color-relief-maps-based-on-srtm-data-for-afghanistan-and-pakistan-ae7c8e85d936)

## Questions?

Contact chase.davis@gmail.com