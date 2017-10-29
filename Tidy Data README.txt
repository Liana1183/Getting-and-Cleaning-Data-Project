==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'Tidy Data Code Book.txt' for more details. 

For each record it is provided:
======================================

- A 79-feature vector with time and frequency domain variables relating to mean and standard deviation only. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'Tidy Data README.txt' : This file which gives background on where the data comes from.

- 'Tidy Data Code Book.txt' : Code Book which explains the different fields in the data set.

- 'run_analysis.R': This is the script that takes the original dataset and produces a tidy data set named 'tidy_data.txt'.

- 'tidy_data.txt': contains the data set produced by run_analysis.R

Notes:
==========================================
The tidy_data text file is a tidy data set that was created from the orginial data set found here:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data set was created from the orginial by the following steps:

1. The training and test data sets were merged into one.

2. Extracted only the measurements on the mean and standard deviation for each measurement.  This was done by extracting all of the features that ended in "mean()" or "std()".

3. The activity codes were replaced with descriptive activity names.

4. Variable names from the 	features.txt file were extracted and cleaned up to be more readable.  These names were then assigned to the appropriate columns.

5. The final data set was created by calculating the mean for each column for every subject/activity pair.  This results in one observation for every subject/activity pair.


