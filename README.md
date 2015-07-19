# This is an instruction file on how running run_analysis.R script file
## Step 1) Source run_analysis.R in Rstudio
### Please, note that the script requires PLYR to run: if not present must be installed prior running the script.
## Step 2) Run "tidyMeans <- runAnalysis()" command in Rstudio
### runAnalysis() function will verify if all directories exists
#### 1. data_har (Download directory)
#### 2. UCI HAR Dataset (Directory where ZIP file will be extracted)
### 3. tidyDataDir (Output directory)
### If any directory is missing it will be created
### runAnalysis() function will verify if download file exists and if not will download it
### runAnalysis() function will verify if uncompressed file exists and if not will unzip it
### output of tidy dataset (with no mean applied) will be saved as table and CSV in tidyDataDir (TABLE = tidy.txt, CSV=tidy.csv)
### output of tidy dataset (with means applied) will be saved as table and CSV in tidyDataDir (TABLE = tidyMeans.txt, CSV=tidyMeans.csv)
### tidyMeans dataset is returned in tidyMeans variable
## Step 3) run "tidyMeans <- checkData()" function to verify that tidyMeans.txt file is readable