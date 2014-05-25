#############################################################################################
##  CLeaning the Human Activity Recognition Dataset's                                       #
##  Version: 1.0                                                                            # 
##  Author: Sitaram Tadepalli                                                               #
#############################################################################################

#############################################################################################
# Part 1: Merging Training and Test Datasets to form one Full Dataset                       #     
#############################################################################################

# Read the Training datasets into R

subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",sep="")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt",sep="")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt",sep="")

#############################################################################################
# Note that above Three training data sets are having 7352 observations each. 
# In other sense all of them have same number of rows.
#   subjectTrain has 7352 observations and 1 variable (Subject number)
#   xTrain has 7352 observations and 561 variables
#   yTrain has 7352 observations and 1 variable (Activity Names)
#############################################################################################

# Column Binding the Training Datasets to create one Full Training Data set

fullTrainingDataset <- cbind(subjectTrain,yTrain,xTrain)  # This will have 7352 observations & 563 variables

# Read the Test datasets into R

subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",sep="")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt",sep="")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt",sep="")

#############################################################################################
# Note that above Three test data sets are having 2947 observations each. 
# In other sense all of them have same number of rows.
#   subjectTest has 2947 observations and 1 variable (Subject number)
#   xTest has 2947 observations and 561 variables
#   yTest has 2947 observations and 1 variable (Activity Names)
#############################################################################################

# Column Binding the Test Datasets to create one Full Test Data set

fullTestDataset <- cbind(subjectTest,yTest,xTest)  # This will have 2947 observations & 563 variables

# Row Binding the fullTrainingDataset and fullTestDataset to create a Training Test Dataset

trainingTestDataset <- rbind(fullTrainingDataset,fullTestDataset) # Creates 10299 obs & 563 Variables

# Loading and Cleaning the activity Dataset 

activities <- read.table("./UCI HAR Dataset/activity_labels.txt",sep="")
names(activities) <- c("activityNumber","activityName")
activities$activityName <- gsub("_",".",activities$activityName)
activities$activityName <- tolower(activities$activityName)

# Cleaning Features Dataset and Creating a clean feature names variables

# Reading features text file
features <- read.table("./UCI HAR Dataset/features.txt",sep="")
featureV2 <- features$V2
featureV2 <- as.character(featureV2)
featureNames <- c("volunteerNumber","activityNumber",featureV2)

#############################################################################################
# calculating the Numeric vector for variables having Mean() and Std()
# Note we have to capture only the variables which represent the measurement of mean and std
# we have to ignore the variables which are not mean like meanFreq and angles
#############################################################################################

meanStdSelection <- grep("volunteerNumber|activityNumber|mean\\(\\)|std\\(\\)",featureNames)
ignoreFreqMean <- grep("meanFreq|gravityMean|tBodyAccMean|tBodyAccJerkMean|tBodyGyroMean|
tBodyGyroJerkMean",featureNames)   # Ignore the variables meanFreq
ignoreFreqMean <- ignoreFreqMean * c(-1)           # both mean and meanFreq

# Cleaning featureNames with descriptive names. Here we remove the underscore and make the
# variables meaningfull for the X,Y,Z Axial observations.

featureNames <- gsub("-X","OfAxialX",featureNames)
featureNames <- gsub("-Y","OfAxialY",featureNames)
featureNames <- gsub("-Z","OfAxialZ",featureNames)

featureNames <- gsub("\\(\\)","",featureNames)
featureNames <- gsub("-m",".M",featureNames)
featureNames <- gsub("-s","S",featureNames)

# Reassigning the names to the trainingTestData set
names(trainingTestDataset) <- featureNames

# Subsetting the traingingTestDataset for variables with mean() and std() & ignoring unwanted Cols
trainingTestDataset <- trainingTestDataset[,meanStdSelection]

#############################################################################################
# Create a activity dataset by ignoring the variables which are not mean values             
#############################################################################################

# ads = Activity Dataset
ads <- trainingTestDataset[,ignoreFreqMean]

########################################################
# Loop for building the human activity dataset
########################################################

# hads = Human Activity Dataset
hads <- data.frame() #creates an empty data frame

for (i in 1:30)
{
  for (j in 1:6)
  {
    # iads = Intermediate activity dataset
    iads <- ads[(ads$volunteerNumber== i & ads$activityNumber == j),]
    meanOfAds <- sapply(iads,mean)  # Find mean of intermediate activity dataset
    hads <- rbind(hads,c(i,j,meanOfAds[3:68]))  
  }
}

# Reassigning the names to the human activity dataset
names(hads) <- names(ads)

# Merging the activities dataset and the Human activity dataset for establishing the mapping
# between activity number and activity name
# mhads = merged human activity dataset
mhads <- merge(activities,hads,by.X="activityNumber",by.Y="activityNumber",all=TRUE,
               sort=TRUE,row.names=FALSE)
orderOfMhads <- order(mhads$volunteerNumber,mhads$activityNumber) # Order the dataset
finalDataset <- mhads[orderOfMhads,]

# Writing the final dataset to the working directory
write.table(finalDataset, file = "finalDataset.txt", sep = ",", col.names = TRUE,row.names=FALSE)

## All done ..... Peace !!!!!!!!!!
