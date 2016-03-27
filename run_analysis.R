library(plyr)


#Read the tables x

test<-read.table("C:/Users/Documents/X_test.txt") 
train<-read.table("C:/Users/Documents/X_train.txt") 

# Merge the training and test sets to create one data set
unionx<-rbind(train,test)

#Read the tables y

testy<-read.table("C:/Users/Diego/Documents/y_test.txt") 
trainy<-read.table("C:/Users/Diego/Documents/y_train.txt") 

# Merge the training and test sets to create one data set
uniony<-rbind(trainy,testy)

# Read the list of variables
features<-read.table("C:/Users/Documents/features.txt")

#Select the 2nd column - the names of the variables
names(unionx)<-features[mean_and_std_features, 2]

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
unionx <- unionx[, mean_and_std_features]

####Next Step
## Use descriptive activity names to name the activities in the data set
activities<-read.table("C:/Users/Documents/activity_labels.txt")

test<-read.table("C:/Users/Documents/subject_test.txt") 
train<-read.table("C:/Users/Documents/subject_train.txt") 

data<-rbind(train, test)

# correct column name
names(data) <- "subject"

# update values with correct activity names
uniony[,1]<-activities[uniony[, 1], 2]

# correct column name
names(uniony) <- "activity"


# bind all the data in a single data set
all_data <- cbind(unionx, uniony, data)

library(plyr) 
#for ddply function
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, 'averages_data.txt', row.name=FALSE)
