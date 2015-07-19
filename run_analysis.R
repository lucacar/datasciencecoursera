XTrainData <- XTestData <- NULL
runAnalysis <- function() {
  # Get and extract data
  
  filePath <- function(...) { paste(..., sep = "/") }
  
  downloadData <- function() {
    # Create directories, suppress warning in case they exist
    downloadDir <- "data_har"
    dataDir <- "UCI HAR Dataset"
    dir.create(file.path(downloadDir), showWarnings = FALSE)
    dir.create(file.path(dataDir), showWarnings = FALSE)
    
    url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
    #Download file if it doesn't exist and uncompress it
    zipFile <- filePath(downloadDir, "dataset.zip")
    if(!file.exists(zipFile)) { download.file(url, zipFile) }  
    if(!file.exists(dataDir)) { unzip(zipFile, exdir = ".") }
    
    dataDir
  }
  
  readData <- function(path) {
    read.table(filePath(dataDir, path))
  }
  
  # Download data if not present, create directories if not exists and set dataDir value
  dataDir <- downloadData()  
  # Read and cache XTrainData and XTestData data
  if(is.null(XTrainData)) { XTrainData <<- readData("train/X_train.txt") }
  if(is.null(XTestData))  { XTestData  <<- readData("test/X_test.txt") }
  # Merge the training and the test sets to create one data set.
  merged <- rbind(XTrainData, XTestData)
  
  featureNames <- readData("features.txt")[, 2]
  names(merged) <- featureNames
  
  # Extract only the measurements on the mean and standard deviation for each measurement.
  # Limit to columns with feature names matching mean() or std():
  matches <- grep("(mean|std)\\(\\)", names(merged))
  limited <- merged[, matches]
  
  # Use descriptive activity names to name the activities in the data set.
  # Get the activity data and map to nicer names:
  yTrainData <- readData("train/y_train.txt")
  yTestData  <- readData("test/y_test.txt")
  yMerged <- rbind(yTrainData, yTestData)[, 1]
  
  activityNames <-
    c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
  activities <- activityNames[yMerged]
  
  # Appropriately label the data set with descriptive variable names.
  # Change t to Time, f to Frequency, mean() to Mean and std() to StdDev using "_" to evidence them
  # Remove extra dashes and BodyBody naming error from original feature names
  names(limited) <- gsub("^t", "Time", names(limited))
  names(limited) <- gsub("^f", "Frequency", names(limited))
  names(limited) <- gsub("-mean\\(\\)", "Mean", names(limited))
  names(limited) <- gsub("-std\\(\\)", "StdDev", names(limited))
  names(limited) <- gsub("-", "", names(limited))
  names(limited) <- gsub("BodyBody", "Body", names(limited))
  
  # Add activities and subject with nice names
  subjectTrain <- readData("train/subject_train.txt")
  subjectTest  <- readData("test/subject_test.txt")
  subjects <- rbind(subjectTrain, subjectTest)[, 1]
  
  tidy <- cbind(Subject = subjects, Activity = activities, limited)
  
  # Create a second, independent tidy data set with the average of each variable for each activity and each subject.
  library(plyr)
  # Column means for all but the subject and activity columns
  limitedColMeans <- function(data) { colMeans(data[,-c(1,2)]) }
  tidyMeans <- ddply(tidy, .(Subject, Activity), limitedColMeans)
  names(tidyMeans)[-c(1,2)] <- paste0("Mean", names(tidyMeans)[-c(1,2)])
  
  # Create output dir if it doesn't exist
  outDir <- "tidyDataDir"
  dir.create(file.path(outDir), showWarnings = FALSE)
  # Write files as table and csv
  write.table(tidy, filePath(outDir, "tidy.txt"), row.names = FALSE)
  write.csv(tidy, filePath(outDir, "tidy.csv"), row.names = TRUE)
  write.table(tidyMeans, filePath(outDir, "tidyMeans.txt"), row.names = FALSE)
  write.csv(tidyMeans, filePath(outDir, "tidyMeans.csv"), row.names = TRUE)
  
  # Also return data
  tidyMeans
}

# Use to check that the tidyMeans.txt is properly readable
checkData <- function() {
  outDir <- "tidyDataDir"
  
  read.table(filePath(outDir, "tidyMeans.txt"), header = TRUE)
}
