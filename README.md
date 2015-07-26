# gettingcleaningdata
# Purpose of project

The goal of the project is to create a tidy data set from Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

# Steps for replication

1.	Download the data from the link:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2.	Unzip the data into a folder in your working directory. This creates a folder called "UCI HAR Dataset".
3.	Place the "run_analysis.R" script into your working directory.
4.	Run source("run_analysis.R")
5.	After running the source code, a new file called tidydata.txt is generated in the working directory

# Required packages
The "run_analysis.R" script requires the package reshape2.

# R script

The steps taken by the "run_analysis.R" script to generate the tidy data set are fully described in the CodeBook file. The CodeBook also contains a description of the variables. 
