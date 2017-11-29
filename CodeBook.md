# Introduction
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 

(1) a tidy data set as described below,

(2) a link to a Github repository with your script for performing the analysis, and

(3) a code book that describes the variables, the data, and any transformations or work that you performed to 
clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. 
This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

# Workflow of assignment
(1) Download dataset from 
<a>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

(2) Extract the zip file to current working dir - <b>UCI HAR Dataset</b>

(3) Run R script - <b>run_analysis.R</b>


## explanation of R script 

### Steps are named based on the instruction requirement.
  
 - preparation stage: load data into R environment; 

 - step 1: merge X, y, subject into one table
 
 - step 4: assign column (variable) names to the merged dataset
 
 - step 2: use *grep* to find variable name either with mean() or std(); 
 generate the new table (data_sub) with only selected columns

 - step 3: replace the activity column with descriptive names
 
 - step 5: used *TidyR* and *dplyr* to *gather* data from multiple variables into one column, 
 and use *summarize* to measure the average value with the same subject, activity and type/variable, 
 assign the new table to data_sub_2
 
 - output stage: output dataset (data_sub_2) using *write.table()*

### Feature in selection
All 79 features with "mean()" or "std()" in this name would be selected.

### Summarize outputs
The final table are outputed as a "long" table for better visibility.
