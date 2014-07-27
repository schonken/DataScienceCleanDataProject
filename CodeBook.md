Codebook
===

The Human Activity Recognition Using Smartphones Dataset (Version 1.0) is distributed over multiple files split between "train" and "test" data. This project endeavours to create two summarised tidy datasets:

- A summary per measurement
    - Data Frame = summaryMeasurement 
    - CSV File = UCI-HAR-Summary-per-Measurement.csv
- A summary per subject and activity combination
    - Data Frame = summarySubjectActivity 
    - CSV File = UCI-HAR-Summary-per-Subject-and-Activity-combination.csv

Both datasets use the same codebook, the field definitions are:

- subject
    - Identifies the subject who performed the activity
- activity
    - Identifies the activity performed by the subject 
    - One could argue that this field is not needed because the activity_label is present. I reasoned that the presence of the activity field would aid in lookups against the source material
- activity_label
    - A label for the activity performed by the subject
- group
    - Identifies the source group (TEST, TRAIN)
    - Useful for lookups against the source material
- measurement_mean
    - Mean over 128 measurement observations recorded in X_test.txt and X_train.txt
- measurement_sd
    - Standard deviation over 128 measurement observations recorded in X_test.txt and X_train.txt

#### Data Processing

The files X_test.txt and X_train.txt details the test and training set. Each line states 128 observations related a subject doing an activity. The y_test.txt and y_train.txt files state the observed activity and the subject_test.txt and subject_train.txt files state the observed subject. The data were processed as follows:

- For test and train independently do:
    - Join the activity label with each activity entry
	  - Calculate the mean and standard deviation over the 128 observations
	  - Column bind subject, activity, activity label, mean and standard deviation yeilding a summary per measurement
- Row bind the summary per measurementfor test and training
- Create the Summary per Measurement dataset (data frame and CSV file)
- Aggregate the mean over the Measurement Summary for each subject and activity combination for both the mean and standard deviation.
- Create the Summary per Subject and Activity combination dataset (data frame and CSV file)
	  - _Note_: Both the mean and standard deviation in the new dataset are calculated by taking the mean of their respective fields from the Summary per Measurement dataset. The reasoning behind taking the mean of the standard deviation as opposed to the standard deviation of the standard deviation is that the mean will be of greater value for activity prediction given 128 new observations.
  
#### Examples of the respective datasets
```
Summary per Measurement (Top 10)
=====================================================================
subject activity activity_label group measurement_mean measurement_sd
      1        1        WALKING TRAIN       -0.1813124      0.4862503
      1        1        WALKING TRAIN       -0.1517780      0.4676823
      1        1        WALKING TRAIN       -0.1340718      0.4702628
      1        1        WALKING TRAIN       -0.1267674      0.4771074
      1        1        WALKING TRAIN       -0.1263450      0.4754760
      1        1        WALKING TRAIN       -0.1168135      0.4760602
      1        1        WALKING TRAIN       -0.1246039      0.4742926
      1        1        WALKING TRAIN       -0.1300881      0.4648430
      1        1        WALKING TRAIN       -0.1462113      0.4881380
      1        1        WALKING TRAIN       -0.1393701      0.4638654
```

```
Summary per Subject and Activity combination (Top 10)
=========================================================================
subject activity     activity_label group measurement_mean measurement_sd
      1        1            WALKING TRAIN      -0.12858590      0.4659778
      1        2   WALKING_UPSTAIRS TRAIN      -0.17860883      0.5070061
      1        3 WALKING_DOWNSTAIRS TRAIN      -0.12360753      0.4597579
      1        4            SITTING TRAIN      -0.31055912      0.6397544
      1        5           STANDING TRAIN      -0.31739994      0.6485625
      1        6             LAYING TRAIN      -0.29338342      0.6298907
      2        1            WALKING  TEST      -0.15883164      0.4747430
      2        2   WALKING_UPSTAIRS  TEST      -0.15885490      0.4737090
      2        3 WALKING_DOWNSTAIRS  TEST      -0.09649059      0.4533205
      2        4            SITTING  TEST      -0.31845405      0.6413246
```

#### Acknowledgement
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012