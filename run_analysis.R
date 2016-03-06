## Coursera Getting and Cleaning Data Course Project
## Author: Fabio Campardo

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Step 0: not needed for the project, therefore commented 
# Download and unzip the dataset: In Windows in case of problems with method="curl" 
# download.file(fileURL, filename) can be used instead
# filename <- "getdata_dataset.zip"
#
# if (!file.exists(filename)){
#  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"            
#  download.file(fileURL, filename, method="curl")
#}  
#if (!file.exists("UCI HAR Dataset")) { 
#  unzip(filename) 
#}
#setwd("UCI HAR Dataset")

# 1. Merge the training and test sets to create one data set.
# Merge x-sets by row, y-sets by row and subject-sets by row.

# create 'x' data set
xtrain <- read.table("train/X_train.txt")
xtest <- read.table("test/X_test.txt")
xdata <- rbind(xtrain, xtest)

# create 'y' data set
ytrain <- read.table("train/y_train.txt")
ytest <- read.table("test/y_test.txt")
ydata <- rbind(ytrain, ytest)

# create 'subject' data set
subjecttrain <- read.table("train/subject_train.txt")
subjecttest <- read.table("test/subject_test.txt")
subjectdata <- rbind(subjecttrain, subjecttest)

# 2: Extract only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt")

# get only columns with "mean" or "std" in their names
mean.std <- grep(".*mean.*|.*std.*", features[,2])

# subset the mean and std columns
xdata <- xdata[, mean.std]

# 3: Use descriptive activity names to name the activities in the data set

# correct the xdata column names
mean.std.names <- features[mean.std,2]
mean.std.names = gsub('-mean', 'Mean', mean.std.names)
mean.std.names = gsub('-std', 'Std', mean.std.names)
mean.std.names <- gsub('[-()]', '', mean.std.names)
colnames(xdata) <- c(mean.std.names)

# update values with correct activity names
activities <- read.table("activity_labels.txt")
ydata[, 1] <- activities[ydata[, 1], 2]

# correct column name
names(ydata) <- "activity"

# 4: Appropriately label the data set with descriptive variable names

# correct column name
names(subjectdata) <- "subject"

# bind all the data in by columns a single data set
alldata <- cbind(xdata, ydata, subjectdata)

# 5: Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

# creates a new data set with only the requested mean values
meandata <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:66]))

# write the file in .csv format
write.table(averages_data, "tidy.txt", row.name=FALSE,sep="\t")
