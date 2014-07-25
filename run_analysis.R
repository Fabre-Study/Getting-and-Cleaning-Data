############################################################################
## Getting and Cleaning Data

####################
## Folder
my.folder <- paste(getwd(), '/', sep='')

####################
## 1 - Merges the training and the test sets to create one data set.
## read Activity and Features
my.activity <- read.table(paste(my.folder,'activity_labels.txt', sep=''))
names(my.activity) <- c('activity id','activity')
my.features <- read.table(paste(my.folder,'features.txt', sep=''))

## read Subject (training and test sets)
my.train.subject <- read.table(paste(my.folder,'train/subject_train.txt', sep=''))
my.test.subject <- read.table(paste(my.folder,'test/subject_test.txt', sep=''))

## read Human Activity Collected Data (training and test sets)
my.train.X <- read.table(paste(my.folder,'train/X_train.txt', sep=''))
my.test.X <- read.table(paste(my.folder,'test/X_test.txt', sep=''))

## read Activity Collected Data (training and test sets)
my.train.Y <- read.table(paste(my.folder,'train/Y_train.txt', sep=''))
my.test.Y <- read.table(paste(my.folder,'test/Y_test.txt', sep=''))

## data set - Subject
my.subject <- rbind(my.train.subject, my.test.subject)
names(my.subject) <- c('subject')

## data set - Human Activity Collected Data
my.data.X <- rbind(my.train.X, my.test.X)
names(my.data.X) <- my.features$V2

## data set - Activity Collected Data
my.data.Y <- rbind(my.train.Y, my.test.Y)
names(my.data.Y) <- c('activity')

## data set for this part of this assessment - final Data Set will be created below
my.tidy.result <- cbind(my.data.Y, my.subject, my.data.X)

####################
## 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
## final result for features with 'mean' or 'std' - considering meanFreq() too
my.final.features <- grep('-mean|-std', my.features[,2])
my.data.X <- my.data.X[,my.final.features]

####################
## 3 - Uses descriptive activity names to name the activities in the data set.
## 4 - Appropriately labels the data set with descriptive variable names.
## names of the labels were solved in the previous steps
my.data.Y[,1] <- my.activity[my.data.Y[,1],2]
my.tidy.result <- cbind(my.data.Y, my.subject, my.data.X)

####################
## 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
my.tidy.aggr.result <- aggregate(my.tidy.result[,3:dim(my.tidy.result)[2]],
                                 list(my.tidy.result$subject,
                                      my.tidy.result$activity),
                                 mean)
names(my.tidy.aggr.result)[1:2] <- c('subject','activity')

####################
## write the final data set
write.table (my.tidy.result, file=paste(my.folder,'tidy_data.txt'))
## Write the final data set - Step 5
write.table (my.tidy.aggr.result, file=paste(my.folder,'tidy_aggr_data.txt'))

############################################################################
