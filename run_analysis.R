run_analysis <- function(){
  ## This scripts run_analys.R aims to clean data set extracted from UCI machine learning repository##
  ## the scrip does the following
  ## 1.Merges the training and the test sets to create one data set.
  ## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
  ## 3.Uses descriptive activity names to name the activities in the data set
  ## 4.Appropriately labels the data set with descriptive variable names. 
  ## 5.From the data set in step 4, creates a second, independent tidy data set with the average of 
  ## each variable for each activity and each subject.
  
  #######################################################################
  # Preliminary step: read data from repository data                     #
  #######################################################################
  
  #Assumptions: the data are in the "UCI HAR Dataset" folder and the folder is in the working directory 
  
  datadir <- "UCI HAR Dataset"
  testdir<-"test"
  traindir<-"train"
  #file.path() create the file path independent of system running
  
  print("Reading test data...")
  #read test data
  X_test <- read.table(file.path(datadir, testdir, "X_test.txt"))
  y_test <-read.table(file.path(datadir, testdir, "y_test.txt"))
  subject_test<-read.table(file.path(datadir, testdir, "subject_test.txt"))
  #Create on table with all test_data
  test_data<- cbind(subject_test,y_test,X_test)
  
  print("Reading Train Data...")
  #read train data
  X_train <- read.table(file.path(datadir, traindir, "X_train.txt"))
  y_train <-read.table(file.path(datadir, traindir, "y_train.txt"))
  subject_train<-read.table(file.path(datadir, traindir, "subject_train.txt"))
  
  print("Processing ...")
  #Create on table with all test_data
  train_data<- cbind(subject_train,y_train,X_train)
  
  #######################################################################
  # 1.Merges the training and the test sets to create one data set.     #
  #######################################################################
  
  #Merges training and test sets in one data set 
  all_data<-rbind(test_data,train_data)
  
  #############################################################################################
  # 2.Extracts only the measurements on the mean and standard deviation for each measurement. #
  #############################################################################################
  
  #read list of features from features,txt  (column 2 has the list of features)
  features_list <- read.table(file.path(datadir, "features.txt"))[,2]
  
  #create header for data set
  all_data_names <- c("subject", "activity", as.character(features_list))
  
  #extract mean() and std() measurements
  #assumptions : the only features extracted are those wich has "mean()" or "std()" in their fetaure name (see features.txt). "MeanFreq()" measurement *is not* included because this is a weighted avergae of frequncy doamin (and not mean of measurements)
  # I am also excluding the "angle" features (last 7 features in features.txt")
  
  greppos <- grep("mean[:(][:)]|std[:(][:)]", all_data_names)
  
  
  #updating greppos to add subject and activity field  
  greppos <- c(1,2,greppos)
  
  #mean_std_data extracts the measurements on the mean and data (req. 2)
  mean_std_data <-(all_data[,greppos])
  mean_std_data_names <- all_data_names[greppos]
  
  #remove special characters.. and naming variables
  names(mean_std_data) <- make.names(mean_std_data_names)
  
  # now here is how str(mean_std_data) should look like (showing only first ..variables)
  #str(mean_std_data)
  #'data.frame':  10299 obs. of  68 variables:
  #$ subject                    : int  2 2 2 2 2 2 2 2 2 2 ...
  #$ activity                   : Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...
  #$ tBodyAcc.mean...X          : num  0.257 0.286 0.275 0.27 0.275 ...
  #$ tBodyAcc.mean...Y          : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
  #$ tBodyAcc.mean...Z          : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
  #$ tBodyAcc.std...X           : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
  #$tBodyAcc.std...Y           : num  -0.92 -0.967 -0.97 -0.973 -0.967 ...
  #.....
  
  
  ###########################################################################
  # 3.Uses descriptive activity names to name the activities in the data set#
  ###########################################################################
  
  
  # to replace the activity number with proper activity label I transform the activity label (from activity_labels.txt) into factors and replace the number in the data with the factor
  
  activity_labels <- read.table(file.path(datadir, "activity_labels.txt"))
  activity_labels_factors <- factor(activity_labels[,2])
  
  mean_std_data$activity <- activity_labels_factors[mean_std_data$activity]
  
  
  # Head(mean_std_activity) looks like that now (showing only few first columns):
  # subject activity tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z tBodyAcc.std...X 
  # 1       2 STANDING         0.2571778       -0.02328523       -0.01465376       -0.9384040       
  # 2       2 STANDING         0.2860267       -0.01316336       -0.11908252       -0.9754147       
  # 3       2 STANDING         0.2754848       -0.02605042       -0.11815167       -0.9938190       
  # 4       2 STANDING         0.2702982       -0.03261387       -0.11752018       -0.9947428       
  # 5       2 STANDING         0.2748330       -0.02784779       -0.12952716       -0.9938525       
  # 6       2 STANDING         0.2792199       -0.01862040       -0.11390197       -0.9944552     
  
  
  ##########################################################################
  # 4. Appropriately labels the data set with descriptive variable names.  #
  ##########################################################################
  
  # get current column names (previously extracted in 2.)
  current_names <-names(mean_std_data)
  
  #current_names look likes:
  # "subject"                     "activity"                    "tBodyAcc.mean...X"          
  # "tBodyAcc.mean...Y"           "tBodyAcc.mean...Z"           "tBodyAcc.std...X"           
  #....          
  # "fBodyAccMag.mean.."          "fBodyAccMag.std.."           "fBodyBodyAccJerkMag.mean.." 
  # "fBodyBodyAccJerkMag.std.."   "fBodyBodyGyroMag.mean.."     "fBodyBodyGyroMag.std.."     
  # "fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.std.." 
  
  #remove consecutive dots using regular expression
  current_names <- gsub("\\.+",".",current_names)
  
  #remove dots at the end of the name
  current_names <- gsub("\\.$","",current_names)
  
  #correct some column names that have "BodyBody" and replace with "Body"
  current_names <- gsub("BodyBody","Body",current_names)
  
  #End results of columns names:
  # "subject"               "activity"              "tBodyAcc.mean.X"      
  # "tBodyAcc.mean.Y"       "tBodyAcc.mean.Z"       "tBodyAcc.std.X"       
  # "tBodyAcc.std.Y"        "tBodyAcc.std.Z"        "tGravityAcc.mean.X"   
  # ...
  # "fBodyAccJerkMag.std"   "fBodyGyroMag.mean"     "fBodyGyroMag.std"     
  # "fBodyGyroJerkMag.mean" "fBodyGyroJerkMag.std" 
  
  
  ############################################################################
  # 5. From the data set in step 4, creates a second, independent tidy data  #
  # set with the average of each variable for each activity and each subject #  
  ############################################################################
  
  
  names(mean_std_data) <- current_names
  
  final_output <- mean_std_data %>% group_by(subject,activity) %>% summarise_each(funs(mean))  %>% arrange(subject,activity)
  
  #write final_output to file
  write.table(final_output,"final_output.txt", row.names=FALSE)
  
  
  #If I want long format (not used)
  #final_output_long <- melt(out, id.vars=c("subject","activity")) %>% arrange(subject,activity)

}


