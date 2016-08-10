## Peer Graded Assignment: Getting and Cleaning Data Course Project - CodeBook
### Goal
1. Describes the variables.
2. Describes the data. 
3. Transformations or work to clean up the data.

### Variables
#### Training Data - Original
1. df_train - Training set.
2. df_train_label - Training label.
3. subject_train - Subject who performed the activity for each window sample.

#### Test Data  - Original
4. df_test - Test set.
5. df_test_label - Test labels.
6. subject_test - Subject who performed the activity for each window sample.


#### Labels - Transformed
7. df_feature - List all features.
8. df_act_label - Activity labels.
10. feature_extract - Extracted features containing mean and stardard deviation.

#### Data - Tranformed
11. df_test_act - Merged labels containing subject number and activity number.
12. df_train_act - Merged labels containing subject number and activity number.
13. df_train_wide - Train data with only extracted features, with labels.
14. df_test_wide - Test data with only extracted features, with labels.

#### Data - Reshaped
15. df_wide - complete test and train data.
16. melt_dt - melted dataset using melt function form library reshape2.
17. tidy_dt - tidy dataset using dcast function form library reshape2.
