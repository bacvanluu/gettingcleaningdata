# This is the code for the Course Project of "Getting and Cleaning Data"

# There are five steps
# 1. It merges the training and the test sets to create one data set.
# 2. It extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. It uses descriptive activity names to name the activities in the data set
# 4. It appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(reshape2)


# Reading in the data and merging

columnnames <- read.table("features.txt", colClasses="character")
columnnames <- columnnames[,2]

testdata <- read.table("./test/X_test.txt", col.names=column.names)
traindata <- read.table("./train/X_train.txt", col.names=column.names)


testdata <- cbind(testdata, read.table("./test/y_test.txt", col.names="Activity"))
traindata <- cbind(traindata, read.table("./train/y_train.txt", col.names="Activity"))


testdata <- cbind(testdata, read.table("./test/subject_test.txt", col.names="Subject"))
traindata <- cbind(traindata, read.table("./train/subject_train.txt", col.names="Subject"))


alldata <- rbind(testdata,traindata)


# Using descriptive activity names

activitylabels <- read.table("./activity_labels.txt")
alldata[,"Activity"] = activitylabels[alldata[,"Activity"], 2]


# Extracting only the measurements on the mean and standard deviation for each measurement. 


columnnumbers <- grep("-mean\\(\\)|-std\\(\\)", columnnames)


# extracting data for choosen columns (mean() and std()) 

chosendata <- alldata[,c(562,563, columnnumbers)]



# Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 

combined <- melt(chosendata, id.vars=c("Activity","Subject"))
tidydata <- dcast(combined, Activity + Subject ~ variable, mean)

write.table(tidydata, "tidydata.txt")
