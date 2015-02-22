
## Assumptions
* Inertial Signals files are not used or read in this exercise since they are not needed
* the only features extracted are those wich has "mean()" or "std()" in their fetaure name (see features.txt). "MeanFreq()" measurement **is not** included becuase this is a weighted average of frequency doamin (and not mean of measurements)
* I am also excluding the "angle" features (last 7 features in "features.txt")

## Instructions
* set your directory as the parent of UCI HAR Dataset
* download run_analysis.R from my github submission
* Source run_analysis.R
* run  ``` run_analysis()```
* tidy data set is generated in "final_output.txt" of working directory (also added in github directory)
* to View table in Rstudio:

  ```tidy_set <- read.table("final_output.txt",header=TRUE))```
  
### The Resulting data set satisfies the tidy data set condition
* Each column contains a single variable
* Each row is an observation, namely the mean data for a subject and an activity
* All observations are relating to a subject/activity pair, and there is no observational unit that can form a table.





