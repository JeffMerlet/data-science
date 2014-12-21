# Coursera Getting and Cleaning Data Course Project

By Jeff Merlet

# Overview
This project takes the data from the [Human Activity Recognition Using Smartphones project](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) in order to generate a fie named "uci-har-data-grouped-average.txt" containing the average of each variable of the original data set (only the mean and standard deviation variables of each measurement are kept) for each activity and each subject.

The data set variables ae described in the CodeBook.md file.

# Data Transformation Performed
Hereafter is described each step that were taken to transform the orignal data set into the the generated data set:
* Merges the train and test data sets (X_train.txt and X_test.txt)
* Applies the features labels to the variables using the features.txt file
* Keeps only the average and standard deviation measurements
* Adds the activity for each observation by using the y_train.txt and y_test.txt files
* Replaces the activity identifier by a descriptive name using the activity_labels.txt file
* Updates all the variables names to have comprehensible and clean names
* Adds the subjects identifiers
* Calculates the average of each variable grouped by activity and subject
* Saves the data into the "uci-har-data-grouped-average.txt" file

# Usage
* Download the [original data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) (you can also used the saved zip file contained in this folder), and unzip in the same folder that contains the script run_analysis.R.
* Execute the run_analysis.R script.
* The script is then generating the "uci-har-data-grouped-average.txt" file in the folder.
* If needed, you can read the generated data by executing the following command:
```
read.table("uci-har-data-grouped-average.txt", header = TRUE)
```


