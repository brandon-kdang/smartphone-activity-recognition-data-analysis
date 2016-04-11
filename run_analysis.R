run_analysis <- function() {
    # perform the following analysis
    # 1. Merges the training and the test sets to create one data set.
    # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    # 3. Uses descriptive activity names to name the activities in the data set
    # 4. Appropriately labels the data set with descriptive variable names.
    # 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    # preprequisite: the Samsung data must be in current working directory
    
    # read data
    xtest <- read.csv("test/x_test.txt", FALSE, sep = "")
    ytest <- read.csv("test/y_test.txt", FALSE, sep = "")
    subtest <- read.csv("test/subject_test.txt", FALSE, sep = "")
    xtrain <- read.csv("train/x_train.txt", FALSE, sep = "")
    ytrain <- read.csv("train/y_train.txt", FALSE, sep = "")
    subtrain <- read.csv("train/subject_train.txt", FALSE, sep = "")
    activity_labels <- read.csv("activity_labels.txt", FALSE, sep = "")
    features <- read.csv("features.txt", FALSE, sep = "")

    # 1. merges the training and the test sets to create one data set
    # y and sub are not merged to x yet so that intermediate steps are simpler
    # the actual one data set is done at step #4
    x <- rbind(xtrain, xtest)
    colnames(x) <- features[, 2]
    y <- rbind(ytrain, ytest)
    colnames(y) <- c("activity")
    sub <- rbind(subtrain, subtest)
    colnames(sub) <- c("subject")

    # 2. extracts only the measurements on the mean and standard deviation for each measurement
    # colIndexes <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)
    colIndexes <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ][, 1]
    x <- x[, colIndexes]
    
    # 3. Uses descriptive activity names to name the activities in the data set
    y <- merge(activity_labels, y)[2]
    colnames(y) <- c("activity")
    
    # 4. appropriately labels the data set with descriptive variable names
    # this step is already done
    # merging x, y and sub into one data setd
    data <- cbind(x, y, sub, row.names = NULL)
    
    # 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    aggr <- aggregate(data[1:(ncol(data)-2)], list(data$activity, data$subject), mean)
    colnames(aggr)[1] <- "activity"
    colnames(aggr)[2] <- "subject"
    aggr
}