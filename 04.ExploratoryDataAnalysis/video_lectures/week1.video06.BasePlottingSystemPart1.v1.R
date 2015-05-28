## Base Plotting System (Part 1)

## Plotting System:
## The core plotting and graphics engine in R is encapsulated in the following 
## packages:
##   - graphics:  contains plotting functions for the "base" graphing systems,
##                including plot, hist, boxplot and many others.
##   - grDevices: contains all the code implementing the various graphics 
##                devices, including X11, PDF, PostScript, PNG, etc.
## The lattice plotting system is implemented using the following packages:
##   - lattice: contains code for producing Trellis graphics, which are 
##              independent of the "base" graphics system; includes functions 
##              like xyplot, bwplot, levelplot
##   - grid:    implements a different graphing system independent of the "base"
##              system; the lattice package builds on the top of grid; we 
##              seldom call functions from the grid package directly
##
## The Process of Making a Plot:
## A few consideration (not necessarily in this order):
##   - Where will the plot be made? On the screen? In a file?
##   - How will the plot be used?
##      - For viewing temporarily on the screen? 
##      - Be present in a web browser?
##      - Be present in a paper that might be printed?
##      - Be used in a presentation?
##   - Plot a large amount of data or just a few points?
##   - Do you need to dynamically resize the graphic?
##   - What graphic system: base, lattice or ggplot2? They are not interchangeable.
##     
## Here we focus on using the base plotting system to create graphics on the 
## screen device.
##
## Base Graphics:
## - Most commonly used
## - Very powerful for creating 2-D graphics
## There are two phases to create a base plot:
##   - Initialize a new plot
##   - Annotate (add to) an existing plot
##
##
##
##
##
##


