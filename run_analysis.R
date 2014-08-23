## Import libraries.
library(plyr)

## Set-up phase:
## Assume that the .zip archive has been extracted into the current directory
## using something like WinZip or 7zip to do so.
## The extracted archive should be a folder named "UCI HAR Dataset".

# Pull in the activity labels data; {activity_id, description}
data.act_labels = read.table("./UCI\ HAR\ Dataset/activity_labels.txt")
names(data.act_labels) = c("id", "description")

# Pull in the feature IDs to descriptors data frame.
data.features = read.table("./UCI\ HAR\ Dataset/features.txt")

# Get only the mean() and std() (standard deviation) feature indeces.
mean_std_feats_idx = grep("(mean|std)\\(\\)", data.features$V2)
data.features = data.features[mean_std_feats_idx,]
names(data.features) = c("id", "description")

# Pull in the subject IDs for the training and test data sets.
test.subjects  = read.table("./UCI\ HAR\ Dataset/test/subject_test.txt")
names(test.subjects) = c("subject_id")
train.subjects = read.table("./UCI\ HAR\ Dataset/train/subject_train.txt")
names(train.subjects) = c("subject_id")

# Pull in the test and training data as data frames.
test.X     = read.table("./UCI\ HAR\ Dataset/test/X_test.txt")
test.Y     = read.table("./UCI\ HAR\ Dataset/test/y_test.txt")
names(test.Y) = c("activity_id")
train.X    = read.table("./UCI\ HAR\ Dataset/train/X_train.txt")
train.Y    = read.table("./UCI\ HAR\ Dataset/train/y_train.txt")
names(train.Y) = c("activity_id")


##{Extract only the measurements on the mean and standard deviation 
## for each measurement.}
#-> Filter the training and test sets (both X & Y) for only the variables we want.
test.X  =  test.X[,mean_std_feats_idx]
train.X = train.X[,mean_std_feats_idx]


##{Appropriately label the data set with descriptive variable names.}
#-> Name the training & test set variables using the feature vector.
names(test.X)  = data.features$description
names(train.X) = data.features$description

# Column-bind the Y data (activity ids) and subjects' ids to the X data.
# This will tell us which subject had which results, and for which activity ids.
data.test  = cbind(test.subjects,  test.Y,  test.X)
data.train = cbind(train.subjects, train.Y, train.X)

# Transform the subject id column into a column of factors instead of numerical values.
data.test$subject_id   = factor(data.test$subject_id)
data.train$subject_id  = factor(data.train$subject_id)

# Transform the activity id column into a column of factors as well.
data.test$activity_id   = factor(data.test$activity_id)
data.train$activity_id  = factor(data.train$activity_id)

##{Merge the training and the test sets to create one data set.}
data.all = rbind(data.train, data.test)
data.all = data.all[order(data.all$activity_id),] # sorted by activity id (i.e. WALKING, RUNNING, etc.)

##{Create a second, independent tidy data set with the average 
## of each variable for each activity and each subject.}
data.tidy = ddply(data.all, .(subject_id,activity_id), colwise(mean))


##{Use descriptive activity names to name the activities in the
## data set.}
#-> Merge the test/train data by activity id with the activity labels data frame.
# I do this now instead of before so that I can properly label my tidy data set.
data.test  = merge(x=data.test,  y=data.act_labels, by.x="activity_id", by.y="id", all=T)
data.train = merge(x=data.train, y=data.act_labels, by.x="activity_id", by.y="id", all=T)
data.tidy  = merge(x=data.tidy,  y=data.act_labels, by.x="activity_id", by.y="id", all=T)

## Write out the tidy data set.
write.table(data.tidy, file="./tidy_data.txt", row.names=FALSE)
