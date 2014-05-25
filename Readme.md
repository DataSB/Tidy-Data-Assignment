Assignment: Preparing a tidy data set

This project is to prepare tidy dataset that can be used for later analysis.  It contains data collected from the accelerometers from the Samsung Galaxy S smartphone available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The script to prepare the tidy dataset is saved in run_analysis.R. This is divided into four parts:
        
1. Preparing the data - contains the steps to download the file from the website, make sure the data file is in the working directory, and to unzip the file.

2. Read in the activity_labels.txt and the features.txt files 

3. Create the train and test datasets and merge them to one dataset to produce the full tidy dataset replacing each element in train dataset with corresponding feature label and each element in test dataset with corresponding activity label.

4.  Produce the tidy mean data set containing the mean of each variable for each activity and each subject
