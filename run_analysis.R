# Getting and Cleaning Data Course Project
# 25-Jan-2015
# Author: LLN

# Load the dplyr library
library(dplyr)

print("Working...")

# Read "activity_labels.txt" from the current directory
activity.labels <- read.csv("activity_labels.txt", sep="", header=FALSE)

# Read "features.txt" from the current directory
features <- read.csv("features.txt", sep="", header=FALSE)

# Select (filter) the variable names containing "mean()" or "std()"
idx <- filter(features, grepl("mean()", features$V2, fixed=TRUE) |
                        grepl("std()",  features$V2, fixed=TRUE))

# Obtain the column numbers of variables (features)
# to select from the training and test data sets
cnums <- idx[ , 1]

# Get the names for the corresponding variables
cnames <- as.character(idx[ , 2])

# Convert the variable names to R conventions and good practices
# (1) Replace all occurrences of "-mean()" with "Mean"
cnames <- sub("-mean()", "Mean", cnames, fixed=TRUE)

# (2) Replace all occurrences of "-std()" with "Std"
cnames <- sub("-std()", "Std", cnames, fixed=TRUE)

# (3) Remove all remaining hyphens "-"
cnames <- sub("-", "", cnames, fixed=TRUE)

# (4) Replace "fBodyBody" prefix with "fBody"
cnames <- sub("fBodyBody", "fBody", cnames, fixed=TRUE)

# Training data
# Read the training data, the activity labels, 
# and the corresponding subject IDs from the "train" sub-directory
x.train.all   <- read.csv("train/x_train.txt", sep="", header=FALSE)
y.train       <- read.csv("train/y_train.txt", sep="", header=FALSE)
subject.train <- read.csv("train/subject_train.txt", sep="", header=FALSE)

# Test data
# Read the test data, the activity labels, 
# and the corresponding subject IDs from the "test" sub-directory
x.test.all   <- read.csv("test/x_test.txt", sep="", header=FALSE)
y.test       <- read.csv("test/y_test.txt", sep="", header=FALSE)
subject.test <- read.csv("test/subject_test.txt", sep="", header=FALSE)

# Merge the training and test data into 'x.data.all'
x.data.all <- rbind(x.train.all, x.test.all)
rm(x.train.all, x.test.all)

# Merge the training and test activity labels into 'y.data'
y.data <- rbind(y.train, y.test)
rm(y.train, y.test)

# Merge the training and test subject IDs into 'subject.data'
subject.data <- rbind(subject.train, subject.test)
rm(subject.train, subject.test)

# From 'x.data.all' select only the columns with variables we care about,
# i.e., the columns indexed by 'cnums'
x.data <- x.data.all[ , cnums]
rm(x.data.all)

# Assign the variable names in 'cnames' to the 'x.data' columns
names(x.data) <- cnames

# Label the single 'subject.data' column as "subjectID"
names(subject.data) <- "subjectID"

# Add a column to 'y.data' named 'activityLabel' with the activity name
# corresponding to each activity number
y.data$activityLabel <- as.character(activity.labels$V2[y.data$V1])

# Drop the activity number column from 'y.data'
y.data <- y.data[ , 2, drop=FALSE]

# Column-bind the subject IDs, the activity labels and the training data 
# to produce 'tidy.data'
tidy.data <- cbind(subject.data, y.data, x.data)
rm(subject.data, y.data, x.data)

# Group by subjectID and activityLabel
# and calculate the mean of all remaining variables
tidy.mean <- summarise_each(group_by(tidy.data, subjectID, activityLabel), funs(mean))

# Write the resulting data frame to disk as a text file 
write.table(tidy.mean, file = "tidy_mean.txt", row.name = FALSE)
print("Done! The file 'tidy_mean.txt' contains the results")

# The end
