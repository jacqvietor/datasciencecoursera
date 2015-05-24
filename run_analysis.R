
library(plyr)
library(dplyr)

#TEST DATA
# read file with test subject ids
subjTest <- read.table("./subject_test.txt")
print(unique(subjTest$V1))
print(table(subjTest$V1))
print(nrow(subjTest))

# read datafile X_test.txt and set variable names
xtest <- read.table("./X_test.txt")
xtest2 <- select(xtest, V1:V6,V41:V46,V81:V86,V121:V126,V161:V166,
                 V201:V202,V214:V215,V227:V228,V240:V241,V253:V254,V266:V271,
                 V345:V350,V424:V429,V503:V504,V516:V517,V529:V530,V542:V543)

# read y_test.txt
ytest <- read.table("./Y_test.txt")
print(unique(ytrain$V1))
print(table(ytrain$V1))
print(nrow(ytrain))


#TRAININGS DATA
# read file with training subject ids
subjTrain <- read.table("./subject_train.txt")
#names(subjTrain)[1] <- "subject"
print(unique(subjTrain$V1))
print(table(subjTrain$V1))
print(nrow(subjTrain))

# read datafile X_train.txt and set variable names
xtrain <- read.table("./X_train.txt")
xtrain2 <- select(xtrain, V1:V6,V41:V46,V81:V86,V121:V126,V161:V166,
                 V201:V202,V214:V215,V227:V228,V240:V241,V253:V254,V266:V271,
                 V345:V350,V424:V429,V503:V504,V516:V517,V529:V530,V542:V543)

# read y_train.txt
ytrain <- read.table("./Y_train.txt")
print(unique(ytrain$V1))
print(table(ytrain$V1))
print(nrow(ytrain))

# combine the test and training subjects in 1 dataset
subj <- rbind(subjTest, subjTrain)

# combine the test and training activities in 1 dataset
ydata <- rbind(ytest, ytrain)



# combine the data from the accerelometer and gyroscope 
# of the test and the training subjects in 1 dataset
xdata <- rbind(xtest2, xtrain2)


# modify the column names into descriptive variable names
names(subj)[1] <- "subject"
names(ydata)[1] <- "actCode"

names(xdata)[1] <- "tBodyAccMeanX"
names(xdata)[2] <- "tBodyAccMeanY"
names(xdata)[3] <- "tBodyAccMeanZ"
names(xdata)[4] <- "tBodyAccStdX"
names(xdata)[5] <- "tBodyAccStdY"
names(xdata)[6] <- "tBodyAccStdZ"

names(xdata)[7] <- "tGravityAccMeanX"
names(xdata)[8] <- "tGravityAccMeanY"
names(xdata)[9] <- "tGravityAccMeanZ"
names(xdata)[10] <- "tGravityAccStdX"
names(xdata)[11] <- "tGravityAccStdY"
names(xdata)[12] <- "tGravityAccStdZ"

names(xdata)[13] <- "tBodyAccJerkMeanX"
names(xdata)[14] <- "tBodyAccJerkMeanY"
names(xdata)[15] <- "tBodyAccJerkMeanZ"
names(xdata)[16] <- "tBodyAccJerkStdX"
names(xdata)[17] <- "tBodyAccJerkStdY"
names(xdata)[18] <- "tBodyAccJerkStdZ"

names(xdata)[19] <- "tBodyGyroMeanX"
names(xdata)[20] <- "tBodyGyroMeanY"
names(xdata)[21] <- "tBodyGyroMeanZ"
names(xdata)[22] <- "tBodyGyroStdX"
names(xdata)[23] <- "tBodyGyroStdY"
names(xdata)[24] <- "tBodyGyroStdZ"

names(xdata)[25] <- "tBodyGyroJerkMeanX"
names(xdata)[26] <- "tBodyGyroJerkMeanY"
names(xdata)[27] <- "tBodyGyroJerkMeanZ"
names(xdata)[28] <- "tBodyGyroJerkStdX"
names(xdata)[29] <- "tBodyGyroJerkStdY"
names(xdata)[30] <- "tBodyGyroJerkStdZ"

names(xdata)[31] <- "tBodyAccMagMean"
names(xdata)[32] <- "tBodyAccMagStd"

names(xdata)[33] <- "tGravityAccMagMean"
names(xdata)[34] <- "tGravityAccMagStd"

names(xdata)[35] <- "tBodyAccjerkMagMean"
names(xdata)[36] <- "tBodyAccjerkMagStd"

names(xdata)[37] <- "tBodyGyroMagMean"
names(xdata)[38] <- "tBodyGyroMagStd"

names(xdata)[39] <- "tBodyGyroJerkMagMean"
names(xdata)[40] <- "tBodyGyroJerkMagStd"

names(xdata)[39] <- "tBodyGyroJerkMagMean"
names(xdata)[40] <- "tBodyGyroJerkMagStd"

names(xdata)[41] <- "fBodyAccMeanX"
names(xdata)[42] <- "fBodyAccMeanY"
names(xdata)[43] <- "fBodyAccMeanZ"
names(xdata)[44] <- "fBodyAccStdX"
names(xdata)[45] <- "fBodyAccStdY"
names(xdata)[46] <- "fBodyAccStdZ"

names(xdata)[47] <- "fBodyAccJerkMeanX"
names(xdata)[48] <- "fBodyAccJerkMeanY"
names(xdata)[49] <- "fBodyAccJerkMeanZ"
names(xdata)[50] <- "fBodyAccJerkStdX"
names(xdata)[51] <- "fBodyAccJerkStdY"
names(xdata)[52] <- "fBodyAccJerkStdZ"

names(xdata)[53] <- "fBodyGyroMeanX"
names(xdata)[54] <- "fBodyGyroMeanY"
names(xdata)[55] <- "fBodyGyroMeanZ"
names(xdata)[56] <- "fBodyGyroStdX"
names(xdata)[57] <- "fBodyGyroStdY"
names(xdata)[58] <- "fBodyGyroStdZ"

names(xdata)[59] <- "fBodyAccMagMean"
names(xdata)[60] <- "fBodyAccMagStd"

names(xdata)[61] <- "fBodyBodyAccJerkMagMean"
names(xdata)[62] <- "fBodyBodyAccJerkMagStd"

names(xdata)[63] <- "fBodyBodyGyroMagMean"
names(xdata)[64] <- "fBodyBodyGyroMagStd"

names(xdata)[65] <- "fBodyBodyGyroJerkMagMean"
names(xdata)[66] <- "fBodyBodyGyroJerkMagStd"


# merge the subjext, activity and measurement data into 1 dataset
data <- cbind(subj, ydata, xdata)
#print(names(data))

# print table - quick QC check
print(table(data$actCode, data$subject))

# create a new variable that stores the activity name based on the value of 
# the activity code
act1 <- data[data$actCode == 1,]
act1$activity <- "WALKING"
act2 <- data[data$actCode == 2,]
act2$activity <- "WALKING UPSTAIRS"
act3 <- data[data$actCode == 3,]
act3$activity <- "WALKING DOWNSTAIRS"
act4 <- data[data$actCode == 4,]
act4$activity <- "SITTING"
act5 <- data[data$actCode == 5,]
act5$activity <- "STANDING"
act6 <- data[data$actCode == 6,]
act6$activity <- "LAYING"

# merge the activity datasets into 1 dataset
data <- rbind(act1,act2,act3,act4,act5,act6)

# print table - QC check
print(table(data$activity, data$subject))

# drop the column with the activity code
data2 = select(data, -actCode)

# calculate the mean value of each variable per subject / activity combination
meandata <- aggregate(data2[,2:67], list(data2$subject, data2$activity), mean)

# rename the variable names of the groups (resulting from the previous calculation)
names(meandata)[1] <- "subject"
names(meandata)[2] <- "activity"

# write output file samsung.txt
write.table(meandata, file = "samsung.txt", row.name=FALSE)