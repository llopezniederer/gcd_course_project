
# Coursera "Getting and Cleaning Data" course project

## Source of Data Set

The source for the project´s data and metadata is:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

A full description of the data set is available at the site where the data was obtained from: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data set for the project can be downloaded from here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## R Script

After downloading and un-zipping the source file, a directory named 'UCI HAR Dataset' will contain the meta-data files, while two sub-directories named 'train' and 'test' will contain the training and test data-sets respectively.

In order to run the R script called 'run_analysis.R', first copy the script into the 'UCI HAR Dataset' directory; then, using R or R Studio, set the working directory to 'UCI HAR Dataset' and run the script as follows:

	source("run_analysis.R")

The script makes use of the 'dplyr' package; make sure the package is installed before attempting to run the script.

## Results

The 'run_analysis.R' script will process the meta-data and data-set files and produce a tidy summary data file named "tidy_mean.txt" in the 'UCI HAR Dataset' directory.

You can load the file into R or R Studio using the following command:

 tidy.mean <- read.csv("tidy_mean.txt", sep="", header=TRUE)

---





