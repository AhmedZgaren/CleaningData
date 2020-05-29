---
title: "Cleaning Data"
output: html_notebook
---

Cleaning data project consist of creating a tidy data set from a text files. 

## Data & Variables
The data set consist a of experiments on a group of persons performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. the variable have been captured Using its embedded accelerometer and gyroscope,  3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The data set are constructed in a train and test file :

* X_train.txt : this file contains observation for training and have 561 variables
* X_test.txt  : this file contains observation for testing and have  561 variables
* Y_train.txt : this file contains the activities names for the training data
* Y_test.txt  : this file contains the activities names for the testing data
* activity_labels.txt : this file containes the activity label for the data set
* features.txt: this file contains the variable names for the data set
  
## Transformations

  1. Load train data
  2. Load test data
  3. Load variables names
  4. Merge the train and the test data into one data set
  5. Extracting the index of the measurment on the mean
  6. Extracting the index of the measurment on the std
  7. Subsetting the data based on variable from 5 and 6
  8. Loading the descriptive activity names for the test set
  9. Loading the descriptive activity names for the train set
  10. Merging the descriptive activity names and name the activities in the data set
  11. Loading the activity labels and labels the data set
  12. calculate the mean of each subject
  13. creating new dataset that have the average for each activity and each variable