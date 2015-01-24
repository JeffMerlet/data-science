##
## The goal is to answer this question: Have total emissions from PM2.5 
## decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008?
## This script is using the base plotting system, to make a plot showing the 
## total PM2.5 emission from all sources for each of the years 1999, 2002, 
## 2005, and 2008 for Baltimore.
##

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

# Summarizes the total of PM2.5 Emissions for each year
pm25BaltimoreSum <- ddply(pm25Baltimore, .(year), summarize, sum = sum(Emissions))

# Draws the 480x480 plot into a PNG device
png(filename = "plot2.png", width = 480, height = 480)
par(mfrow = c(1,1), mar = c(5, 5, 3, 3))

# Draws Total PM2.5 emissions by year plot
plot(pm25BaltimoreSum$year, pm25BaltimoreSum$sum,
     main = "Total PM2.5 Emissions by Year for Baltimore, MD",
     type = "l",
     col = "black",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions")

# Closes the PNG device
dev.off()


