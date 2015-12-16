# Getting and Cleaning Data Peer Assessment Codebook

## Explanation of each Input File:

The following Input Files are used from the dataset:

* features.txt: Names of the 561 features.
* activity_labels.txt: Names/IDs for each of the 6 activities.
* X_train.txt: 7352 observations of the 561 features
* subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
* y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
* X_test.txt: 2947 observations of the 561 features.
* subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
* y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.


## Processing Steps:

* The Test and Train data were loaded separately. 
* Three files (subject, X, and y) were loaded for both test and train. 
* Headers for the X values were extracted from the features.txt file and applied to both test and train datasets.
* Next, test and train data sets were merged into one. For readability column names of Subject and Activity were added for the subject and y values respectively.
* These headers were used to filter out only means and standard deviations from the set of observations. 
* An aggregation was performed on all columns of the data frame, grouping by Subject and Activity. 
* This yielded 180 observations of the 68 variables.
* An activity name was assigned to each of the levels in the Activity column, pulled from the activity_labels.txt file.
* When the script run_analysis.R is executed, it will output a text file (named tidy.txt) in the users current working directory.

