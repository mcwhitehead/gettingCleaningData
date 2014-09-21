# CodeBook
describes the data, the variables, and any transformations or work that you performed to create tidy data.

## The data

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Source:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 



Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The data contains test, training, a subject files including:
* 'features_info.txt'- info about the variables
* 'features.txt'- list of all features.
* 'activity_labels.txt' -activity names.
* 'train/X_train.txt'- Training set.
* 'train/y_train.txt'- Training labels.
* 'test/X_test.txt'- Test set.
* 'test/y_test.txt'- Test labels.
* 'train/subject_train.txt'- subject who performed the activity 
* 'train/Inertial Signals/total_acc_x_train.txt'- the acceleration signal 
* 'train/Inertial Signals/body_acc_x_train.txt'- the body acceleration signal
* 'train/Inertial Signals/body_gyro_x_train.txt'- the angular velocity vector

## The variables
The following variables are in the tidy_data_avg.txt output. For detailed variable definitions see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
 
Subject - The subject ID
Activity - the name of the activity
tBodyAcc-mean()-X	
tBodyAcc-mean()-Y	
tBodyAcc-mean()-Z	
tBodyAcc-std()-X	
tBodyAcc-std()-Y	
tBodyAcc-std()-Z	
tGravityAcc-mean()-X	
tGravityAcc-mean()-Y	
tGravityAcc-mean()-Z	
tGravityAcc-std()-X	
tGravityAcc-std()-Y
tGravityAcc-std()-Z	
tBodyAccJerk-mean()-X	
tBodyAccJerk-mean()-Y	
tBodyAccJerk-mean()-Z	
tBodyAccJerk-std()-X	
tBodyAccJerk-std()-Y	
tBodyAccJerk-std()-Z	
tBodyGyro-mean()-X	
tBodyGyro-mean()-Y	
tBodyGyro-mean()-Z	
tBodyGyro-std()-X	
tBodyGyro-std()-Y	
tBodyGyro-std()-Z	
tBodyGyroJerk-mean()-X	
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z	
tBodyGyroJerk-std()-X	
tBodyGyroJerk-std()-Y	
tBodyGyroJerk-std()-Z	
tBodyAccMag-mean()	
tBodyAccMag-std()	
tGravityAccMag-mean()	
tGravityAccMag-std()	
tBodyAccJerkMag-mean()	
tBodyAccJerkMag-std()	
tBodyGyroMag-mean()	
tBodyGyroMag-std()	
tBodyGyroJerkMag-mean()	
tBodyGyroJerkMag-std()	
fBodyAcc-mean()-X	
fBodyAcc-mean()-Y	
fBodyAcc-mean()-Z	
fBodyAcc-std()-X	
fBodyAcc-std()-Y	
fBodyAcc-std()-Z	
fBodyAcc-meanFreq()-X	
fBodyAcc-meanFreq()-Y	
fBodyAcc-meanFreq()-Z	
fBodyAccJerk-mean()-X	
fBodyAccJerk-mean()-Y	
fBodyAccJerk-mean()-Z	
fBodyAccJerk-std()-X	
fBodyAccJerk-std()-Y	
fBodyAccJerk-std()-Z	
fBodyAccJerk-meanFreq()-X	
fBodyAccJerk-meanFreq()-Y	
fBodyAccJerk-meanFreq()-Z	
fBodyGyro-mean()-X	
fBodyGyro-mean()-Y	
fBodyGyro-mean()-Z	
fBodyGyro-std()-X	
fBodyGyro-std()-Y	
fBodyGyro-std()-Z	
fBodyGyro-meanFreq()-X	
fBodyGyro-meanFreq()-Y	
fBodyGyro-meanFreq()-Z	
fBodyAccMag-mean()	
fBodyAccMag-std()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()	
fBodyBodyAccJerkMag-std()	
fBodyBodyAccJerkMag-meanFreq()	
fBodyBodyGyroMag-mean()	
fBodyBodyGyroMag-std()	
fBodyBodyGyroMag-meanFreq()	
fBodyBodyGyroJerkMag-mean()	
fBodyBodyGyroJerkMag-std()	
fBodyBodyGyroJerkMag-meanFreq()

## the transformations

After the data was loaded into the R environment the following transformations were made

1. obtained the names for the activities and assigned them to the train and test data 
2. renamed column names in the train and test data to logical names (SubjectID, Activity)
3. merged the rows of the subject, text, and train datasets
4. extracted the columns that were measures of mean or standard deviation
5. merged the 3 datasets to make one dataset
6. find the the average of each variable for each activity and each subject
7. write out the resulting dataframe as a tab delimited text file

These step accomplished the following tasks albeit in a differnt order:
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.