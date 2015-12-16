## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the 
##    average of each variable for each activity and each subject.


## Need these libraries
library(data.table)
library(dplyr)

## PART 1: Merges the training and the test sets to create one data set.

## Load feature names
fNames <- read.table("UCI HAR Dataset/features.txt")

## Get all the data and merge the respective test/train data sets, set column names
sTrain  <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
sTest   <- read.table("UCI HAR Dataset/test/subject_test.txt",   header = FALSE)
sMerged <- rbind(sTrain, sTest)
colnames(sMerged) <- "Subject"

yTrain  <- read.table("UCI HAR Dataset/train/y_train.txt",       header = FALSE)
yTest   <- read.table("UCI HAR Dataset/test/y_test.txt",         header = FALSE)
yMerged <- rbind(yTrain, yTest)
colnames(yMerged) <- "Activity"

xTrain  <- read.table("UCI HAR Dataset/train/X_train.txt",       header = FALSE)
xTest   <- read.table("UCI HAR Dataset/test/X_test.txt",         header = FALSE)
xMerged <- rbind(xTrain, xTest)
colnames(xMerged) <- t(fNames[2])  ## Set Column Names

## Now combine everything
data <- cbind(xMerged,yMerged,sMerged)

## PART 2: Extracts only the measurements on the mean and standard deviation for 
##        each measurement.

## Find relevant columns
colMS <- grep(".*Mean.*|.*Std.*", names(data), ignore.case=TRUE)

## add Subject and Activity columns
colMS <- c(colMS, 562, 563)

## extract the mean and std dev. data
eData <- data[,colMS]

## PART 3: Uses descriptive activity names to name the activities in the data set
## PART 4: Appropriately labels the data set with descriptive variable names. 

## Convert from int type
eData$Activity <- as.character(eData$Activity)

## Get Text Descriptions
aLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

## apply Text Descriptions we got in aLabel above
for (i in 1:6){
  eData$Activity[eData$Activity == i] <- as.character(aLabels[i,2])
}

## factor Activity and Subject columns
eData$Activity <- as.factor(eData$Activity)
eData$Subject  <- as.factor(eData$Subject)

## PART 5: From the data set in step 4, creates a second, independent tidy data set  
##        with the average of each variable for each activity and each subject.
tData <- aggregate(eData, by=list(Subject=eData$Subject, Activity = eData$Activity), mean)
tData <- tData[order(tData$Subject,tData$Activity),]
write.csv(tData, file = "tidy.csv", row.names = FALSE)
