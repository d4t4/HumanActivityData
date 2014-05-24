# Variables, Data, and any Transformations

## Raw data

`features` contains the raw data from "features.txt"

`activities` contains the raw data from "activity_labels.txt"

`trainData` contains raw data from "train/X_train.txt"

`trainDataActivity` contains raw data from "train/y_train.txt"

`trainDataSubject` contains raw data from "train/subject_train.txt"

`testData` contains raw data from "test/X_test.txt"

`testDataActivity` contains raw data from "test/y_test.txt"

`testDataSubject` contains raw data from "test/subject_test.txt"


## Combined data

`XMerge` combines the rows of `trainData` and `testData`

`yMerge` combines the rows of `trainDataActivity` and `testDataActivity`

`subjectMerge` combines the rows of `trainDataSubject` and `testDataSubject`


## Extracted data

`XMergeSub` is a subset of `XMerge`, and contains the features containing means or 
standard deviations. Since the dataset contains a mix of means and standard deviations calculated directly from the data, and frequency means, etc., which are caluclated indirectly, it is left to the analyst to determine which is most appropriate (Option A or Option B in the script). Grep is used for string matching on the following rules:

*  Option A: string matches "-mean()" and "-std()" (does not include indirect measurements, and is the default)

*  Option B: string matches "-mean" and "-std" (includes indirect measurements)


## Names and labeled data

`activityName` is created to contain activity names and is added to `yMerge`

`labeledDataset` is a row binding of the `XMergeSub` subset, the activity names from `yMerge`,
and the subject labels from `subjectMerge`


## Tidy data

`tidyDataset` is an aggregation of `XMergeSub`, grouped by the activities in `yMerge`, and the subjects in `subjectMerge`, with a mean applied to each group

"tidy_dataset.txt" is created from a table write of `tidyDataset`