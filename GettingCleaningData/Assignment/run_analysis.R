# Read the indices of the activities for the test and the training data sets and merge them

activity_test <- read.table("UCI HAR Dataset\\test\\y_test.txt")
activity_train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
activity <- rbind(activity_test, activity_train)

# Find the corresponding names of the activities
activity_table <- read.table("UCI HAR Dataset\\activity_labels.txt", sep=" ")
activity_index = activity_table[,1]
activity_name = activity_table[,2]
activity_name <- sub("_", "", activity_name)
activity_name <- tolower(activity_name)
activity_nb <- length(activity_index)

# Replace the indices of the activities by their names
for (i in 1:activity_nb){
        activity[activity==activity_index[i]] <- activity_name[i]
}

# Read the indices of the subjects for the test and the training data sets and merge them

subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
subject <- rbind(subject_test, subject_train)

# Read the values of the measurement variables for the test and the training data sets and merge them

measure_test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
measure_train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
measure <- rbind(measure_test, measure_train)

# Find the indices of the measurement variables that we want to keep
# (that is those corresponding to the mean or to the standard deviation)

features <- read.table("UCI HAR Dataset\\features.txt", sep=" ")
index_features <- features[,1]
type_variable <- features[,2]
keep_variable <- grep("(mean|std)\\()", type_variable)

# Keep only the means and the standard deviations

measure_keep <- measure[,keep_variable]

# Merge the data with the corresponding activities and subjects

data <- cbind(subject, activity, measure_keep)

# Add the names of the two first columns

names(data)[1] <- "subject"
names(data)[2] <- "activity"

# Read the names of the measurement variables
features_table <- read.table("UCI HAR Dataset\\features.txt", sep=" ")
features_name = features_table[keep_variable, 2]
features_name <- gsub("-", "", features_name)
features_name <- gsub("\\()", "", features_name)
features_name <- tolower(features_name)
features_nb <- length(features_name)

# Add the names of the corresponding columns

names(data)[3:(features_nb + 2)] <- features_name

# Add the names of the rows
nb_rows <- dim(data)[1]
rownames(data) <- c(1:nb_rows)

# Creating a tidy data set

subject <- rep(1:30, each=activity_nb)
activity <- rep(sort(activity_name), times=30)

data2 <- data.frame(subject, activity)

# Compute the average for each measurement variable and add it to the data set
for(i in 1:features_nb){
        temp <- tapply(data[,i + 2], list(data[,1], data[,2]), mean)
        temp <- c(t(temp))
        data2 <- cbind(data2, temp)
}

names(data2)[3:(features_nb + 2)] <- features_name

write.table(data2, file="tidy_data_set.txt")


