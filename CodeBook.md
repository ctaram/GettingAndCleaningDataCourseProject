## This a codebook file which gives details of all variables used in the program

### Program variables

Training dataset variables
* subjectTrain: consists of subject variables for Training dataset
* xTrain: consists of the observations taken for the volunteers
* yTrain: consists of all activities performed by volunteers during observation
* fullTrainingDataset: Combination of subject,data and activities

Test dataset variables
subjectTest: consists of subject variables for Test dataset
xTest: consists of the observations taken for the volunteers
yTest: consists of all activities performed by volunteers during observation
fullTestDataset: Combination of subject,data and activities

trainingTestDataset: combination of the training and the test dataset

activities: R table for the activites dataset
features: R table for the features dataset

meanStdSelection: Numeric vector with all the measurements which were taken for mean() and std()
ignoreFreqMean: Numeric vector to ignore couple mean variables which does not straight forward represent mean of measurements but their by-products

featureNames: A vector which collects the names of the features. This will be cleaned to present the feature names in a descriptive format

trainingTestDataset: This dataset will have only varibles which are actual mean or std for the observations taken for Volunteers for their activites
ads: Activity dataset after ignoring unwanted mean variables
hads: Human ativity dataset which performs mean of all variables collected in ads
iads: intermediate activity dataset
meanOfAds: result of sapply function for mean of intermediate activity dataset

mhads: merged human activity dataset
orderOfMhads: Order of the merged human activity dataset by volunteer number and activity number

finalDataset: final clean dataset to be stored on current working directory

### Activity Variables

* 1 = walking
* 2 = walking.upstairs
* 3 = walking.downstairs
* 4 = sitting
* 5 = standing
* 6 = laying

### Feature Variables

* activityNumber             
* activityName               
* volunteerNumber           
* tBodyAcc.MeanOfAxialX      
* tBodyAcc.MeanOfAxialY      
* tBodyAcc.MeanOfAxialZ     
* tBodyAccStdOfAxialX        
* tBodyAccStdOfAxialY        
* tBodyAccStdOfAxialZ       
* tGravityAcc.MeanOfAxialX   
* tGravityAcc.MeanOfAxialY   
* tGravityAcc.MeanOfAxialZ  
* tGravityAccStdOfAxialX     
* tGravityAccStdOfAxialY     
* tGravityAccStdOfAxialZ    
* tBodyAccJerk.MeanOfAxialX  
* tBodyAccJerk.MeanOfAxialY  
* tBodyAccJerk.MeanOfAxialZ 
* tBodyAccJerkStdOfAxialX    
* tBodyAccJerkStdOfAxialY    
* tBodyAccJerkStdOfAxialZ   
* tBodyGyro.MeanOfAxialX     
* tBodyGyro.MeanOfAxialY     
* tBodyGyro.MeanOfAxialZ    
* tBodyGyroStdOfAxialX       
* tBodyGyroStdOfAxialY       
* tBodyGyroStdOfAxialZ      
* tBodyGyroJerk.MeanOfAxialX 
* tBodyGyroJerk.MeanOfAxialY 
* tBodyGyroJerk.MeanOfAxialZ
* tBodyGyroJerkStdOfAxialX   
* tBodyGyroJerkStdOfAxialY   
* tBodyGyroJerkStdOfAxialZ  
* tBodyAccMag.Mean           
* tBodyAccMagStd             
* tGravityAccMag.Mean       
* tGravityAccMagStd          
* tBodyAccJerkMag.Mean       
* tBodyAccJerkMagStd        
* tBodyGyroMag.Mean          
* tBodyGyroMagStd            
* tBodyGyroJerkMag.Mean     
* tBodyGyroJerkMagStd        
* fBodyAcc.MeanOfAxialX      
* fBodyAcc.MeanOfAxialY     
* fBodyAcc.MeanOfAxialZ      
* fBodyAccStdOfAxialX        
* fBodyAccStdOfAxialY       
* fBodyAccStdOfAxialZ        
* fBodyAccJerk.MeanOfAxialX  
* fBodyAccJerk.MeanOfAxialY 
* fBodyAccJerk.MeanOfAxialZ  
* fBodyAccJerkStdOfAxialX    
* fBodyAccJerkStdOfAxialY   
* fBodyAccJerkStdOfAxialZ    
* fBodyGyro.MeanOfAxialX     
* fBodyGyro.MeanOfAxialY    
* fBodyGyro.MeanOfAxialZ     
* fBodyGyroStdOfAxialX       
* fBodyGyroStdOfAxialY      
* fBodyGyroStdOfAxialZ       
* fBodyAccMag.Mean           
* fBodyAccMagStd            
* fBodyBodyAccJerkMag.Mean   
* fBodyBodyAccJerkMagStd     
* fBodyBodyGyroMag.Mean     
* fBodyBodyGyroMagStd        
* fBodyBodyGyroJerkMag.Mean  
* fBodyBodyGyroJerkMagStd   
 



 	
