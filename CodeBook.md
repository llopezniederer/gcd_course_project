
# Coursera "Getting and Cleaning Data" course project

## Data transformations

The 'run_analysis.R' script performs the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script´s source code has detailed comments on each of the transformation steps it performs.

## Variable names

The project instructions call for selecting from the data-set files only those variables that contain 'mean()' or 'std()' as part of their names.

The original variable names can be found in the 'feature.txt' file.

The script transforms the original variable (feature) names to make then suitable for R conventions and good practices. in particular, it performs the following transformations on the names:

	* Substitutes all occurrences of "mean()" with "Mean"
	* Substitutes all occurrences of "std()" with "Std"
	* Removes all hyphens from the variable names
	* Replaces the "fBodyBody" variable name prefix with "fBody"

The resulting camel case variable names are easy to read and compatible with R.

## Tidy data set

The script performs the transformations on the data set listed above and produces a tidy data file containing the following columns:

	* subjectID	: contains the ID of the subject that produced the data
	* activityLabel	: the name of the activity being performed by the subject, one of {LAYING, SITTING, STANDING, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS}
	* 66 varibles from the original data set containing "Mean" or "Std" in their new names.

## Tidy data average

Finally, the script generates a tidy data file with the average of each of the 66 data variables summarized by 'subjectID' and 'activityLabel' and writes the result into the "tidy_mean.txt" file.

Since the original data set provides data for 30 different subjects and six activities, the summary file has 180 rows, as expected.








