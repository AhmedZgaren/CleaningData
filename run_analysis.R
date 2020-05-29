#This script performs the following tasks :
#   1 Merges the training and the test sets to create one data set.
#   2 Extracts only the measurements on the mean and standard deviation for each measurement.
#   3 Uses descriptive activity names to name the activities in the data set
#   4 Appropriately labels the data set with descriptive variable names.
#   5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Loading library
library(dplyr)
library(tidyr)
# Task 1

  #Load the test set 
test <- read.csv("data\\test\\X_test.txt", header = FALSE, sep = "")
subj_test <-read.csv("data\\test\\subject_test.txt", header = FALSE, sep = "")
test <- bind_cols(subj_test,test)
  #Load the train set
train <- read.csv("data\\train\\X_train.txt", header = FALSE, sep = "")
subj_train <-read.csv("data\\train\\subject_train.txt", header = FALSE, sep = "")
train <- bind_cols(subj_train, train)
  #Load the column names
ColN <- read.csv("data\\features.txt", header = FALSE, sep = "")
ColNames <- ColN$V2
ColNames <- c("subject", ColNames)
  #Merging test and train set
data1 <- bind_rows(test, train)
names(data1) <- ColNames

# Task 2

  # Extracting the index of the measurment on the mean
colmean <- grep('mean', names(data1))

  # Extracting the index of the measurment on the std
colstd <- grep('std', names(data1))

  # Subsetting the data
data2 <- bind_cols(data1[,colmean], data1[,colstd])

# Task 3
  # Loading the descriptive activity names for the test set
activtest = read.csv("data\\test\\Y_test.txt", header = FALSE, sep ="")

  # Loading the descriptive activity names for the train set
activtrain = read.csv("data\\train\\Y_train.txt", header = FALSE, sep ="")

  #Merging the descriptive activity names
activity <- bind_rows(activtest, activtrain)

  #Activity name on the dataset
data1 <- bind_cols(activity, data1)
names(data1)[1]<- "activity"

# Task 4
  #Loading theactivity labels
lab = read.csv("data\\activity_labels.txt", header = FALSE, sep = "")

  #labeling the data set adding new variable Act_label
for (num in lab$V1) { data1$Act_label[data1$activity == num] <- lab[num,2]}

# Task 5
  #Adding new column sub_avg for the mean of each subject

  
  #creating new dataset that have the average for each activity and each variable
new_data <- data1 %>% group_by(Act_label,subject) %>% summarize_if(is.numeric, mean)

write.table(new_data, 'tidy_data.txt', row.names = FALSE)
