## The dataset includes the following files:

* 'README.md': This document.

* 'run_analysis.R': R script used to transform the original dataset from the experiments to the tidy dataset included in this repo.

* 'myTidyData.txt': Tidy dataset.

* 'CodeBook.md': Document that describes the variables, the data, and all the transformations to clean up the data from the experiments.

## How to execute the R script

To be able to execute the 'run_analysis.R' script, this script should be placed in the R working as long as the following Samsung data:
* X_test.txt
* X_train.txt
* subject_test.txt
* subject_train.txt
* y_test.txt
* y_train.txt
* features.txt
* activity_labels.txt

These files can be obtained from this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

An example of the output produced by the 'run_analysis.R' script has been exported to the file 'myTidyData.txt'.
