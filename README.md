Peer Review Project for Getting and Cleaning Data
=================================================

## Parameters for the project

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
> 
> One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
> 
> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
> 
> Here are the data for the project: 
> 
> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
> 
> You should create one R script called run_analysis.R that does the following. 
> 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement.
> 3. Uses descriptive activity names to name the activities in the data set.
> 4. Appropriately labels the data set with descriptive activity names.
> 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
> 
> Good luck!


## Data

The "Human Activity Recognition Using Smartphones" data set has been taken from [UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The actual data archive used for this project was downloaded from the Coursera class [CDN](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


## Steps to reproduce this project

1. The R script assumes an empty working directory, with no data files. If the data folder already exists, simply comment out the first three lines of code (these instructions also exist in the script) which download and unzip the archived files.

2. Since the dataset contains means and standard deviations calculated on both direct and indirect data (see CodeBook.md for more information), the R script can me modified to include or exclude the indirect data (see lines 28-35 of run_analysis.R). The script excludes the indirect data by default.

3. Run the run_analysis.R script. It is self-contained and requires no user input.


## Output files produced by this project

A tab-delimited text file named "tidy_dataset.txt" will be created in the working directory.