#This R script does the following 
#1) Merges the training and the test sets to create one data set.
#2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#3) Uses descriptive activity names to name the activities in the data set
#4) Appropriately labels the data set with descriptive variable names. 
#5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(data.table)

#read in all the data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

#get the names for the activities and features and assign those names to the test and train data
act_names <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
y_test$V1 <- factor(y_test$V1,levels = act_names$V1,labels = act_names$V2)
y_train$V1 <- factor(y_train$V1,levels = act_names$V1,labels = act_names$V2)
feat_names <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
headers <- feat_names[,2]
colnames(x_test) <- feat_names$V2
colnames(x_train) <- feat_names$V2

#hard code Activity and Subject to rename the appropriate fields in the test and train data
colnames(y_test) <- c("Activity")
colnames(y_train) <- c("Activity")
colnames(subject_test) <- c("SubjectID")
colnames(subject_train) <- c("SubjectID")

#merge the rows of the subject, test, and train data
subject_both <- rbind(subject_test, subject_train)
x_both <- rbind(x_test, x_train)
y_both <- rbind(y_test, y_train)

#extract only the measurements on the mean and standard deviation and combine test, train, and subject data
x_both <- x_both[, grep('mean|std', headers)]
tidy_data <- cbind(subject_both, y_both, x_both)

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
datatable <- data.table(tidy_data)

#find the the average of each variable for each activity and each subject and name the first two columns
tidy_data_avg <- aggregate(tidy_data[, 3:dim(tidy_data)[2]],list(tidy_data$SubjectID, tidy_data$Activity), mean)
names(tidy_data_avg)[1:2] <- c('Subject', 'Activity')

#write out tidy data as a tab delimited text file
write.table(tidy_data_avg, file="./tidy_data_avg.txt", sep="\t", row.names=FALSE)
