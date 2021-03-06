# Getting and Cleaning Data Course Project
Repository for the Coursera "Getting and Cleaning Data" course project.
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

The dataset used is [Human Activity Recognition Using Smartphones] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and it is assumed that data is present uncompressed in the same folder.

The `run_analysis.R` script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files

`CodeBook.md` describes the variables, the data, and the steps performed to clean up the data.

`run_analysis.R` contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.


