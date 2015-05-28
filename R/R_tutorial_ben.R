# delete all variables in the workspace first
rm(list=ls())

library('RPostgreSQL')

passwd  <- read.csv('~/Desktop/pw.txt', header=F, stringsAsFactors=F)
drv <- dbDriver('PostgreSQL')
con <- dbConnect(drv,
                 host = "dssgsummer2014postgres.c5faqozfo86k.us-west-2.rds.amazonaws.com",
                 dbname = "training_2015",
                 user = "kuester",
                 password = passwd)

data <- dbGetQuery(con, "SELECT * FROM benedict.building_violations_sample;")

# remove spaces from column names (gsub substitute all occurences; sub only the first)
names(data)  <- gsub(' ','.',names(data))

# have a look at what we loaded...
View(head(data))
View(tail(data))

# remove SSA column
## data <- data[, !(names(data) %in% 'SSA')]
# same 
data['SSA'] <- NULL

# how much time difference between the Violation Date and the Violation Status Date?
diffs <- data$VIOLATION.DATE - data$VIOLATION.STATUS.DATE
diffs <- as.numeric(diffs)
hist(diffs)

# count where the inspector comments are missing or empty
sum(is.na(data$VIOLATION.INSPECTOR.COMMENTS) | data$VIOLATION.INSPECTOR.COMMENTS == '')

# disconnect from DB
dbDisconnect(con)
