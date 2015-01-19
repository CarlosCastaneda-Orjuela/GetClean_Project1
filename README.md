# Introduction
This is an exercise about to compile in a tidy database information from wearable computing research. The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained

# Making a tidy database
A serie of steps were implemented to generate a tidyHAR database. "run_analysis.R" file will help you to do a tidy data base (tidyHAR)

It is timportant to set you working directory containing the "UCI HAR Dataset" folder. Dowloable from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. "run_analysis.R" run the folowing steps:

1. Load the partial databases into R. Files are load from the "UCI HAR Dataset" folder

2. Make an unique database merging train and test database (in a HARDataset) and remove partial datasets

3. Make activity variable as factor

4. Subset the database with subject, activity, and ONLY "mean()" and "std()" cointaining variables (in a subsetHAR database)

5. Create a tidy database with mean by subject and activity with aggregate function

6. Adjust the names of tidyHAR  variables

7. Export the tidy dataset to .txt file

