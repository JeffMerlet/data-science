# Summary
This document describes the Human Activity Recognition Using Smartphones Dataset tidying project that result in the generation of the fie named "uci-har-data-grouped-average.txt" which format is described in this document. This file contains a tidy data set with the average of each variable (only the mean and standard deviation variables of each measurement are kept) for each activity and each subject.

The owner of this project is Jeff Merlet in the context of the Coursera Getting and Cleaning Data course project.
This project includes the following files:
* "README.md": the overall read-me and overview of this project
* "run_analysis.R": the R script generating the cleaned data file "uci-har-data-grouped-average.txt" from the original source dataset (see below)
* "CodeBook.md": this document

# Original Data
The data of the file "uci-har-data-grouped-average.txt" has been created by combining several data files of the [original data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) that was obtained from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) project.
A copy (downloaded on December 17, 2014) of the dataset is located in this directory as a reference for this project.

# Study Design
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Code Book (variables description)
Is described here the variables contained in the "uci-har-data-grouped-average.txt" dataset. More background on those variables could be found in the file "feature_info.txt" of the original dataset.
The first two variables are: 
* Activity: type of activity that was performed by the subjects; character
* Subject: identity of each subject; numeric
All the following variables are the average grouped by activity and subject of the average and standard deviation measures as described:
* "TimeBodyAccelerometerMeanXAxis", "TimeBodyAccelerometerMeanYAxis", "TimeBodyAccelerometerMeanZAxis": body acceleration time signal average on the X, Y and Z axis 
* "TimeGravityAccelerometerMeanXAxis", "TimeGravityAccelerometerMeanYAxis", "TimeGravityAccelerometerMeanZAxis": gravity acceleration time signal average on the X, Y and Z axis
* "TimeBodyAccelerometerJerkMeanXAxis", "TimeBodyAccelerometerJerkMeanYAxis", "TimeBodyAccelerometerJerkMeanZAxis": body linear acceleration Jerk time signal average on the X, Y and Z axis
* "TimeBodyGyroscopeMeanXAxis", "TimeBodyGyroscopeMeanYAxis", "TimeBodyGyroscopeMeanZAxis": body gyroscope time signal average on the X, Y and Z axis
* "TimeBodyGyroscopeJerkMeanXAxis", "TimeBodyGyroscopeJerkMeanYAxis", "TimeBodyGyroscopeJerkMeanZAxis": body angular velocity Jerk time signal average on the X, Y and Z axis
* "TimeBodyAccelerometerMagnitudeMean", "TimeGravityAccelerometerMagnitudeMean", "TimeBodyAccelerometerJerkMagnitudeMean", "TimeBodyGyroscopeMagnitudeMean", "TimeBodyGyroscopeJerkMagnitudeMean": magnitude (using the Euclidean norm) time signal average of the body acceleration, gravity acceleration, body linear acceleration Jerk, body gyroscope and body gyroscope Jerk
* "FrequencyBodyAccelerometerMeanXAxis", "FrequencyBodyAccelerometerMeanYAxis" , "FrequencyBodyAccelerometerMeanZAxis": body acceleration frequency signal average on the X, Y and Z axis
* "FrequencyBodyAccelerometerJerkMeanXAxis", "FrequencyBodyAccelerometerJerkMeanYAxis", "FrequencyBodyAccelerometerJerkMeanZAxis": body linear acceleration Jerk frequency signal average on the X, Y and Z axis
* "FrequencyBodyGyroscopeMeanXAxis", "FrequencyBodyGyroscopeMeanYAxis", "FrequencyBodyGyroscopeMeanZAxis": body gyroscope frequency signal average on the X, Y and Z axis
* "FrequencyBodyAccelerometerMagnitudeMean", "FrequencyBodyGyroscopeMagnitudeMean", "FrequencyBodyAccelerometerJerkMagnitudeMean", "FrequencyBodyGyroscopeJerkMagnitudeMean": magnitude (using the Euclidean norm) frequency signal average of the body acceleration, body gyroscope, body acceleration Jerk and gyroscope Jerk 
* "TimeBodyAccelerometerStandardDeviationXAxis", "TimeBodyAccelerometerStandardDeviationYAxis", "TimeBodyAccelerometerStandardDeviationZAxis": body acceleration time signal standard deviation on the X, Y and Z axis
* "TimeGravityAccelerometerStandardDeviationXAxis", "TimeGravityAccelerometerStandardDeviationYAxis", "TimeGravityAccelerometerStandardDeviationZAxis": gravity acceleration time signal standard deviation on the X, Y and Z axis
* "TimeBodyAccelerometerJerkStandardDeviationXAxis", "TimeBodyAccelerometerJerkStandardDeviationYAxis", "TimeBodyAccelerometerJerkStandardDeviationZAxis": body linear acceleration Jerk time signal standard deviation on the X, Y and Z axis
* "TimeBodyGyroscopeStandardDeviationXAxis", "TimeBodyGyroscopeStandardDeviationYAxis", "TimeBodyGyroscopeStandardDeviationZAxis": body gyroscope time signal standard deviation on the X, Y and Z axis
* "TimeBodyGyroscopeJerkStandardDeviationXAxis", "TimeBodyGyroscopeJerkStandardDeviationYAxis", "TimeBodyGyroscopeJerkStandardDeviationZAxis": body angular   velocity Jerk time signal standard deviation on the X, Y and Z axis
* "TimeBodyAccelerometerMagnitudeStandardDeviation", "TimeGravityAccelerometerMagnitudeStandardDeviation", "TimeBodyAccelerometerJerkMagnitudeStandardDeviation", "TimeBodyGyroscopeMagnitudeStandardDeviation", "TimeBodyGyroscopeJerkMagnitudeStandardDeviation": magnitude (using the Euclidean norm) time signal standard deviation of the body acceleration, gravity acceleration, body linear acceleration Jerk, body gyroscope and body gyroscope Jerk
* "FrequencyBodyAccelerometerStandardDeviationXAxis", "FrequencyBodyAccelerometerStandardDeviationYAxis" , "FrequencyBodyAccelerometerStandardDeviationZAxis": body acceleration frequency signal standard deviation on the X, Y and Z axis
* "FrequencyBodyAccelerometerJerkStandardDeviationXAxis", "FrequencyBodyAccelerometerJerkStandardDeviationYAxis", "FrequencyBodyAccelerometerJerkStandardDeviationZAxis": body linear acceleration Jerk frequency signal standard deviation on the X, Y and Z axis
* "FrequencyBodyGyroscopeStandardDeviationXAxis", "FrequencyBodyGyroscopeStandardDeviationYAxis", "FrequencyBodyGyroscopeStandardDeviationZAxis": body gyroscope frequency signal standard deviation on the X, Y and Z axis
* "FrequencyBodyAccelerometerMagnitudeStandardDeviation", "FrequencyBodyGyroscopeMagnitudeStandardDeviation", "FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation", "FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation": magnitude (using the Euclidean norm) frequency signal standard deviation of the body acceleration, body gyroscope, body acceleration Jerk and gyroscope Jerk

# Choices Description
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

