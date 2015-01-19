# First set you working directory containing the "UCI HAR Dataset" file
# Load the partial databases
        # Loading train databases
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train)<-"subject"
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
names(X_train)<-read.table("./UCI HAR Dataset/features.txt")[,2]
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt")
names(Y_train)<-"activity"
        # Loading test databases
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test)<-"subject"
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
names(X_test)<-read.table("./UCI HAR Dataset/features.txt")[,2]
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt")
names(Y_test)<-"activity"

# Make an unique database merging train and test database and remove partial datasets
HARDataset<-rbind(data.frame(subject_train,Y_train,X_train,base="train"),
                  data.frame(subject_test,Y_test,X_test,base="test"))
rm(subject_train,Y_train,X_train,subject_test,Y_test,X_test)

# Make activity variable as factor
HARDataset$activity<-as.factor(HARDataset$activity)
levels(HARDataset$activity)<-read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Subset the database with subject, activity, and "mean" and "std" cointaining variables
        # Evalute this database in steps 1-4
subsetHAR<-cbind(HARDataset[c("subject","activity","base")],
                 HARDataset[grep(".mean()",names(HARDataset))],
                 HARDataset[grep(".std()",names(HARDataset))])

# Create a tidy database with mean by subject and activity with aggregate function
tidyHAR<-aggregate(subsetHAR[4:82],c(list(subsetHAR$subject),list(subsetHAR$activity)),mean)
# Adjust the names of tidyHAR
temp<-names(tidyHAR)
temp[1:2]<-c("subject","activity")
names(tidyHAR)<-temp
rm(temp)
# Export the tidy dataset to txt file
write.table(tidyHAR,"TidyHAR.txt",row.name=FALSE)
