# README file for Getting and Cleaning Data Course Project


## R program run_analysis.R


This program requires the data files to be saved in the working directory


This program requires
library(plyr)
library(dplyr)


This program requires the following input files:
subject_test.txt - contains subject numbers from test group
X_test.txt - contains activity data from test group
Y_test.txt - contains samsung data from test group
Subject_train.txt - contains subject numbers from training group
X_train.txt - contains activity data from training group
T_train.txy - contains samsung data from training group


The program 
- reads the 6 txt files into data frames: subjTest, subjTrain, xtest, xtrain, ytest, ytrain

- selects only the columns relevant for the analysis (mean and std data) from xtest and xtrain 
- resulting in dataframes xtest2 and xtrain2

- combines the subject number files from the test and training group (subjTest and SunjTrain)

- combines the activity data from the test and training group (ytest and ytrain)

- combines the samsung data from the test and training group (xtest2 and ytest2)

- renames the default variable names into descriptive variable names. 
- This results in one dataframe per activity

- Merges the 6 dataframes for each activity into 1 dataframe

- Creates a new dataframe that calculates the mean of the measurments for each variable per subject/ activity combination

- Writes this dataframe to text file samsung.txt



