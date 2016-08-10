## Peer Graded Assignment: Getting and Cleaning Data Course Project
### Goal
#### The script does the following:
##### Merges the training and the test sets to create one data set.
##### Extracts the measurements on the mean and standard deviation for each measurement.
##### Appropriately labels the data set with descriptive activity names.
##### Creates a second, independent tidy data set with the average of each variable for each activity and each subject called tidydata.txt

### Instructions
#### 1. Download the dataset.
```
url4<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url=url4, destfile = "ds.zip", method = "curl")
```
#### 2. Open R Studio and set working directory on "UCI HAR Dataset"
```
setwd "/Users/foo/Downloads/UCI HAR Dataset"
getwd()
```
#### 3. Source run_analysis.R
```
source("run_analysis.R")
```