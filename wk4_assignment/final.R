url4<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url=url4, destfile = "ds.zip", method = "curl")

# Gathering Data
df_train <- read.table("train//X_train.txt", header = TRUE)         # Training measurement
# dim(df_train) # [1] 7351  561
df_train_label<-read.table("train/y_train.txt", header = TRUE)       # Training label
# dim(df_train_label) # [1] 7351    1
subject_train <- read.table("train//subject_train.txt", header = TRUE) # Training subject
# dim(subject_train) # [1] 7351    1
df_test <- read.table("test/X_test.txt", header = TRUE)             # Test measurement
# dim(df_test) # [1] 2946  561
df_test_label<-read.table("test/y_test.txt", header = TRUE)          # Test label
# dim(df_test_label) # [1] 2947    1
subject_test <- read.table("test//subject_test.txt", header = TRUE)  # Test subject
# dim(subject_test) # [1] 2947    1
df_feature <- read.table("features.txt")               # activity 561
# dim(df_feature) # [1] 561   2
df_alabel <- read.table("activity_labels.txt") 

# Reshape jeffery breen reshaping data in r
# a quick primer on split apply combine problems
# acast - casting multi-deimensional arrary

# Touch up test data
names(df_test) <- df_feature$V2 # add measurement name as
names(subject_test) <- c('subject_number') # add subject number
names(df_test_label) <- c('activity_number') # update activity number
names(df_alabel) <- c('activity_number','activity_label') # add activity and label
df_test_act <- merge(df_test_label, df_alabel, by = 'activity_number') # merge subject and activity
df_test_wide <- cbind(c('test'),
                      subject_test, 
                      df_test_act, 
                      df_test) # tag data set, add subject and activity to data set
names(df_test_wide)[1] <- 'data_set' # add data set label

# Repeat the same for train data
names(df_train) <- df_feature$V2
names(subject_train) <- c('subject_number') 
names(df_train_label) <- c('activity_number')
df_train_act <- merge(df_train_label, df_alabel, by = 'activity_number')
df_train_wide <- cbind(c('train'), subject_train, df_train_act, df_train)
names(df_train_wide)[1] <- 'data_set'

# Merge both measurement into one
df_wide <- rbind(df_train_wide, df_test_wide)

# Extract mean() and std()
df_wide_ext <- cbind(df_wide[,1:4],
                     df_wide[,grep("mean[^a-zA-Z]|std",df_feature$V2,value=TRUE)])

#names(df_wide_ext) <- gsub("-","_",names(df_wide_ext))
library(data.table)
dwe <- data.table(df_wide_ext)
grouped <- group_by(df_wide_ext, data_set, subject_number, activity_number)
summerise(grouped, mean=mean('tBodyAcc-mean()-X'))
