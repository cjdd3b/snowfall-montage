from datetime import timedelta, date
import urllib, os

########## GLOBALS ##########

START_YEAR = 2013
END_YEAR = 2018
END_MONTH = 1 # January
END_DAY = 17 # 17th, which is today-ish

########## HELPER FUNCTIONS #########

def daterange(start_date, end_date):
    for n in range(int((end_date - start_date).days)):
        yield start_date + timedelta(n)

########## MAIN ###########

if __name__ == '__main__':
    for year in range(START_YEAR, END_YEAR + 1):
        print 'Processing %s ...' % year
        start_date = date(year, 10, 1) # Always the starting date for snow data
        end_date = date(year + 1, END_MONTH, END_DAY) # The +1 is because the year rolls over. Hack.

        n = 0
        for single_date in daterange(start_date, end_date):
            # Create URLs
            file_to_get = "sfav2_CONUS_" + str(year) + "093012_to_{}12.tif".format(single_date.strftime("%Y%m%d"))
            url = "http://www.nohrsc.noaa.gov/snowfall/data/{}/".format(single_date.strftime("%Y%m")) + file_to_get

            # Create output filename
            pad = format(n, '04')
            outfile = "./raw/{}-{}".format(pad, file_to_get)

            # Get URL if file doesn't already exist
            if os.path.isfile(outfile) == False:
                print 'Getting %s ...' % url
                urllib.urlretrieve (url, outfile)
            else:
                print 'File %s exists' % outfile
            
            # Increment counter
            n = n + 1