=============================================================================================
#   Getting and Cleaning Data - Course Project
R Program for CLeaning the Human Activity Dataset                       
Version: 1.0                                                                             
Author: Sitaram Tadepalli                                                               
=============================================================================================

=============================================================================================
### Part 1: Merging Training and Test Datasets to form one Full Dataset              
=============================================================================================
In the Part 1 of the program we read the Training datasets and Test datasets into R
We will consider three datasets for Training they are 
* subject_train.txt
* X_train.txt
* Y_train.txt

Three datasets are considered from Test dataset
* subject_test.txt
* X_test.txt
* Y_test.txt

We ignore the Inertial Signals folder as it does not provide any relevant information for our
analysis

Note that above Three training data sets are having 7352 observations each. In other sense all of them 
have same number of rows.
* subjectTrain has 7352 observations and 1 variable (Subject number)
* xTrain has 7352 observations and 561 variables
* yTrain has 7352 observations and 1 variable (Activity Names)

Note that above Three test data sets are having 2947 observations each. In other sense all of them have
same number of rows.
* subjectTest has 2947 observations and 1 variable (Subject number)
* xTest has 2947 observations and 561 variables
* yTest has 2947 observations and 1 variable (Activity Names)

We will then column bind the Training/Test Datasets to create one Full Training/Test Data set.Next we row bind
the fullTrainingDataset and fullTestDataset to create a Training Test Dataset

=============================================================================================
### Part 2: Cleaning the Activity and Features dataset to convert them to descriptive names      
=============================================================================================
Load the activity Dataset into R and perform cleaning of the activity names to make then more desctiptive
We will remove all the underscores and convert them to lower case 

Cleaning the Features Dataset and replacing the feature names with meaning full names.Here we remove the underscore 
and make the variables meaningfull for the X,Y,Z Axial observations.

We also calculate a Numeric vector for variables having Mean() and Std().Note that we have to capture only the 
variables which represent the measurement of mean and std. we have to ignore the variables which are not mean variables
like meanFreq and angles

=============================================================================================
### Part 3: Loop for building the human activity dataset     
=============================================================================================
Here we loop with-in the Activity dataset to create average of all activities performed by a subject
We Merge the activities dataset and the Human activity dataset for establishing the mapping between activity number and 
activity name

Final activity dataset is created by ordering the rows of the dataset first by volunteer number and then by activity number

=============================================================================================
### Part 4: Writing the clean dataset to workspace     
=============================================================================================
Finally writing the final dataset to the working directory

### Please refer to copybook.MD for the list of variable names,feature names and activity names used in the program. 