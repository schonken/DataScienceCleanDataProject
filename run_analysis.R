require(plyr)
require(data.table)

# Create some helper variables
widths <- array(16, 128)
testString <- array('TEST', 2947)
trainString <- array('TRAIN', 7352)
testCol <- data.frame(group=testString)
trainCol <- data.frame(group=trainString)
activity_labels  <- read.csv('UCI HAR Dataset/activity_labels.txt', sep=" ", header=FALSE)

# Read from CSV if the respective variables does not exist
if(!exists("subject_test"))     {subject_test     <- read.fwf('UCI HAR Dataset/test/subject_test.txt', c(2))}
if(!exists("X_test"))           {X_test           <- read.fwf('UCI HAR Dataset/test/X_test.txt', widths)}
if(!exists("y_test"))           {y_test           <- read.fwf('UCI HAR Dataset/test/y_test.txt', c(2))}
if(!exists("subject_train"))    {subject_train    <- read.fwf('UCI HAR Dataset/train/subject_train.txt', c(2))}
if(!exists("X_train"))          {X_train          <- read.fwf('UCI HAR Dataset/train/X_train.txt', widths)}
if(!exists("y_train"))          {y_train          <- read.fwf('UCI HAR Dataset/train/y_train.txt', c(2))}

# Set descriptive column names
colnames(activity_labels)[1] <- 'activity'
colnames(activity_labels)[2] <- 'activity_label'
colnames(subject_test)[1] <- 'subject'
colnames(y_test)[1] <- 'activity'
colnames(subject_train)[1] <- 'subject'
colnames(y_train)[1] <- 'activity'

# Join activity data frames with lables  
activity_test <- join(y_test, activity_labels, by='activity')
activity_train <- join(y_train, activity_labels, by='activity')

# Calculate mean and standard deviation
X_test_sum <- data.frame(measurement_mean=rowMeans(X_test), measurement_sd=apply(X_test, 1, sd))
X_train_sum <- data.frame(measurement_mean=rowMeans(X_train), measurement_sd=apply(X_train, 1, sd))

# Create test and train data measurement summary frames
test <- data.frame(subject_test, activity_test, testCol, X_test_sum)
train <- data.frame(subject_train, activity_train, trainCol, X_train_sum)

# Create ordered union of test and train data
summaryMeasurement <- rbind(train, test)
summaryMeasurement <- summaryMeasurement[order(summaryMeasurement$subject, summaryMeasurement$activity),]

# Create summary per subject and activity combination
tempDataTable <- data.table(summaryMeasurement)
tempDataTable <- tempDataTable[, list(measurement_mean=mean(measurement_mean), measurement_sd=mean(measurement_sd)), by=list(subject, activity, activity_label, group)]
summarySubjectActivity <- data.frame(tempDataTable)

# Clean Up
rm(widths)
rm(testString)
rm(trainString)
rm(activity_labels)
rm(activity_test)
rm(activity_train)
rm(X_test_sum)
rm(X_train_sum)
rm(tempDataTable)
rm(trainCol)
rm(testCol)
rm(train)
rm(test)

# Write data frames to CSV
write.csv(summaryMeasurement, 'UCI-HAR-Summary-per-Measurement.csv', row.names=FALSE)
write.csv(summarySubjectActivity, 'UCI-HAR-Summary-per-Subject-and-Activity-combination.csv', row.names=FALSE)

# Log a bit of detail to console
cat('\n')
cat('Summary per Measurement (Top 10)\n')
cat('========================================================================\n')
print(head(summaryMeasurement, n=10))
cat('\n')
cat('Summary per Subject and Activity combination (Top 10)\n')
cat('============================================================================\n')
print(head(summarySubjectActivity, n=10))