#Cleaning and Getting Data course project code book
##Analysis process

###The script runanalysis.R download and reads the processed experiment data and performs a number of steps to clean the data set and apply means. Please, note that the script requires PLYR to run: if not present must be installed prior running the script.

##Steps executed by runanalysis.R
####Directories used to support input and ouptput are verified and if missing created under working directory
####Data files are verified and if do not exist downloaded from the repository (HTTP url)
####Both the processed test and training datasets are read in and merged into one data frame.
####The data columns are then assigned names based on the features.txt file part of the dowloaded compressed package.
####Columns that hold mean or standard deviation measurements are selected from the data set, all other measurement columns are excluded.
####The activity identifiers are replaced with activity labels as reported in the activitylabels.txt file part of the dowloaded compressed package.
####Invalid characters "()" and "-" are removed from the column names. 
####Duplicate phrase "BodyBody" is replaced with Body.
####Characters such as "^t" and "^f" are replaced with "Time" and "Frequency"
####"mean" and "std" are changed to "Mean" and "StdDev" to create friendlier varaible names
####Data is then grouped by subject and activity, mean is calculated for every measurement colum.
####Summary dataset is written to a files in output directory (tidyDataDir)
##### tidyMeans.csv: CSV file (data grouped with mean applied)
##### tidyMeans.txt: TXT file (data grouped with mean applied)
##### tidy.csv: CSV file (complete dataset)
##### tidy.csv: TXT file (complete dataset)

##Columns in output file
####Subject	- The id of the experiment participant.
####Activity - The name of the activity that the measurements correspond to
###All of the following fields represent the mean of recorded data points for the given subject and activity. The detailed description of the different measurement types can be found in the featuresinfo.txt file included in the data zip file.
####MeanTimeBodyAccMeanX	
####MeanTimeBodyAccMeanY	
####MeanTimeBodyAccMeanZ	
####MeanTimeBodyAccStdDevX	
####MeanTimeBodyAccStdDevY	
####MeanTimeBodyAccStdDevZ	
####MeanTimeGravityAccMeanX	
####MeanTimeGravityAccMeanY	
####MeanTimeGravityAccMeanZ	
####MeanTimeGravityAccStdDevX	
####MeanTimeGravityAccStdDevY	
####MeanTimeGravityAccStdDevZ	
####MeanTimeBodyAccJerkMeanX	
####MeanTimeBodyAccJerkMeanY	
####MeanTimeBodyAccJerkMeanZ	
####MeanTimeBodyAccJerkStdDevX	
####MeanTimeBodyAccJerkStdDevY	
####MeanTimeBodyAccJerkStdDevZ	
####MeanTimeBodyGyroMeanX	
####MeanTimeBodyGyroMeanY	
####MeanTimeBodyGyroMeanZ	
####MeanTimeBodyGyroStdDevX	
####MeanTimeBodyGyroStdDevY	
####MeanTimeBodyGyroStdDevZ	
####MeanTimeBodyGyroJerkMeanX	
####MeanTimeBodyGyroJerkMeanY	
####MeanTimeBodyGyroJerkMeanZ	
####MeanTimeBodyGyroJerkStdDevX	
####MeanTimeBodyGyroJerkStdDevY	
####MeanTimeBodyGyroJerkStdDevZ	
####MeanTimeBodyAccMagMean	
####MeanTimeBodyAccMagStdDev	
####MeanTimeGravityAccMagMean	
####MeanTimeGravityAccMagStdDev	
####MeanTimeBodyAccJerkMagMean	
####MeanTimeBodyAccJerkMagStdDev	
####MeanTimeBodyGyroMagMean	
####MeanTimeBodyGyroMagStdDev	
####MeanTimeBodyGyroJerkMagMean	
####MeanTimeBodyGyroJerkMagStdDev	
####MeanFrequencyBodyAccMeanX	
####MeanFrequencyBodyAccMeanY	
####MeanFrequencyBodyAccMeanZ	
####MeanFrequencyBodyAccStdDevX	
####MeanFrequencyBodyAccStdDevY	
####MeanFrequencyBodyAccStdDevZ	
####MeanFrequencyBodyAccJerkMeanX	
####MeanFrequencyBodyAccJerkMeanY	
####MeanFrequencyBodyAccJerkMeanZ	
####MeanFrequencyBodyAccJerkStdDevX	
####MeanFrequencyBodyAccJerkStdDevY	
####MeanFrequencyBodyAccJerkStdDevZ	
####MeanFrequencyBodyGyroMeanX	
####MeanFrequencyBodyGyroMeanY	
####MeanFrequencyBodyGyroMeanZ	
####MeanFrequencyBodyGyroStdDevX	
####MeanFrequencyBodyGyroStdDevY	
####MeanFrequencyBodyGyroStdDevZ	
####MeanFrequencyBodyAccMagMean	
####MeanFrequencyBodyAccMagStdDev	
####MeanFrequencyBodyAccJerkMagMean	
####MeanFrequencyBodyAccJerkMagStdDev	
####MeanFrequencyBodyGyroMagMean	
####MeanFrequencyBodyGyroMagStdDev	
####MeanFrequencyBodyGyroJerkMagMean	
####MeanFrequencyBodyGyroJerkMagStdDev


####Detailed information on the experiment and the data can be found in the README.txt and featuresinfo.txt files included in the experiment data zip file.