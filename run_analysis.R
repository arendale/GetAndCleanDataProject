### I am Part 1 ###
## Assume the dataset folder is already in your working directory safe and sound.  
testSub <- read.table("UCI HAR Dataset/test/subject_test.txt")
testAct <- read.table("UCI HAR Dataset/test/y_test.txt")
testSet <- read.table("UCI HAR Dataset/test/X_test.txt")
trainSub <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainAct <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSet <- read.table("UCI HAR Dataset/train/X_train.txt")
## Subjects and Activities are added to the end of test and training data frame respectively as new columns.
testSet <- cbind(testSet, testSub, testAct)
trainSet <- cbind(trainSet, trainSub, trainAct)
## test data set and training data set are merged.
totalSet <- rbind(testSet, trainSet)
colnames(totalSet)[ncol(totalSet)-1] <- "subject"
colnames(totalSet)[ncol(totalSet)] <- "activity"

### I am Part 2 ### 
names <- read.table("UCI HAR Dataset/features.txt")
IdxOfMeanAndStd <- grep("mean|std",names[,2])
MeanAndStdSet <- totalSet[,IdxOfMeanAndStd]

### I am Part 3 ###
actLabel <- read.table("UCI HAR Dataset/activity_labels.txt")
totalSet$activity <- actLabel[totalSet$activity, 2]

### I am Part 4 ###
colnames(MeanAndStdSet) <- tolower(gsub("-|\\(\\)","",names[IdxOfMeanAndStd,2]))

### I am Part 5 ###
#MeanAndStdSet <- cbind(MeanAndStdSet, "subject"=totalSet$subject, "activity"=totalSet$activity)
groupBySubAndAct <- split(MeanAndStdSet,list(totalSet$subject,totalSet$activity))
tidyData <- as.data.frame(sapply(groupBySubAndAct, function(x) apply(x, 2, mean)))
colnames(tidyData) <- tolower(gsub("_|\\.","",colnames(tidyData)))
write.table(tidyData, file = "tidyData.txt", sep = " ")