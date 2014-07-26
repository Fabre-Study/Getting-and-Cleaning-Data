## Getting and Cleaning Data
 Steps of the procedure in run_analysis.R

## Set the folder to load the files in my.folder object

## Reading Data Files
 Read the activity_labels and features files
 Read the Subjects files with Training and Test sets
 Read the Human Activity Collected Data files with Training and Test sets
 Read the Activity Collected Data files with Training and Test sets

## Concatenating Data Files
 Concatenate (rows) the Subject files - creating my.subject dataset - include labels
 Concatenate (rows) the Human Activity Collected Data files - creating my.data.X dataset - include labels
 Concatenate (rows) the Activity Collected Data files - creating my.data.Y dataset - include labels

## Get meand and standard deviation of Features
 Extracts only the measurements on the mean and standard deviation for each measurement
 Use grep '-mean|-std' function to get the mean and standard deviation features and change the features code to description

## Creating aggregate file 
 Concatenate (columns) the Subject - Human Activity Collected Data - Activity Collected Data files - creating my.tidy.result
 Use aggregate function to aggregate the finles by Subject and Activity
 Change the description of columns 1:2 - Subject and Activity

## Writting final files
 Write the final data set from my.tidy.result
 Write the final data set - Step 5 of the Assessment - from my.tidy.aggr.result
