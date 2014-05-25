# Task 1: Merging the test and training sets to create one data set

#Reading test Subject
testSubject <- read.table("subject_test.txt")
colnames(testSubject) <- c("Subject")
#Reading test Labels
testLabels <- read.table("y_test.txt")
colnames(testLabels) <- c("Label")
#Reading test data
testSet <- read.table("X_test.txt")
#Creating a single dataset for test
testData <- cbind(testSet,testSubject,testLabels)

#Reading train Subject
trainSubject <- read.table("subject_train.txt")
colnames(trainSubject) <- c("Subject")
#Reading train Labels
trainLabels <- read.table("y_train.txt")
colnames(trainLabels) <- c("Label")
#Reading train data
trainSet <- read.table("X_train.txt")
#Creating a single dataset for train
trainData <- cbind(trainSet,trainSubject,trainLabels)

#Creating a single dataset for test and train
testtrainData <- rbind(testData,trainData)

# Task 2: Extracting only the measurements on the mean and standard deviation for each measurement
#Reading features
features <- read.table("features.txt")
#Getting indexes for features related to mean()
meanFeature <- features[grepl( "mean()", features$V2, fixed=TRUE ),1]
#Getting indexes for features related to std()
stdFeature <- features[grepl( "std()", features$V2, fixed=TRUE ),1]
#Creating a single list of valid indexes
validFeature <- sort(c(meanFeature,stdFeature))
#Getting a valid dataset with information for valid features only
testtrainValidData <- testtrainData[,c(validFeature,562,563)]

# Task 3: Using descriptive activity names to name the activities in the data set
#Reading activity labels
labels <- read.table("activity_labels.txt")
colnames(labels) <- c("Label","Activity")

#Replacing Labels by Activity names
testtrainValidData2 <- merge(testtrainValidData,labels)
testtrainValidData2 <- testtrainValidData2[,c(2:69)]

# Task 4: Appropriately labels the data set with descriptive activity names.
#Getting the list of features for the valid indexes
features$V2 <- as.character(features$V2)
validFeatureNames<-features[validfeature,2]
#Replacing the names of features columns
colnames(testtrainValidData2) <- c(validFeatureNames,"Subject","Activity")

# Task 5: Creating tidy data
#Getting the list of factors to be used as measure variables
variables <- as.data.frame(names(testtrainValidData2))
variables <- as.character(variables[1:66,])
#Appliying melt to convert to long-format
library(reshape2)
testtrainValidData2Melt <- melt(testtrainValidData2,id=c("Activity","Subject"),measure.vars=variables)
#Appliying dcast to get the mean of each factor by activity and subject
tidyData <- dcast(testtrainValidData2Melt,Activity + Subject ~ variable,mean)
