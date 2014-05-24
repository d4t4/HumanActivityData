## This script assumes no data exists in the working directory, and will therefore download
## and extract the dataset. If the data directory already exists, just comment out the first
## three lines.

## Download and extract the archived dataset to ./UCI Har Dataset directory

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip", method = "curl")
unzip("Dataset.zip")

## Read file data into variables in memory

features <- read.table("./UCI HAR Dataset/features.txt", col.names=c("fid", "fname"))
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("aid", "aname"))
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=features$fname,check.names=FALSE)
trainDataActivity <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("aid"))
trainDataSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))
testData <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=features$fname,check.names=FALSE)
testDataActivity <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("aid"))
testDataSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))

## Merge the train and test sets

XMerge <- rbind(trainData,testData)
yMerge <- rbind(trainDataActivity,testDataActivity)
subjectMerge <- rbind(trainDataSubject,testDataSubject)

## Using grep to extract measurements on the mean and standard deviation for each measurement
## Option A or B can be used, with different results -- comment accordingly
##
## Option A: does not include indirect measurements (e.g. -meanFreq(), etc.)
XMergeSub <- XMerge[,grep("-(mean|std)\\(\\)",features$fname)]

## Option B: includes indirect measurements
# XMergeSub <- XMerge[,grep("-(mean|std)",features$fname)]

## Name activities in column and label dataset

yMerge[,"aname"] <- activities[yMerge[,"aid"],"aname"]

labeledDataset <- cbind(XMergeSub,yMerge$aname,subjectMerge$subject)

## Create second, independent tidy data set with the average of each variable 
## for each activity and each subject; output as text file

tidyDataset <- aggregate(XMergeSub,list(subject=subjectMerge$subject, activity=yMerge$aname), mean)
write.table(tidyDataset, "tidy_dataset.txt", sep="\t", row.names = FALSE)