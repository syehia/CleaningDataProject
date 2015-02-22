
## Assumptions
* Inertial Signals files are not used or read in this exercise since they are not needed
* the only features extracted are those wich has "mean()" or "std()" in their fetaure name (see features.txt). "MeanFreq()" measurement **is not** included becuase this is a weighted average of frequency doamin (and not mean of measurements)
* I am also excluding the "angle" features (last 7 features in "features.txt")

## Instructions
* set your directory as the parent of UCI HAR Dataset
* download run_analysis.R from my github submission
* Source run_analysis.R
* run 
 ``` run_analysis() ```
* Tidy data set is generated in "final_output.txt" of working directory (also added in github directory).
* To View table in Rstudio:
  ```
   tidy_set <- read.table("final_output.txt",header=TRUE))
   View(tidy_set)
  ```




