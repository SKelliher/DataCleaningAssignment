# Clear workspace variables
rm(list=ls())

# Check if subdirectory "dataset" exists
if (!file.exists("dataset")) {dir.create("dataset")}

# Source data URL
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Assign local name for zip archive
ziparchive = "UCI HAR Dataset.zip"

# Download stage
message("Download zip archive")

# Using Windows
download.file(URL, destfile=ziparchive)

# Other OS
# download.file(URL, destfile=ziparchive, method = "curl")

# Record download date
dateDownloaded <- date()

message("Unzip the archive to subdirectory dataset")
unzip(ziparchive, exdir="dataset")

message("Load column and activity labels")
features <- read.table('dataset/UCI HAR Dataset/features.txt',header=FALSE)[[2]]
activity_labels <- read.table('dataset/UCI HAR Dataset/activity_labels.txt',header=FALSE, col.names=c("actNumber", "activity"))

message("Extract training datasets as tables")
x_train <- read.table("dataset/UCI HAR Dataset/train/X_train.txt")  #columns correspond to features labels
y_train <- read.table("dataset/UCI HAR Dataset/train/y_train.txt", col.names=c("actNumber"))
subject_train <- read.table("dataset/UCI HAR Dataset/train/subject_train.txt",col.names=c("subject"))

message("Extract test datasets as tables")
x_test <- read.table("dataset/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("dataset/UCI HAR Dataset/test/y_test.txt", col.names=c("actNumber"))
subject_test <- read.table("dataset/UCI HAR Dataset/test/subject_test.txt",col.names=c("subject"))

message("Merge training and test tables")
x_merge <- rbind(x_train, x_test)
y_merge <- rbind(y_train, y_test)
subject_merge <- rbind(subject_train, subject_test)

# Assign column names
colnames(x_merge) <- features

# Merge datasets
UCIdataset <- cbind(subject_merge, y_merge, x_merge)

# Ordered summary set with the average of each variable for each activity and each subject.
UCIsummary<-aggregate(. ~ subject + actNumber, UCIdataset, mean)
UCIsummary<-UCIsummary[order(UCIsummary$subject,UCIsummary$actNumber),]
write.table(UCIsummary, file = "SummarizedDataset.csv",row.name=FALSE,sep=",")
