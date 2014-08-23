# CodeBook Data Source
This CodeBook describes a dataset derived from the following data:

## Source Dataset Information
> Human Activity Recognition Using Smartphones Dataset
> Version 1.0

## Source Dataset Authors
> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
> Smartlab - Non Linear Complex Systems Laboratory
> DITEN - Università degli Studi di Genova.
> Via Opera Pia 11A, I-16145, Genoa, Italy.
> activityrecognition@smartlab.ws
> www.smartlab.ws

# CodeBook Description
## Author
Sterling Hoeree
## Purpose
Summarizes the data from the aforementioned dataset, by taking the MEAN of each "mean" and "std" (standard deviation) value
**for each** subject, activity in the original data set. This summary will henceforth be referred to as the "tidied" data set.

### Each Row
Each **row** describes a unique {activity id, subject id} pair. 

### Each Column
Many of the column names are the same as in the original source data; however, **each column is the *average* value** of the original dataset's variable.

| Column Name | Meaning |
| ----------- | ------- |
| activity_id | Unique identifier for the activity type. Described in the original data set's readme. | 
| subject_id | Unique identifier for a subject, from 1-30. | 
| tBodyAcc-mean()-X | Average value for this {activity id, subject id} pair. |  
| tBodyAcc-mean()-Y | See previous description. |
| *Remaining Columns* | All columns except for the last column ("description") have the same definition as the previous two columns. |
| description | Describes the activity type. For example, an activity with id 1 is the WALKING activity type. | 


