CodeBook for analysis result of the Smartphone Activity Recognition data

The analysis dataset is derived from the original dataset by combining test and train dataset into one, extract only the mean and standard deviation columns, and then derive the average for each variable for each activity for each subject. All columns use the same name and units as in the original dataset, except for two new columns that have been added as following:

activity: indicates the name of the activity. The value set is: WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
subject: indicates the subject who carried out the experiment. The value range is 1..30
