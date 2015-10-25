# coursera_cleaning_data_project

## Introduction

The script, run_analysis.R was created as the course project for the Coursera course, "Getting and cleaning Data". It is a program that takes the raw dataset, makes it tidy, and provides averages of some variables. The raw data was collected from accelerometers in Samsung Galaxy smartphones as part of a study. The raw data was provided by the instructor through the link, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip as well as a link to the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Contents

This repository contains:
        
        * The script, "run_analysis.R"
        * The README, "README.md"
        * The codebook, "codebook.md"
        * The tidy dataset, "tidy_average.txt"
        
        
## Installation and Running

In order for this program to run, the user must already have the "plyr" package installed. When installing and extracting the raw data from the zip file provided above, a folder should automatically be created in the working directory called "UCI HAR DATASET". If it does not install in this manner, the user needs to make sure that the files and folders contained within the zip file are placed in a folder called "UCI HAR DATASET" which is contained within the working directory. When the user runs run_analysis.R, the script will automatically change the working directory to the folder, "UCI HAR DATASET", where the raw data is contained.


## Script Summary

Running the script, run_analysis.R, does the following:

        1. Changes the working directory to the folder "UCI HAR DATASET".
        2. Reads the raw dataframes and stores them.
        3. Changes the class of the column names from factors to characters and stores
           them for later use as column names.
        4. Combines multiple dataframes into one large dataframe.
        5. Replaces column names with descriptive variable names.
        6. Extracts columns containing mean and standard deviation, 
           as well as the subject and activity label columns and stores them in
           a new dataframe.
        7. Replaces the numeric value of the activity label with a description
           of the activity.
        8. Uses the tidy data set to calculate the averages of the mean and
           standard deviation variables by subject by activity level and stores
           them in a new dataframe.
        9. Writes the dataframe as a table stored as the text file,                              "tidy_average.txt".
        
In order for the user to view the clean table, they must read.table the 
"tidy_average.txt" file.

## Authors


### Script Author
        
        James Dwyer
        

### Raw data/Study authors

        Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto and Xavier          Parra