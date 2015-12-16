# Project for the Coursera Getting & Cleaning Data Course

## Dependencies:

The file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip must be downloaded, and extracted so that the directory "UCI HAR Dataset" in the current working directory.

## Contents:

THe following files are in this repo:

* README.md - this file
* run_analysis.R - the R code that works on the above data set, and creates tidy.csv per the course instructions
* tidy.txt - the cleaned dataset
* CODEBOOK.md - the code book that describes the variables in tidy.csv

## Running the code:

Running 'source("run_analysis.R") performs the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.