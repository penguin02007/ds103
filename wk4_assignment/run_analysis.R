install.packages('data.table')
install.packages('reshape2')
library(data.table)
library(reshape2)

# Gather Data
df_train      <- read.table("train//X_train.txt", header = TRUE)         # Training measurement
df_train_label<- read.table("train/y_train.txt", header = TRUE)          # Training label
subject_train <- read.table("train//subject_train.txt", header = TRUE)   # Training subject

df_test       <- read.table("test/X_test.txt", header = TRUE)             # Test measurement
df_test_label <- read.table("test/y_test.txt", header = TRUE)             # Test label
subject_test  <- read.table("test//subject_test.txt", header = TRUE)      # Test subject

df_feature    <- read.table("features.txt")[,2]
df_act_label  <- read.table("activity_labels.txt") 

# Touch up test data
names(df_test) <- df_feature                                                # add measurement name
names(subject_test) <- c('subject_number')                                  # add subject number
names(df_test_label) <- c('activity_number')                                # update activity number
names(df_act_label) <- c('activity_number','activity_label')                # add activity label
df_test_act <- merge( df_test_label, df_act_label, by = 'activity_number' ) # merge subject and activity

feature_extract <- grepl("mean[^a-zA-Z]|std", df_feature)                   # Extract mean and std
df_test <- df_test[,feature_extract]

df_test_wide <- cbind( subject_test, 
                       df_test_act, 
                       as.data.table(df_test)
                      )                                                     # add subject and activity to data set

# Repeat the same for train data
names(df_train) <- df_feature
names(subject_train) <- c('subject_number') 
names(df_train_label) <- c('activity_number')
df_train_act <- merge(df_train_label, df_act_label, by = 'activity_number')

df_train <- df_train[,feature_extract]
df_train_wide <- cbind( subject_train,
                        df_train_act,
                        as.data.table(df_train)
                      )

df_wide <- rbind(df_train_wide,df_test_wide)     # Bind both measurement into one

# Putting all together
dt <- data.table(df_wide)
id_labels <- names(dt)[1:3]
measure_labels <- setdiff(colnames(dt), id_labels)
melt_dt = melt(dt, id.vars = id_labels, measure.vars = measure_labels)
tidy_dt = dcast(melt_dt, subject_number + activity_label ~ variable, mean)  # Get mean on all measurements
write.table(tidy_dt, file = "tidydata.txt")
