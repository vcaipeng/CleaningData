getwd()
dir<-"/Users/caipeng/Downloads/Coursera/3_Getting and Cleaning Data/W4/UCI HAR Dataset"    #directory  of dataset file

TrainDir<-paste0(dir,"/train/X_train.txt")
TestDir<-paste0(dir,"/test/X_test.txt")
TrainLabelDir<-paste0(dir,"/train/y_train.txt")
TestLabelDir<-paste0(dir,"/test/y_test.txt")
TrainSubjDir<-paste0(dir,"/train/subject_train.txt")
TestSubjDir<-paste0(dir,"/test/subject_test.txt")
VarNamesDir<-paste0(dir,"/features.txt")
LabelDir<-paste0(dir,"/activity_labels.txt")

# 1. Merge the training and the test sets to create one data set.
Train<-read.table(TrainDir)	#Training data
Test<-read.table(TestDir)	#Test data
Data<-rbind(Train,Test)		#Merge training data and test data

# 2. Extract only the measurements on the mean and standard deviation for each measurement
VarNames<-read.table(VarNamesDir)	#Read variable names
MeanVarIndex<-grep("mean()",VarNames[,2],fixed=T)	#record index of variables include "mean()-"
StdVarIndex<-grep("std()",VarNames[,2],fixed=T)		#record index of variables include "std()-"
SubsetIndex<-sort(c(MeanVarIndex,StdVarIndex))	#ascending sort of above indexes
Subset<-Data[,SubsetIndex]				#Extracts indexed (mean and std) measurements
names(Subset)<-VarNames[SubsetIndex,2]		#name the sub dataset with appropriate variable names

# 3. Use descriptive activity names to name the activities in the data set
TrainLabel<-read.table(TrainLabelDir)	#Activity code of training data
TestLabel<-read.table(TestLabelDir)		#Activity code of test data
Label<-read.table(LabelDir)			#Activity labels
Activity<-rbind(TrainLabel,TestLabel)	#Merge activity code of training data and test data
Activity<-Label[Activity[,1],2]			#Replace activity code with labels (activity names)

# 4. Appropriately label the data set with descriptive variable names.
TrainSubj<-read.table(TrainSubjDir)		#Subject of taining dataset
TestSubj<-read.table(TestSubjDir)		#Subject of test dataset
Subject<-as.factor(c(TrainSubj[,1],TestSubj[,1]))	#Merge subject of training data and test data
Subset$Subject<-Subject		#Attach subject to the sub dataset
Subset$Activity<-as.factor(Activity[,1])	#Attach Activity to the sub dataset


# 5. Create an independent tidy dataset MeanSet with the average of each variable for each activity and each subject
MeanSet<-aggregate(Subset[,1:(ncol(Subset)-2)],list(Subset$Activity,Subset$Subject),mean)

write.table(MeanSet,file="/Users/caipeng/Downloads/Coursera/3_Getting and Cleaning Data/W4/MeanSet.txt",row.name=FALSE)


