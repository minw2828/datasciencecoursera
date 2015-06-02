## Graphics Devices In R (Part1)


## What is a Graphics Devices?
##   - A graphics device is something where you can make a plot appear
##     -  A window on your computer (screen device)
##     -  A PDF file (file device)
##     -  A PNG or JPEG file (file device)
##     -  A scalable vector graphics (SVG) file (file device)
##   - When you make a plot in R, it has to be "sent" to a specific 
##     graphics devices
##   - The most common place for a plot to be "sent" is the screen device
##     - On a Mac the screen device is launched with the quartz()
##     - On Windows the screen device is launched with the windows()
##     - On Unix/Linux the screen device is launched with x11()
##   - When making a plot, you need to consider how the plot will be used  
##     to determine what device the plot should be sent to.
##     - The list of devices is found in ?Devices; there are also devices
##       created by users on CRAN
##   - For quick visualizations and exploratory analysis, usually you want 
##     to use the screen device
##     - Functions like plot in base, xyplot in lattice, or qplot in ggplot2   
##       default to sending a plot to the screen device
##     - On a given platform (Mac, Windows, Unix/Linux) there is only one
##       screen device
##   - For plots that may be printed out or be incorporated into a document
##     (e.g. papers/reports, slide presentations), usually a file device is 
##     more appropriate
##     - There are many different file devices to choose from
##   - Note: Not all graphics devices are available on all platforms (i.e. 
##           you cannot launch the windows() on a Mac)
    
## How Does a Plot Get Created?
## There are two basic approaches to plotting. The first is most common:
## 1. Calling a plotting function like plot, xyplot, gplot
## 2. The plot appears on the screen device
## 3. Annotate plot if necessary
## 4. Enjoy 
library(datasets)
with(faithful, plot(eruptions, waiting)) ## Make plot appear on screen device
title(main="Old Faithful Geyser data")   ## Annotate with a title
## The second apprach to plotting is most commonly used for file devices:
## 1. Explicitly launch a graphics device
## 2. Call a plotting function to make a plot (Note: If you are using a file
##    device, no plot will appear on the screen)
## 3. Annotate plot if necessary
## 4. Explicitly close graphics device with dev.off() (this is very important!)
## Open PDF device; create 'myplot.pdf' in my working directory
## Create plot and send to a file (no plot appears on screen)
pdf(file="myplot.pdf") 
with(faithful, plot(eruptions, waiting))
## Annotate plot; still nothing on screen
title(main="Old Faithful Geyser data")
## Close the PDF file device
dev.off()
## Now you can view the file 'myplot.pdf' on your computer

