How do we get the tidy data set?
================================

Getting the names of the activities
-----------------------------------

The files _UCI HAR Dataset/test/y\_test.txt_ and _UCI HAR Dataset/train/y\_train.txt_ contain
the indices of the activities for each experiment for the test and the training data sets.
We read these files and merge them into a single vector.
The file _UCI HAR Dataset/activity\_labels.txt_ gives the type of activity corresponding to each index.
We read this file and format the names of the activities.
Then we replace in the activity vector the indices of the activities by their names.

Getting the indices of the subjects
-----------------------------------

The files _UCI HAR Dataset/test/subject\_test.txt_ and _UCI HAR Dataset/train/subject\_train.txt_
contain the indices of the subjects for each experiment for the test and the training data sets.
We read these files and merge them into a single vector.

Getting the values of the measurement variables
-----------------------------------------------

The files _UCI HAR Dataset/test/X\_test.txt_ and _UCI HAR Dataset/train/X\_train.txt_ contain
the values of the measurement variables for each experiment for the test and the training data sets.
We read these files and merge them into a single dataframe.
The file _UCI HAR Dataset/features.txt_ gives the measurement variable scorresponding to each column
of the dataframe.
We read this file and select only the measurement variables that correspond to a mean or a standard
deviation, that is:

- tBodyAcc\-mean\(\)\-X
- tBodyAcc\-mean\(\)\-Y
- tBodyAcc\-mean\(\)\-Z
- tBodyAcc\-std\(\)\-X
- tBodyAcc\-std\(\)\-Y
- tBodyAcc\-std\(\)\-Z
- tGravityAcc\-mean\(\)\-X
- tGravityAcc\-mean\(\)\-Y
- tGravityAcc\-mean\(\)\-Z
- tGravityAcc\-std\(\)\-X
- tGravityAcc\-std\(\)\-Y
- tGravityAcc\-std\(\)\-Z
- tBodyAccJerk\-mean\(\)\-X
- tBodyAccJerk\-mean\(\)\-Y
- tBodyAccJerk\-mean\(\)\-Z
- tBodyAccJerk\-std\(\)\-X
- tBodyAccJerk\-std\(\)\-Y
- tBodyAccJerk\-std\(\)\-Z
- tBodyGyro\-mean\(\)\-X
- tBodyGyro\-mean\(\)\-Y
- tBodyGyro\-mean\(\)\-Z
- tBodyGyro\-std\(\)\-X
- tBodyGyro\-std\(\)\-Y
- tBodyGyro\-std\(\)\-Z
- tBodyGyroJerk\-mean\(\)\-X
- tBodyGyroJerk\-mean\(\)\-Y
- tBodyGyroJerk\-mean\(\)\-Z
- tBodyGyroJerk\-std\(\)\-X
- tBodyGyroJerk\-std\(\)\-Y
- tBodyGyroJerk\-std\(\)\-Z
- tBodyAccMag\-mean\(\)
- tBodyAccMag\-std\(\)
- tGravityAccMag\-mean\(\)
- tGravityAccMag\-std\(\)
- tBodyAccJerkMag\-mean\(\)
- tBodyAccJerkMag\-std\(\)
- tBodyGyroMag\-mean\(\)
- tBodyGyroMag\-std\(\)
- tBodyGyroJerkMag\-mean\(\)
- tBodyGyroJerkMag\-std\(\)
- fBodyAcc\-mean\(\)\-X
- fBodyAcc\-mean\(\)\-Y
- fBodyAcc\-mean\(\)\-Z
- fBodyAcc\-std\(\)\-X
- fBodyAcc\-std\(\)\-Y
- fBodyAcc\-std\(\)\-Z
- fBodyAccJerk\-mean\(\)\-X
- fBodyAccJerk\-mean\(\)\-Y
- fBodyAccJerk\-mean\(\)\-Z
- fBodyAccJerk\-std\(\)\-X
- fBodyAccJerk\-std\(\)\-Y
- fBodyAccJerk\-std\(\)\-Z
- fBodyGyro\-mean\(\)\-X
- fBodyGyro\-mean\(\)\-Y
- fBodyGyro\-mean\(\)\-Z
- fBodyGyro\-std\(\)\-X
- fBodyGyro\-std\(\)\-Y
- fBodyGyro\-std\(\)\-Z
- fBodyAccMag\-mean\(\)
- fBodyAccMag\-std\(\)
- fBodyBodyAccJerkMag\-mean\(\)
- fBodyBodyAccJerkMag\-std\(\)
- fBodyBodyGyroMag\-mean\(\)
- fBodyBodyGyroMag\-std\(\)
- fBodyBodyGyroJerkMag\-mean\(\)
- fBodyBodyGyroJerkMag\-std\(\)

Then we keep in the dataframe only the columns corresponding to those measurement variables.

Getting the first data set
--------------------------

We merge the subject vector, the activity vector and the measurement dataframe to get a single data set.
We give the names _subject_ and _activity_ to the two first columns.
We format the names of the measurement variables to get the names of the last 66 columns.
We add the names of the rows.

Getting the second data set
---------------------------

For each subject and each activity, we want to compute the average of the measurement variables.
We will then have 180 observations corresponding to 6 activities and 30 subjects.

For each measurement variable, we apply the mean to the corresponding column of the dataframe for each combination of the levels of the factors _subject_ and _activity_.
We get a matrix of 30 rows (for the subjects) and 6 columns (for the activities).
We transform this matrix into a vector and add it to the dataframe.
We then add the names of the columns of the new dataframe.

Writing the tidy data set
-------------------------

We have now obtained a tidy data set.
We write it in the file _tidy\_data\_set.txt_.


