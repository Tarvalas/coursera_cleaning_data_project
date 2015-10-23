library(plyr)
## Since unpacking the zipped files created this folder in the working
## directory, the working directory was changed to this folder
setwd("UCI HAR DATASET/")

## Reading raw tables from the files and storing them.
subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

## Changes features from factor to characters. Then stores these for
## use as column names.
column_names <- c("subject", "activity", as.character(features[, 2]))

## Combines the three data sets from the "test" group into one
## dataframe and the three data sets from the "train" group
## into another dataframe.
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)

## Combines the rows of "test" and "train" dataframes into one
## longer dataframe. Also changes the column names back to the
## variable names.
combined_raw <- rbind(test, train)
colnames(combined_raw) <- column_names

## Extracts columns containing "mean()" (the mean), "std()" 
## (the standard deviation), the subject, and the activity label.
mean <- combined_raw[, grep("mean()", column_names, value = T, fixed = T)]
std <- combined_raw[, grep("std()", column_names, value = T, fixed = T)]
subject_label <- combined_raw[, 1:2]

## Combines the previous columns into one tidy dataframe.
combined_tidy <- cbind(subject_label, mean, std)

## Replaces the numeric value of the activity with the description
## of the activity.
combined_tidy[, "activity"] <- 
        activity_labels[combined_tidy[, "activity"], 2]

## Makes a dataframe using the previous tidy dataset, displaying
## the averages for each variable, calculated by subject and
## activity label.
tidy_average <- ddply(combined_tidy, .(subject, activity), function(x) {colMeans(x[, 3:68])})

## Writes the dataframe as a text file.
write.table(tidy_average, "tidy_average.txt", row.name = F)