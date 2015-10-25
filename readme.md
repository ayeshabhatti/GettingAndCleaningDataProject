---
title: "readme"
author: "Getting and cleaning data student"
date: "24 October 2015"
output: html_document
---

This work is done to fullfill the requirement of Getting and Cleaning Data Course Project. Assignment was to work with the following data set.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The goal of assignment was to write a R script that does the follwoing

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The assignment solution contains following three file. 

1.  tidydata.txt
2.  run_analysis.R
3.  codebook.md


tidydata.txt contains the resultant tidy dataset. The run_analysis.R contains the R code that tranforms the given data into the tidy data. codebook.md contains the variable names and steps that are involved in preocessing raw data into tidy data.  

Important!
It is important to note that both run_analysis.R and  original data need to be present in working directory. run_analysis.R code also needs "plyr" package.  