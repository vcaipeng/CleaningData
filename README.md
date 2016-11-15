# CleaningData

This is the course project for third programming assignment -- Getting and Cleaning Data. User should already downloaded dataset from the
website and saved it in local directory.
To run the code, user should first replace the variable "dir" with directory of dataset file in the user's computer.
Then we create eight variables to record directory of corresponding dataset. They are:
TrainDir: directory of training data set
TestDir: directory of testing data set
TrainLabelDir: directory of training labels
TestLabelDir: directory of testing data labels
TrainSubjDir: directory of training data subjectives
TestSubjDir: directory of testing data subjectives
VarNamesDir: directory of variable names
LabelDir: directory of Labels

The first assignment is to merge the training data set and test data set to create one data set. Get data set by read.table() function,
merge two data sets with rbind() function. The new data set is saved in variable Data.

Then the second assignment is to extract only the measurements on the mean and standard deviation for each measurement. Save variable names
in VarNames by read.table(VarNamesDir). Save the index of measurements on the mean and std by using grep() function. Then take subset from
the new data set created in assignment one Data. Finaly add column names to the subset accordingly.

The third assignment is to use descriptive activity names to name the activities in the data set. First read activity code save them in 
TrainLabel and TestLabel. Merge these two activity codes and form a complete code set. Then read activity labels and save it in Label.
Mapping code with label and obtain the descriptive activity names.

Next is to label the data set with descriptive variable name. Read subjective directory of trainig data set and testing data set and save
them respectively. Merge these two subjective data set into a complete subjective data set. Attach the subjective to the Subset obtained
in assignment 2 and also attach the Label from assignment 3 to the Subset.

Finally to create an independent tidy dataset MeanSet with the average of each variable for each activity and each subject. Here I used
aggregate() to average all the columns except for activity and subject.
