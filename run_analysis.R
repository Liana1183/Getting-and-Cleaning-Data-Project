#####Step 1: Merge the training and test sets to create one data set

#Load x_train and x_test: 561-feature vector with time and frequency domain variables
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

#Load y_train and y_test: Activity Code
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#Load subject_test and subject_train: Each row identifies the subject who performed the activity for each window sample.
#Its range is from 1 to 30
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Load features: List of all features 561 features that are included in x_train and x_test        
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

#Load activity_lables: Links the activity code with their activity name
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

#Bind activity code and subject code

X_train <- cbind(y_train,X_train)
X_test <- cbind(y_test,X_test)
X_train <- cbind(subject_train,X_train)
X_test <- cbind(subject_test,X_test)

#merge test and train datasets
X_combined <- rbind(X_test,X_train)

#####Step 2: Extract only the measurements on the mean and standard deviation for each measurement

#find indices that correspond to feature measurements on the mean and std
sub_features <- features[grep("std()|mean()",features$V2),1]

#add activity and subject code indicies
sub_alldata <- c(1,2,sub_features+2)

#subset combined data to include only those fields with measurements on the mean and std
#as well as activity and subject code
X_Subset <- X_combined[,sub_alldata]

#####Step 3: Use descriptive activity names to name the activities in the data set

#Replace activity code column (2nd column) with descriptive activity name
X_Subset[,2] <- activity_labels[X_Subset[,2],2]

#####Step 4: Appropriately label the data set with descriptive variable names

#Create vector which we will use to assign column names.
variable_names <- features[sub_features,2]

#Clean up variable names vector
variable_names <- gsub("\\(\\)","",variable_names)
variable_names <- gsub("-",".",variable_names)
variable_names <- gsub("^t","Time",variable_names)
variable_names <- gsub("^f","Frequency",variable_names)

#Add subject and activity headings
variable_names <- c("Subject","Activity",variable_names)

#Assign variable names vector to the columns of our dataset
names(X_Subset) <- variable_names

####Step 5: Create separate, independent tidy data set which has an observation (mean) for every subject activity pair

library(dplyr)

X_Summary <- group_by(X_Subset, Subject, Activity) %>% summarise_at(variable_names[3:81],mean)
write.table(X_Summary, "./UCI HAR Dataset/tidy_data.txt", sep="\t", row.names = FALSE)
