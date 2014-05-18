## The repo includes the following files:

* README.md

* CodeBook.md

* run_analysis.R

### CodeBook.md
The code book contains description of all 180 variables and 79 observations in tidy data set. 

### run_analysis.R
This R script is used to process the data downloaded from UCI archive website(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Assuming the data is already downloaded and unzipped in working directory, i
t reads in stat results, subject number(30 participants in total, 70% of them generated training data, the rest 30% generated test data.) and activity number(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING are numbered from 1 to 6) from training and test category respectively. 
* As first part of the script, two categories are merged into one with `rbind()`. 
* All of mean and standard deviation values are selected and subsetted into a new data frame `MeanAndStdSet`. `grep()` finds all the indices of variables that contain `mean` and `std` in names. Note that there are a couple of variable names containing `Mean` however not mean values.
* The activity numbers, as the last column of data frame `totalSet`, are mapped to activity descriptive names according to `activity_labels.txt`. **Given that the data set in step 3 is from step 1 or step 2 is ambiguous, here the whole data set from step 1 is chosen for convenience.**
* The column names of subset from step 2 are modified according to column name rules: no parenthesis, no hyphen, in lower case. **Again, the same ambiguity happens to step 4, this time, the subset from step 2 is chosen to make life easier.**
* For each subject of each activity, all the variables in subset from step 2 are averaged. This creates a new data frame `tidyData` with variable names in rows and combination of subject and activity in columns. The new data frame is written into a text file called `tidyData.txt`.
