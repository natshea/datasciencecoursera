### load test data
subject_test <- read.csv('/UCI HAR Dataset/test/subject_test.txt', 
                         sep = "", header = FALSE)
X_test <- read.csv('/UCI HAR Dataset/test/X_test.txt', 
                   sep = "", header = FALSE)
y_test <- read.csv('/UCI HAR Dataset/test/Y_test.txt', 
                   sep = "", header = FALSE)

colnames(subject_test) <- 'subject'
colnames(y_test) <- 'y'

test <- cbind(X_test, y_test, subject_test)

### load training data
subject_train <- read.csv('/UCI HAR Dataset/train/subject_train.txt', 
                         sep = "", header = FALSE)
X_train <- read.csv('/UCI HAR Dataset/train/X_train.txt', 
                   sep = "", header = FALSE)
y_train <- read.csv('/UCI HAR Dataset/train/Y_train.txt', 
                   sep = "", header = FALSE)

colnames(subject_train) <- 'subject'
colnames(y_train) <- 'y'

train <- cbind(X_train, y_train, subject_train)

### load activity labels, features
act_labels <- read.csv('/UCI HAR Dataset/activity_labels.txt', 
                       sep = "", header = FALSE)

features <- read.csv('/UCI HAR Dataset/features.txt', 
                     sep = "", header = FALSE)

########################

# 1) Merges the training and the test sets to create one data set.

dat <- rbind(test, train)

# 2-4) Extracts only the measurements on the mean and standard deviation for each measurement.
     # Uses descriptive activity names to name the activities in the data set
     # Appropriately labels the data set with descriptive variable names.

### get index of relevant columns
cols <- sort(c(grep('mean', features[,2]), 
              grep('std', features[,2])))

### subset data for relevant columns and rename them
dat1 <- dat[,cols]
colnames(dat1) <- features[cols,2]

### add in y and subject columns
dat2 <- cbind(dat1, dat[,c('y', 'subject')])

### rename activity labels table
colnames(act_labels) <- c('subject', 'activity')

### add in activity
dat3 <- dat2 %>% left_join(act_labels, by = 'subject')


# 5) From the data set in step 4, creates a second, independent tidy data set with the average 
   # of each variable for each activity and each subject.

dat4 <- aggregate(dat3, list(act = dat3$activity, sbj = dat3$subject), mean)
dat4$activity <- NULL
dat4$subject <- NULL

write.table(dat4, "tidy_data.txt", sep="\t", row.names=FALSE)