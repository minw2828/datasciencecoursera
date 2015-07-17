# Data
- UCI HAR Dataset/train/X_train.txt:       Training set.
- UCI HAR Dataset/train/y_train.txt:       Training labels.
- UCI HAR Dataset/train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- UCI HAR Dataset/test/X_test.txt:         Test set.
- UCI HAR Dataset/test/y_test.txt:         Test labels.
- UCI HAR Dataset/test/subject_test.txt:   Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- UCI HAR Dataset/features.txt:            List of all features.
- UCI HAR Dataset/features_info.txt:       Shows information about the variables used on the feature vector.
- UCI HAR Dataset/activity_labels.txt:     Links the class labels with their activity name.

# Variables
train_data:    Training set.  
train_label:   Training labels.  
train_subject: Each row identifies the subject who performed the activity for each window sample.  
test_data:     Test set.  
test_label:    Test labels.  
test_subject:  Each row identifies the subject who performed the activity for each window sample.  
data:          Merged training set and test set.  
label:         Merged training labels and test labels.  
subject:       Merged training subjects and test subjects.  
feature:       List of all features.  
result:        Extracted measurements only on the mean and standard deviation for each measurement.  
activity:      Links the class labels with their activity name.  
all_data:      Merged all datasets, labels and subjects with appropriate descriptive variable names.  
averages_data: tidy data set with the average of each variable for each activity and each subject.  

# Transformations
1. download data from website 
2. unzip downloaded data
3. load targeted files into R
4. merge the training and test sets to create one data set row-by-row
5. merge the training and test labels to create one data set row-by-row
6. merge the training and test subjects to create one data set row-by-row
7. rename the column name of merged training and test data, by matching them with the second column of feature data 
8. select columns in merged training and test data which are named with "-mean()" or "-std()"
9. change label from numeric data to descriptive data, by matching them with activity data
10.chage the column name of label data to "activity"
11.chage the column name of subject data to "subject"
12.merge training and test sets, labels and subjects to create one data set column-by-column
13.load library "plyr" into R
15.calculate the average of each variable for each activity and each subject, and put it into variable "averages_data"
14.write variable "averages_data" into file "averages_data.txt"


