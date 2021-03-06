Coursera-GettingAndCleaningData-Project
=======================================
Project for the *Getting and Cleaning Data* course.

## Initial Setup Steps (Start here)
1. Download the .zip archive (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the current working directory in R.
2. Using Windows or Linux, unzip the archive (e.g. using WinZip, 7zip, or some other program). Extract to the current directory.
* You will now have a folder called "UCI HAR Dataset" in your directory.

## Analysis Steps (Next do this)
1. Source the R script (run_analysis.R). Make sure you are in the same directory as the unzipped data:
```R
source("run_analysis.R")
```
2. If the UCI HAR Dataset directory exists, then the code will write out a tidy_data.txt file containing the tidy data set. There are also other data frames which will be loaded into the global environment, representing the training and test data.
