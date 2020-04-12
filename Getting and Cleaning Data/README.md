# Getting and Cleaning Data Project

## Project Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
  1) a tidy data set as described below, 
  2) a link to a Github repository with your script for performing the analysis, and 
  3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Data

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## R Script Description

The R script called run_analysis.R does the following:

  1) Merges the training and the test sets to create one data set.
  2) Extracts only the measurements on the mean and standard deviation for each measurement.
  3) Uses descriptive activity names to name the activities in the data set
  4) Appropriately labels the data set with descriptive variable names.
  5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Other Notes

The zip file from the second link above needs to be downloaded and unpacked.

The code book can be found in the file CodeBook.md, which explains the transformations done to the data.

In addition, remember to set your working directory using the setwd() function to the location of the files, and then run source('run_analysis.R') to run the script and get the file tidy_data.txt.
