# Roger has a nice video on how there are R packages for most things that you will want to access.
# In general, the best way to find out if the R package exists is to Google "data storage mechanism R package"
# - For example: "MySQL R package"
# Here is a brief review of a few useful packages

# Interact more directly with files
file()   # open a connection to a text file
url()    # open a connection to a url
gzfile() # open a connection to a .gz file
bzfile() # open a connection to a .bz2 file
?connection # for more information about functions to open a connection to a file avaialble
# remember to close connections

# foreign package
# useful to load data from Minitab, S, SAS, SPSS, Stat, Systat
# Basic functions read.foo, foo is an extenstion for a particular language
# - read.arff(Weka)
# - read.dta(Stat)
# - read.mtp(Minitab)
# - read.octave(Octave)
# - read.spss(SPSS)
# - read.xport(SAS)

# read images 
# jpeg
# readbitmap
# png
# EBImage

# read GIS data
rdgal
rgeos
raster

# read music data
tuneR
seewave

