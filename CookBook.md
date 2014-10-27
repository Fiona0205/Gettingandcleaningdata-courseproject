Code book

Variables in run_analysis.R: 
xTrain : data frame which stores the training data, reading from X_train.txt 
yTrain : data frame which stores the training data activity ID, reading from y_train.txt 
xTest : data frame which stores the testing data, reading from X_test.txt 
yTest : data frame which stores the testing data activity ID, reading from y_test.txt 
allSet : data frame which combines training sets and testing sets 
features : character stores the descriptive variable names, reading from features.txt 
meanstd_features : extract mean and standard variable names 
meanstd_data: extract mean and standard deviation for each measurement 
activity_labels : data frame which stores activity ID and names 
subject_train : data frame which stores the training data subject, reading from subject_train.txt 
subject_test : data frame which stores the testing data subject, reading from subject_test.txt 
newdata : data frame which combines allSet and subject 
meanstd_name : data frame has descriptive activity names to name the activities 
melt : melted data frame 
tidyData : a tidy data each vairiable forms a column, each observation forms a row

Summary: 
1. The original input has 7352*561 of training data(xTrain) and 2947*561 of testing data(xTest) 
2. For requirement 1, allSet variable has 10299*562 data which includes 561-feature vector with time and frequency domain 
variables and activity ID 
3. For requirement 2, after extracting mean and standard variables from data sets, the varaiable has 10299*80 data 
4. For requirement 3, variable meanstd_name using descriptive activity names to name the activities in the data set 
5. For requirement 4, variable allSet labels the data set with descriptive variable names 
6. For requirement 5, tidyData fullfills the requirement which contains 180*81 data, row number means 30 persons each has 
6 activities, so total row number is 180. Column number inludes 79 average of each mean and standard values, one subject 
and one activity names.
