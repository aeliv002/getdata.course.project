# getdata.course.project

## Introduction and details

Peer Assessments 
/Getting and Cleaning Data Course Project

This assesment consist of:
R script called <B> run_analysis.R </B> that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Script run_analysis.R 
This script runs and creates tidy data for assesment and summary data from tidy data.

The scripts creates tables:
1. all.features.data.tidy for step 1-4  
2. all.features.data.tidy.summary for step 5.

The script consist of:
1. Loading data to R.
2. Merging data to all.features.data.tidy
3. Summarising all.features.data.tidy to all.features.data.tidy.summary
4. Updating columns of tables.

Almost for all the analysis steps, the dplyr package was used.

## Code book
The code book for these two tables is the one.
The code book is file codeBook.pdf
