# Getting and Cleaning Data - Course Project

##run_analysis.R accomplishes the following tasks:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##to use run_analysis.R you must do the following:
1. Download the data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) and extract the files into your working directory
2. Put ```run_analysis.R``` in your working directory
3. Run ```source("run_analysis.R")``` to generate ```tidy_data_avg.txt``` in your working directory.

## Dependencies
data.table R library 