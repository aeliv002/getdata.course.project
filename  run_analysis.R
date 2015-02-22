library(dplyr)

# This is where data folder is 
data.folder.path <- "./data/UCI HAR Dataset"


# Loading data to R starts
activity.Labels <- read.table(
    paste(data.folder.path,"activity_labels.txt",sep="/"),
    sep=" ",
    header=FALSE,
    col.names = c("id","activity.label"))

features.labels <- read.table(
    paste(data.folder.path,"features.txt",sep="/"),
    sep=" ",
    header=FALSE,
    col.names =  c("id","featureLabel"))

x.test <- read.table(
    paste(data.folder.path,"/test/X_test.txt",sep="/"),
    header=FALSE)

y.test <- read.table(
    paste(data.folder.path,"/test/y_test.txt",sep="/"),
    header=FALSE)

subject.test <- read.table(
    paste(data.folder.path,"/test/subject_test.txt",sep="/"),
    header=FALSE)

x.train <- read.table(
    paste(data.folder.path,"/train/X_train.txt",sep="/"),
    header=FALSE)

y.train <- read.table(
    paste(data.folder.path,"/train/y_train.txt",sep="/"),
    header=FALSE)

subject.train <- read.table(
    paste(data.folder.path,"/train/subject_train.txt",sep="/"),
    header=FALSE)

# Loading data to R ends.

# Renaming x.test, x.train 

names(x.test) <- features.labels$featureLabel
names(x.train) <- features.labels$featureLabel

# Merging test.data and train.data to one dataset

test.data <- cbind(
    rename(subject.test,subject.id=V1),
    select(left_join(
        y.test,
        activity.Labels,
        by = c("V1" = "id")),2),
    x.test)

train.data <- cbind(
    rename(subject.train,subject.id=V1),
    select(left_join(
        y.train,
        activity.Labels,
        by = c("V1" = "id")),2),
    x.train)

all.features.data <- rbind(
    test.data,
    train.data)

# Finding mean() and std() columns.
patern.values <- c('mean()','std()')

needed.column.numbers <- c(
    1, # subject ID col
    2, # feature name col
    grep(patern.values[1],features.labels$featureLabel,fixed = TRUE) + 2, # mean() columns
    grep(patern.values[2],features.labels$featureLabel,fixed = TRUE) + 2  # std() columns
    )

# Tidy data select only needed columns
all.features.data.tidy <- all.features.data[,needed.column.numbers]

# summary data
all.features.data.tidy.summary <- all.features.data.tidy %>% 
    group_by(subject.id,activity.label) %>% 
    summarise_each(funs(mean))

# table(all.features.data.tidy$subject.id,all.features.data.tidy$activity.label)
# 
valid.names <- make.names(gsub(
                    "...",
                    ".",
                    make.names(names(all.features.data.tidy.summary)),fixed=TRUE),unique=TRUE,allow_ = FALSE
                    )
                    
# 
names(all.features.data.tidy) <- valid.names
# 
names(all.features.data.tidy.summary) <- valid.names
