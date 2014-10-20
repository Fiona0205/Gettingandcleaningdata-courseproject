## Requirements:
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard 
##deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy data 
##set with the average of each variable for each activity and each subject.




## 1.Merges the training and the test sets to create one data set.
## Read text and train file into R.
xTrain <- read.csv("./UCI HAR Dataset/train/X_train.txt", 
                   sep="", header=FALSE)
yTrain <- read.csv("./UCI HAR Dataset/train/y_train.txt", 
                   sep="", header=FALSE)
xTest <- read.csv("./UCI HAR Dataset/test/X_test.txt", 
                  sep="", header=FALSE)
yTest <- read.csv("./UCI HAR Dataset/test/y_test.txt", 
                  sep="", header=FALSE)
## Combine training sets and test sets into one data frame. 
allSet <- cbind(rbind(xTrain, xTest), rbind(yTrain, yTest))





## 2.Extracts only the measurements on the mean and standard 
##deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## Extract mean and standard deviation from matrix.
## Load variable names.
features <- read.table("./UCI HAR Dataset/features.txt",
                       stringsAsFactors=FALSE)[,2]
## Appropriately labels the data set with descriptive 
##variable names.
colnames(allSet) <- c(features, "activity_ID")
## Extract mean and standard deviation for each measurement. 
meanstd_features <- grepl("mean|std", features)
meanstd_data <- allSet[, meanstd_features]
## Uses descriptive activity names to name the activities in the 
##data set.
## Load activity labels.
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                              stringsAsFactors=FALSE)
colnames(activity_labels) <- c("ID", "activity_Names")
## Load subject id
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            stringsAsFactors=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           stringsAsFactors=FALSE)
## Combine subject id with data set into a new data frame
newdata <- cbind(meanstd_data, rbind(subject_train, subject_test))
names(newdata)[81] <- "subject"
## Uses descriptive activity names to name the activities
meanstd_name <- merge(newdata, activity_labels, 
                      by.x = "activity_ID", by.y = "ID", all = TRUE)





## 5.From the data set in step 4, creates a second, independent tidy data 
##set with the average of each variable for each activity and each subject.

melt <- melt(meanstd_name, id = c("subject", "activity_ID", "activity_Names"), 
     measure.vars = c(2:80))
tidyData <- dcast(melt, subject + activity_Names ~ variable, mean) 
write.table(tidyData, file = "./tidydata.txt", row.name=FALSE)

