This is the course project for the Getting and Cleaning Data Coursera course. 
The R script, run_analysis.R, does the following:

1. Load the activity and feature info
2. Loads the training and test datasets. It keeps only those columns with mean or standard deviation
3. Loads the activity and subject data for each dataset, and then merges those columns with the original dataset
4. Merges the two datasets
5. Converts the activity and subject columns into factors
6. Creates a final tidy dataset that consists of the mean value of each variable for each subject and activity pair
