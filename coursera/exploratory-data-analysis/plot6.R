##
## The goal is to answer this question:
## Compare emissions from motor vehicle sources in Baltimore City with 
## emissions from motor vehicle sources in Los Angeles County, California 
## (fips == "06037"). Which city has seen greater changes over time in motor 
## vehicle emissions?
## This script is using the ggplot2 plotting system, to make a plot showing the 
## total PM2.5 emission from motor vehicule related sources from 1999 to 2008
## for Baltimore City, MD and Los Angeles County, CA.
##

## Loads the ggplot2 package
if (!require("ggplot2")) {
    # If not yet installed, then install the package
    install.packages("ggplot2")
    require("ggplot2")
}

## Loads the ggthemes package
if (!require("ggthemes")) {
    # If not yet installed, then install the package
    install.packages("ggthemes")
    require("ggthemes")
}

## Loads the plyr package
if (!require("plyr")) {
    # If not yet installed, then install the package
    install.packages("plyr")
    require("plyr")
}

# PM2.5 Emissions data file name
pm25FileName <- "summarySCC_PM25.rds"

# SCC data file name
sccFileName <- "Source_Classification_Code.rds"

## Checks if both files exist
## If not then download the zip file and unzip it in this folder
if (!file.exists(pm25FileName) && !file.exists(sccFileName)) {
    tempZipFile <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
                  tempZipFile,
                  method = "curl")
    unzip(tempZipFile)
    unlink(tempZipFile)
}

# Reads the PM2.5 Emissions data file
pm25 <- readRDS(pm25FileName)

# Reads the SCC data file
scc <- readRDS(sccFileName)

# Merges the pm and scc data files
pm25SCC <- merge(pm25, scc, by = "SCC")

# Extracts the motor-vehicule sources
motor <- subset(pm25SCC, grepl("*Onroad*", pm25SCC$Data.Category))

# Gets the data for Baltimore and Los Angeles
baltimore <- subset(motor, fips == "24510")
la <- subset(motor, fips == "06037")

# Summarizes the total of PM2.5 Emissions for each year 
# for Baltimore and Los Angeles
baltimoreSum <- ddply(baltimore,
                      .(year),
                      summarize,
                      sum = sum(Emissions))
laSum <- ddply(la,
               .(year),
               summarize,
               sum = sum(Emissions))

# Adds the location column
baltimoreSum$location <- "Baltimore City"
laSum$location <- "Los Angeles County"

# Merges the 2 data sets
baltimoreLAPM <- rbind(laSum, baltimoreSum)

# Draws the plot into a PNG device
png(filename = "plot6.png", width = 640, height = 640)
par(mfrow = c(1,1), mar = c(5, 5, 3, 3))

# Base plot
g <- ggplot(baltimoreLAPM, aes(x = year, y = sum, color = factor(location))) + 
    geom_line()
# Theme
g <- g + theme_solarized() 
# Title
g <- g + ggtitle("Motor Vehicules PM2.5 Emissions For Baltimore and LA")
g <- g + theme(plot.title = element_text(size = 16, 
                                         face = "bold", 
                                         vjust = 2,
                                         family = "Palatino"))
# Axis labels
g <- g + labs(x = "Year", y = "Total PM2.5 Emissions")
g <- g + theme(
    axis.title.x = element_text(size = 14, 
                                face = "bold", 
                                vjust = -0.3,
                                family = "Palatino"),
    axis.title.y = element_text(size = 14, 
                                face = "bold", 
                                vjust = 1,
                                family = "Palatino"))
# Legend
g <- g + theme(
    legend.title = element_text(size = 14, 
                                face = "bold",
                                family = "Palatino")) 
g <- g + scale_color_discrete(name = "Locations:")

print(g)

# Closes the PNG device
dev.off()

