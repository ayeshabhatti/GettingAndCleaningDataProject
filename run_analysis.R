run_analysis <-function()
{
  #load the descriptive names of the features
  cnames <- read.table("UCI HAR Dataset/features.txt",col.names=c("id", "name"), fill=FALSE)
  cnames3<- unlist(cnames[,2])
  
  #Load features data for test data
  testX <- read.table("UCI HAR Dataset/test/X_test.txt")
  
  #Name the test data with descriptive names
  colnames(testX)<-cnames3
  
  #Load the activity Ids for test data
  testY <- read.table("UCI HAR Dataset/test/Y_test.txt",col.names=c("Label"))
  
  #Load the participant ids for test data
  testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names=c("Subject"))
  
  #merge the test data with activity ids and subject ids 
  testdata <- cbind(textX,testY,testSubject)
  
  
  #Load the train data
  trainX <- read.table("UCI HAR Dataset/train/X_train.txt")
  
  #Name the train data with descriptive names
  colnames(trainX)<-cnames3
  
  #Load the activity Ids for train data
  trainY <- read.table("UCI HAR Dataset/train/Y_train.txt",col.names=c("Label"))
  #Load the participant ids for test data
  trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names=c("Subject"))
  
  #merge the train data with activity ids and subject ids 
  traindata <- cbind(trainX,trainY,trainSubject)
  
  
  #Merge test and train data together to form one single data set
  mergeddata<-rbind(testdata,traindata)
  
  
  #Extract mean and standard deviation measurements 
  meanstd<-mergeddata[,grep("(mean|std|Label|Subject)", names(mergeddata), ignore.case=TRUE,value=TRUE)]
  
  
  #Replace the activity ids with descriptive labels
  meanstd$Label[meanstd$Label == 1] <- "WALKING"
  meanstd$Label[meanstd$Label == 2] <- "WALKING_UPSTAIRS"
  meanstd$Label[meanstd$Label == 3] <- "WALKING_DOWNSTAIRS"
  meanstd$Label[meanstd$Label == 4] <- "SITTING"
  meanstd$Label[meanstd$Label == 5] <- "STANDING"
  meanstd$Label[meanstd$Label == 6] <- "LAYING"
  
  #create tidy data set with mean of each variable for each subject and activity
  tidydata<-ddply(meanstd, .(Subject,Label), numcolwise(mean))
  
  #Write down the tidy data set on disk
  write.table(tidydata, file = "tidydata.txt",row.names = FALSE) 
  
  return(tidydata) 
}