## Assignment: Preparing a tidy dataset

# This project is to prepare tidy dataset that can be used for later analysis.
#       It contains data collected from the accelerometers from the 
#       Samsung Galaxy S smartphone.

## PART 1. Preparing the data

# Download file from the website
download.file <- FALSE

data.file <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
local.data.file <- './UCI_HAR_Dataset.zip'
local.data.dir <- './UCI_HAR_Dataset'
tidy.data.file <- './tidy_UCI_HAR_dataset.csv'
tidy.mean.data.file <- './tidy_UCI_HAR_mean_dataset.csv'

# Make sure the data file is in the working directory
if (! file.exists(local.data.file)) {
        if (download.file.automatically) {
                download.file(data.file,
                              destfile = local.data.file, method = 'curl')
        }
}

if (! file.exists(local.data.file)) {
        stop(paste(local.data.file, 'should be present in working directory.'))
}

# Unzip the original data file
if (! file.exists(local.data.dir)) {
        unzip(local.data.file)
}


## PART 2: Read in the the activity_labels.txt and features.txt file

activity <- read.table(paste(local.data.dir, 'activity_labels.txt', sep = '/'),
                           header = FALSE)
names(activity) <- c('id', 'name')

feature <- read.table(paste(local.data.dir, 'features.txt', sep = '/'),
                    header = FALSE)
names(feature) <- c('id', 'name')


## PART 3: Create the train and test datasets and merge them     

# Read in the X_train.txt file into a dataframe train.X
# Set the colnames of train.X to feature
# Read in the Y_train.txt file into a vector called train.Y
# Replace each element in train.Y with the corresponding activity
# stored in the feature vector
# Read in the subject_train.txt file into a dataframe called train.subject

train.X <- read.table(paste(local.data.dir, 'train', 'X_train.txt', sep = '/'),
                      header = FALSE)
names(train.X) <- feature$name
train.Y <- read.table(paste(local.data.dir, 'train', 'Y_train.txt', sep = '/'),
                      header = FALSE)
names(train.Y) <- c('activity')
train.subject <- read.table(paste(local.data.dir, 'train', 'subject_train.txt',
                                  sep = '/'),
                            header = FALSE)
names(train.subject) <- c('subject')

# Read in the X_test.txt file into a dataframe test.X
# Set the colnames of test.X to activity
# Read in the Y_test.txt file into a vector called test.Y
# Replace each element in test.Y with the corresponding activity
# stored in the activity vector
# Read in the subject_test.txt file into a dataframe called test.subject

test.X <- read.table(paste(local.data.dir, 'test', 'X_test.txt', sep = '/'),
                     header = FALSE)
names(test.X) <- feature$name
test.Y <- read.table(paste(local.data.dir, 'test', 'Y_test.txt', sep = '/'),
                     header = FALSE)
names(test.Y) <- c('activity')
test.subject <- read.table(paste(local.data.dir, 'test', 'subject_test.txt',
                                 sep = '/'),
                           header = FALSE)
names(test.subject) <- c('subject')

#Merge the training and test sets
X <- rbind(train.X, test.X)
y <- rbind(train.Y, test.Y)
subject <- rbind(train.subject, test.subject)

tidy.data.set <- cbind(subject, y, X)

# Save full tidy data set as csv file 
write.csv(tidy.data.set, tidy.data.file)


## PART 4: Produce the tidy mean dataset

# Extract just the mean and SD features
X <- X[, grep('mean|std', feature$name)]

# Convert activity labels to meaningful names
y$activity <- activity[y$activity,]$name

# Compute the means grouped by subject and activity
tidy.mean.data.set <- aggregate(tidy.data.set[, 3:dim(tidy.data.set)[2]],
                                list(tidy.data.set$subject,
                                     tidy.data.set$activity),
                                mean)
names(tidy.mean.data.set)[1:2] <- c('subject', 'activity')

# Save the tidy mean data set as csv file
write.csv(tidy.mean.data.set, tidy.mean.data.file)


