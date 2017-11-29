# Week 4 assignment 
#rm(list=ls())
library(dplyr)
library(tidyr)


file_name = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('W4-Assign-data.zip')){
  download.file(file_name,destfile = 'W4-Assign-data.zip')
}

if (!file.exists('UCI HAR Dataset/')){
  unzip('W4-Assign-data.zip')  
}

# import data
data_train_x = read.table(file = 'UCI HAR Dataset/train/X_train.txt', header = F)
data_train_y = read.table(file = 'UCI HAR Dataset/train/y_train.txt', header = F)
data_test_x = read.table(file = 'UCI HAR Dataset/test/X_test.txt', header = F)
data_test_y = read.table(file = 'UCI HAR Dataset/test/y_test.txt', header = F)
data_X <- rbind(data_train_x, data_test_x)
data_y <- rbind(data_train_y, data_test_y)

# subject:
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
subject_test <-  read.table('UCI HAR Dataset/test/subject_test.txt')
subject_all <- rbind(subject_train, subject_test)

# feature and label name
feature <-  read.table(file = 'UCI HAR Dataset/features.txt', header = F, sep=" ")
activity <- read.table(file = 'UCI HAR Dataset/activity_labels.txt', header = F, sep = " ")

##### Begin #####
# step-1 : merge train and test dataset
data <- cbind(subject_all, data_y, data_X)

# step-4 : labels the data set with descriptive variable names
colnames(data) <- c("subject", "activity", as.matrix(feature[,2]))

# step-2 : mean & std measurements
used_feat <- c(grep("mean()", colnames(data)), grep("std()", colnames(data)))
data_sub <- data[,c(1,2,used_feat)]

# step-3 : activity names
label_activity <- sapply(data_y, function(x) activity[x,2])
data_sub[,2] <- label_activity

# step-4 : labels the data set with descriptive variable names
# Done before
head(data_sub,n=3)

# step-5 : create a second, independent tidy data set 
# with the average of each variable for each activity and each subject
data_sub_2 <- data_sub %>% gather(type, value, -(1:2)) %>% group_by(subject, activity, type) %>% summarize(average = mean(value))
write.table(data_sub_2,"Week4-assignment-table.txt", sep="\t")
