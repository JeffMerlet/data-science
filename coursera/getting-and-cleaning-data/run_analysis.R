## 
## Assumptions: the data must first be downloaded, unzip inside the default
## folder named "UCI HAR Dataset". This script must be at the same level than 
## this folder. The dataset file is located at:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## The origin of the data is: 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##
## Summary: The goal of this script is to prepare tidy data out of this
## data that could be used for later analysis. The file named "CodeBook.md"
## describes the variables, data and all the transformations that have been
## performed on the original data to generate the tidy data output.
##
## Source Data: the data files located inside the folder "UCI HAR Dataset"
## Output: a text files named "uci-har-data-grouped-average.txt"
##

## 
## Loads the reshape2 package; we will use its melt and dcast functions
##
if (!require("reshape2")) {
    # If not yet installed, installing the reshape2 package
    install.packages("reshape2")
    require("reshape2")
}

##
## Loads feature and activity labels
##
# Loads the features file with the column names
featureLabels <- read.table("UCI HAR Dataset/features.txt")
# Retains the column names
columnNames <- c(as.character(featureLabels$V2))
# Loads the activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

##
## Loads the training data
##

# Loads the training data set
trainingData <- read.table("UCI HAR Dataset/train/X_train.txt")

# Loads the training labels
trainingLabels <- read.table("UCI HAR Dataset/train/y_train.txt")

# Loads the training subjects
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

##
## Loads the test data
##

# Loads the test data set
testData <- read.table("UCI HAR Dataset/test/X_test.txt")

# Loads the test labels
testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")

# Loads the test subjects
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

##
## Merges the training and set data
##
data <- rbind(trainingData, testData)

##
## Applies the column names to have descriptive variable names
##
names(data) <- columnNames

##
## Extracts the mean and standard deviation measurements
##
meanColumns <- grep("mean()",colnames(data),fixed=TRUE)
stdColumns <- grep("std()",colnames(data),fixed=TRUE)
data <- data[,c(meanColumns, stdColumns)]

##
## Adds the activity by using descriptive activity names 
##
# Merges the the training and test labels
mergedLabels <- rbind(trainingLabels, testLabels)
# Adds the activity labels column to the data 
tidyData <- cbind(mergedLabels, data)
# changes the name of the newly merged activity column
colnames(tidyData)[1] <- "Activity"
# Replaces the activity value with descriptive activity names
for (i in 1:6) {
    tidyData[tidyData[,1] == i, 1] <- 
        as.character(activityLabels[i,2])
}

##
## Updates the variables names
##
# Gets the variables names
variables <- names(tidyData)
# Cleans the variables names
variables <- sub("^t", "Time", variables)
variables <- sub("^f", "Frequency", variables)
variables <- sub("Acc", "Accelerometer", variables)
variables <- sub("Gyro", "Gyroscope", variables)
variables <- sub("Mag", "Magnitude", variables)
variables <- sub("-mean..", "Mean", variables)
variables <- sub("-X", "XAxis", variables)
variables <- sub("-Y", "YAxis", variables)
variables <- sub("-Z", "ZAxis", variables)
variables <- sub("-std..", "StandardDeviation", variables)
variables <- sub("BodyBody", "Body", variables)
variables <- sub("gravity", "Gravity", variables)
# Assigns the cleaned variables to the data
names(tidyData) <- variables

##
## Adds the subjects identifiers as needed to create the second dataset
##
# Merges the training and test subjects together
mergedSubjects <- rbind(trainingSubjects, testSubjects)
# Adds the subjects to the data
dataWithSubject <- cbind(mergedSubjects, tidyData)
# Changes the name of the newly merged subjects column
colnames(dataWithSubject)[1] <- "Subject"

##
## Creates a new tidy data set with 
## the average of each variable for each activity and each subject.
##
# Sets the measure variables to be used for melting the data by removing
# the activity and subject columns
measures <- setdiff(colnames(dataWithSubject), c("Activity", "Subject"))
# Melts the measurements data based on activity and subject
# Note: transforms from wide-format to narrow-format
meltedData <- melt(dataWithSubject, 
             id = c("Activity", "Subject"), 
             measure.vars = measures)
# Casts the data by activity and subject to apply the mean on 'variable'
# Note: transforms from narrow-format to wide-format
finalData <- dcast(meltedData, Activity + Subject ~ variable, mean)    

##
## Writes the data to a text file
##
write.table(finalData, 
            file = "uci-har-data-grouped-average.txt", 
            row.names = FALSE)
# you can read the data with the following command:
# read.table("uci-har-data-grouped-average.txt", header = TRUE)


