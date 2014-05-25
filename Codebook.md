THE DATA

The original data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The code for the activities is in the file activity_labels.txt in the original dataset.
The dataset contains 10299 observations of 561 measurements derived from the raw measurements.
The dataset is divided into 2 groups: "training" data and "test" data. Data files for each group are in similarly named subdirectories, train and test respectively.

THE TASK

Perform the following steps and save in a file named run_analysis.R:
        
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.??
3. Use descriptive activity names to name the activities in the data set
4. Label the dataset with descriptive activity names.??
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.??

THE PROCESS

The process of getting the tidy data set is divided into four steps:
1. Preparing the data 
- Download the file from the website
- Check if data file is in the working directory
- Unzip the file.

2. Read in the activity_labels.txt and the features.txt files 

3. Create the train and test datasets and merge them to one dataset.  This is composed of series of steps: 

3.1 To create train dataset:
- Read in the X_train.txt file into a dataframe train.X
- Set the colnames of train.X to feature labels
- Read in the Y_train.txt file into a vector called train.Y
- Replace each element in train.Y with the corresponding activity stored in the feature vector
- Read in the subject_train.txt file into a dataframe called train.subject
        
3.2 To create test dataset:
- Read in the X_test.txt file into a dataframe test.X
- Set the colnames of test.X to activity
- Read in the Y_test.txt file into a vector called test.Y
- Replace each element in test.Y with the corresponding activity
stored in the activity vector
- Read in the subject_test.txt file into a dataframe called test.subject

3.3 #Merge the training and test sets
3.4 # Save full tidy data set as csv file 

4. Produce the tidy mean dataset
- Extract just the mean and SD features
- Convert activity labels to meaningful names
- Compute the means grouped by subject and activity
- Save the tidy mean data set as csv file

THE OUTPUT

The tidy dataset produced by run_analysis.R contains the following:
        
subject - identifier of the participants

activity - name of the activity corresponding to the activity labels

79 measurement variables - means grouped by subject and activity

Out of the 561 original variables, only those containing mean and standard deviation are present, namely:
        
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag-meanFreq()
