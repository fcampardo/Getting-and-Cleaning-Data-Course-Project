### Description
Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

### Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Section 1. Merge the training and the test sets to create one data set.
After setting the source directory for the files, read into tables the data located in
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Merge x-sets by row, y-sets by row and subject-sets by row and then merge the new x, y, subject data sets by column

## Section 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Create a logcal vector that contains TRUE values for the mean and stdev columns and FALSE values for the others.
Subset this data to keep only the necessary columns.

## Section 3. Use descriptive activity names to name the activities in the data set
Update current values with the decoded activity names

## Section 4. Appropriately label the data set with descriptive activity names.
Use gsub function for pattern replacement to clean up the data labels.

## Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
A new data set is produced with only the average value of each variable for each activity and subject.
Then all the new data is saved in .csv file called tidy.csv
