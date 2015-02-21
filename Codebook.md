## Study description and design
The study is based on the Human Activity Recognition Using Smartphones Data Set in UCOI Machine Learrning Repository [1]. Detailed data set are found in 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data set contains two separate data set, train and test. Please refer to "README.txt", "features.txt" and "features_info.txt" of the orginal data set for a thorough description of the data set.

The current study does the following

1. Merges the training and the test sets to create one data set. The data set also aggregates subject ID (in ```subject_(train|test).txt)``` and activity ID (in ```y_(train|test).txt)``` with the main data (```X_(train|test).txt```) in one table
2. Extracts only the measurements on the mean and standard deviation for each measurement. specifically, we characterized those as the features in the original data which names containes either ```mean()``` or ```std()```, that results in 66 features extracted from the original data set.
3. replace activity number by thir descriptive activity names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
4. Appropriatly label the column name: removing special characters, enhancing readability, and removing anomalies 
5. creates a second, independent tidy dataset with the average of each variable for each activity and each subject. This is the final output of the study. The variable sof the final output is detailed in the codebook section.

  
##Codebook

```
n Variable name
1 subject
2 activity
3 tBodyAcc.mean.X
4 tBodyAcc.mean.Y
5 tBodyAcc.mean.Z
6 tBodyAcc.std.X
7 tBodyAcc.std.Y
8 tBodyAcc.std.Z
9 tGravityAcc.mean.X
10 tGravityAcc.mean.Y
11 tGravityAcc.mean.Z
12 tGravityAcc.std.X
13 tGravityAcc.std.Y
14 tGravityAcc.std.Z
15 tBodyAccJerk.mean.X
16 tBodyAccJerk.mean.Y
17 tBodyAccJerk.mean.Z
18 tBodyAccJerk.std.X
19 tBodyAccJerk.std.Y
20 tBodyAccJerk.std.Z
21 tBodyGyro.mean.X
22 tBodyGyro.mean.Y
23 tBodyGyro.mean.Z
24 tBodyGyro.std.X
25 tBodyGyro.std.Y
26 tBodyGyro.std.Z
27 tBodyGyroJerk.mean.X
28 tBodyGyroJerk.mean.Y
29 tBodyGyroJerk.mean.Z
30 tBodyGyroJerk.std.X
31 tBodyGyroJerk.std.Y
32 tBodyGyroJerk.std.Z
33 tBodyAccMag.mean
34 tBodyAccMag.std
35 tGravityAccMag.mean
36 tGravityAccMag.std
37 tBodyAccJerkMag.mean
38 tBodyAccJerkMag.std
39 tBodyGyroMag.mean
40 tBodyGyroMag.std
41 tBodyGyroJerkMag.mean
42 tBodyGyroJerkMag.std
43 fBodyAcc.mean.X
44 fBodyAcc.mean.Y
45 fBodyAcc.mean.Z
46 fBodyAcc.std.X
47 fBodyAcc.std.Y
48 fBodyAcc.std.Z
49 fBodyAccJerk.mean.X
50 fBodyAccJerk.mean.Y
51 fBodyAccJerk.mean.Z
52 fBodyAccJerk.std.X
53 fBodyAccJerk.std.Y
54 fBodyAccJerk.std.Z
55 fBodyGyro.mean.X
56 fBodyGyro.mean.Y
57 fBodyGyro.mean.Z
58 fBodyGyro.std.X
59 fBodyGyro.std.Y
60 fBodyGyro.std.Z
61 fBodyAccMag.mean
62 fBodyAccMag.std
63 fBodyAccJerkMag.mean
64 fBodyAccJerkMag.std
65 fBodyGyroMag.mean
66 fBodyGyroMag.std
67 fBodyGyroJerkMag.mean
68 fBodyGyroJerkMag.std
```

## References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

