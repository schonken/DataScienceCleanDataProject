Getting and Cleaning Data
===

Welcome to my Coursera Getting and Cleaning Data project. This project endeavours to create two tidy datasets from the Human Activity Recognition Using Smartphones Dataset (Version 1.0). The reasoning behind the tidy dataset structure and the definition of the various fields are detailed in [CodeBook.md](https://github.com/schonken/DataScienceCleanDataProject/blob/master/CodeBook.md).

#### Setting up your environment
1. Fork or download this repo to a project folder
2. Download and save the [Human Activity Recognition Using Smartphones Dataset (Version 1.0)](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in the project folder
3. Extract the content of the archive to a folder named ```UCI HAR Dataset```
4. Ensure your folder and file structure looks like the following:

```
project
├── UCI HAR Dataset
│   ├── test
│   │   ├── Inertial Signals (containing 9 txt files)
│   │   ├── subject_test.txt
│   │   ├── X_test.txt
│   │   └── y_test.txt
│   ├── train
│   │   ├── Inertial Signals (containing 9 txt files)
│   │   ├── subject_train.txt
│   │   ├── X_train.txt
│   │   └── y_train.txt
│   ├── activity_labels.txt
│   ├── features_info.txt
│   ├── features.txt
│   └── README.txt
├── getdata-projectfiles-UCI HAR Dataset.zip
├── README.md
├── run_analysis.R
└── UCI-HAR-Dataset-Tidy-Codebook.md
```

#### Building new tidy datasets
This project uses the data.table and plyr packages. You might have to run ```install.packages('data.table')``` and ```install.packages('plyr')``` to intall the respective packages.

Execute the ```run_analysis.R``` script. This will create two tidy datasets namely:

- A summary per measurement
    - Data Frame = summaryMeasurement 
    - CSV File = UCI-HAR-Summary-per-Measurement.csv
- A summary per subject and activity combination
    - Data Frame = summarySubjectActivity 
    - CSV File = UCI-HAR-Summary-per-Subject-and-Activity-combination.csv

#### Acknowledgement
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012