setwd('/Users/michael/Documents/git_dssg/bootcamp-BlueBottle')
data <- 'data/Building_Violations_sample_50000.csv'

library('RPostgreSQL')

drv <- dbDriver('PostgreSQL')
con  <- dbConnect(drv,
                  host = "dssgsummer2014postgres.c5faqozfo86k.us-west-2.rds.amazonaws.com",
                  dbname = "training_2015",
                  user = "stepner",
                  password = "stepner")

data <- dbGetQuery(con, "SELECT * from mstepner.building_violations_sample;")
dbDisconnect(con)

View(head(data))
dim(data)

class(data$mattgee_key)
class(data['mattgee_key'])

sapply(data,class)
      
# Drop the SSA column
data <- data[, !(names(data) %in% 'SSA')]
View(head(data))

# Explore data

summary(data)
sum(is.na(data['VIOLATION INSPECTOR COMMENTS']))
View(sort(table(data$'VIOLATION INSPECTOR COMMENTS'),decreasing=TRUE))
