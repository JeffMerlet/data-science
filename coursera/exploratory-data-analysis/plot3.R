##
## The goal is to answer those 2 questions: 
## 1) Of the four types of sources indicated by the 
##    type (point, nonpoint, onroad, nonroad) variable, which of these 
##    four sources have seen decreases in emissions from 1999–2008 for 
##    Baltimore City? 
## 2) Which have seen increases in emissions from 1999–2008? 
## This script is using the ggplot2 plotting system, to make a plot showing the 
## total PM2.5 emission from all sources for each of the years 1999, 2002, 
## 2005, and 2008 for Baltimore.
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

## Checks if the file exist exist
## If not then download the zip file and unzip it in this folder
if (!file.exists(pm25FileName)) {
    tempZipFile <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
                  tempZipFile,
                  method = "curl")
    unzip(tempZipFile)
    unlink(tempZipFile)
}

# Reads the PM2.5 Emissions data file
pm25 <- readRDS(pm25FileName)

# Gets the data for Baltimore only
pm25Baltimore <- subset(pm25, fips == "24510")

# Summarizes the total of PM2.5 Emissions for each year per type (source)
pm25BaltimoreSum <- ddply(pm25Baltimore, 
                          .(year, type), 
                          summarize, 
                          sum = sum(Emissions))

# Draws the plot into a PNG device
png(filename = "plot3.png", width = 640, height = 640)
par(mfrow = c(1,1), mar = c(5, 5, 3, 3))

# Draws Total PM2.5 emissions by year by source plot
# Base plot
g <- ggplot(pm25BaltimoreSum, aes(x = year, y = sum, color = factor(type))) + 
     geom_line() + 
     facet_wrap(~type, nrow = 1)
# Theme
g <- g + theme_solarized() 
# Title
g <- g + ggtitle("Sources of Total PM2.5 Emissions by Year for Baltimore, MD")
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
# Facet title
g <- g + theme(strip.text.x = element_text(size = 11, 
                                           face = "bold",
                                           family = "Palatino"))
# Legend
g <- g + theme(
    legend.title = element_text(size = 12, 
                                face = "bold",
                                family = "Palatino")) 
g <- g + scale_color_discrete(name = "Sources:")

print(g)

# Closes the PNG device
dev.off()


