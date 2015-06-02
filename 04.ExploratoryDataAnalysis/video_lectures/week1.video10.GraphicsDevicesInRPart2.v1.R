## Graphics Devices In R (Part2)

## Graphics File Devices
## There are two basic types of file devices: vector and bitmap devices
## 
## Vector formats:
## - pdf: useful for line-type graphics, resizes well, usually portable,
##        not efficient if a plot has many objects/points
##        Line graphics: e.g. scatterplot and draw a line through it.
##                       They don't have any nature scenes or photographics 
##                       in it 
## - svg: XML-based scalable vector graphics; supports animation and interactivity, 
##        potentially useful for web-based plots
## - win.metafile: Windows metafile format (only on Windows)
## - postscript: older format, also resizes well, usually portable, can be used to 
##               create encapsulated postscript files; Windows systems often don't 
##               have a postscript viewer
## 
## Bitmap formats:
## - png: bitmapped format, good for line drawings or images with solid colors, uses 
##        lossless compression (like the old GIF format), most web browsers can read 
##        this format natively, good for plotting many many many points, does not 
##        resize well
## - jpeg: good for photographs or natural scenes, uses lossy compression, good for 
##         plotting many many many points, does not resize well, can be read by almost 
##         any computer and any web browser, not great for line drawings
## - tiff: Create bitmap files in the TIFF format; supports lossless compression
## - bmp: a native Windows bitmapped format
## 
## Multple Open Graphics Devices
## - It is possible to open multiple graphics devices (screen, file, or both), for 
##   example when viewing multiple plots at once
## - Plotting can only occur on one graphics device at a time
## - The currently active graphics devices can be found by calling dev.cur()
## - Every open graphics device is assigned at integer >= 2
## - You can change the active graphics device with dev.set(<integer>) where <integer>
##   is the number associated with the graphics device you want to switch to
## 
## Copying Plots
## Copying a plot to another device can be useful because some plots require a lot of 
## code and it can be a pain to type all that in again for a different device.
## - dev.copy: copy a plot from one device to another
## - dev.copy2pdf: specifically copy a plot to a PDF file
## Note: Copying a plot is not an exact operation, so the result may not be identical 
##       to the original
library(datasets)
with(faithful, plot(eruptions, waiting)) ## Create plot on screen device
title(main="Old Faithful Geyser data")   ## Add a main title
dev.copy(png, file="geyserplot.png")     ## Copy my plot to a PNG file
dev.off()                                ## Don't forget to close the PNG device!

## Summary
## - Plots must be creatd on a graphics device
## - The default graphics device is almost always the screen device, which is most 
##   useful for exploratory analysis 
## - File devices are useful for creating plots that can be included in other 
##   documents or sent to other people
## - For file devices, there are vector and bitmap formats
##   - Vector formats are good for line drawings and plots with solid colors using 
##     a modest number of points
##   - Bitmap formats are good for plots with a large number of points, natural  
##     scenes or web-based plots


