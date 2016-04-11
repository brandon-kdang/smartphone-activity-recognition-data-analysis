# smartphone-activity-recognition-data-analysis

##Data
This repo contains the script to analyze the smartphone activity recognition data as described in the following document: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data can be downloaded at the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Description
The run_analysis.R does the following: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Usage
The analysis dataset can be run as following:
```
setwd(<directory that contains the Samsung dataset>)
run_analysis()
```