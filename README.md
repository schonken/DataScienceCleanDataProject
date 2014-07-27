Getting and Cleaning Data Project
===

Welcome to my Coursera Getting and Cleaning Data Project. This project endeavours to tidy up the Human Activity Recognition Using Smartphones Dataset (Version 1.0) dataset. The reasoning behind the tidy dataset structure and the definition of the various fields are detailed in [UCI-HAR-Dataset-Tidy-Codebook.md](https://github.com/schonken/DataScienceCleanDataProject/blob/master/UCI-HAR-Dataset-Tidy-Codebook.md).

##Setting up your environment
1. Download or Fork this repo to a folder of your choosing. For the purposes of clarity I will be referring to /project as the folder in question.
2. Download the Human Activity Recognition Using Smartphones Dataset (Version 1.0) from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) saving the archive to the /project folder.
3. Extract the content of the archive to a folder named "UCI HAR Dataset" (quotes excluded) within the /project folder

##Confirming everything is ready to start
Your folder and file structure should now look as the following:

- /project
    - /UCI HAR Dataset
        - /test
            - /Inertial Signals
                - body_acc_x_test.txt
                - body_acc_y_test.txt
                - body_acc_z_test.txt
                - body_gyro_x_test.txt
                - body_gyro_y_test.txt
                - body_gyro_z_test.txt
                - total_acc_x_test.txt
                - total_acc_y_test.txt
                - total_acc_z_test.txt
            - subject_test.txt
            - X_test.txt
            - y_test.txt
        - /train
            - /Inertial Signals
                - body_acc_x_train.txt
                - body_acc_y_train.txt
                - body_acc_z_train.txt
                - body_gyro_x_train.txt
                - body_gyro_y_train.txt
                - body_gyro_z_train.txt
                - total_acc_x_train.txt
                - total_acc_y_train.txt
                - total_acc_z_train.txt
            - subject_train.txt
            - X_train.txt
            - y_train.txt
        - activity_labels.txt
        - features.txt
        - features_info.txt
        - README.txt
    - run_analysis.R
    - UCI-HAR-Dataset-Tidy-Codebook.md
    - README.md

## Building a tidy dataset
Running run_analysis.R will produce a tidy dataset in the form of file UCI-HAR-Dataset-Tidy.csv
