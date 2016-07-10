
This project is the analysis of data from a cell phone usage experiments at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The analysis was conducted as an assignmnt for the Coursera course Getting and Cleaning Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The source data analyzed was retrieved from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and analyzed using the script run_analysis.R. The analysis produces a file showing mean measurements by subject and activity, "SummarizedDataset.csv"

The source data is documented at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

run_analysis.R Conducts the following steps to process the dataset:
* Clear variables in the local workspace
* Check for the existence, and as needed create a directory "dataset" in the current working directory
* Download the source data as a zip file
* Extract the zip archive files to the dataset subdirectory
* Create a merged dataset combining the data files: x_train, y_train, subject_train, x_test, y_test, subject_test
* Labels the merged dataset based on the applicable data labels from the data set (features.tt and activity_labels.txt)
* Calculate mean values for each measure in the data set by subject and activity number
* Save the results as SummarizedDataSet.csv


