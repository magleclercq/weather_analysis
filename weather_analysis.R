#set appropriate working directory
setwd("./R exercices/Advanced R/section_4/weather_data")
getwd()

#Read data
Chicago <- read.csv("Chicago-F.csv", row.names = 1)
NewYork <- read.csv("NewYork-F.csv", row.names = 1)
SanFrancisco <- read.csv("SanFrancisco-F.csv", row.names = 1)
Houston <- read.csv("Houston-F.csv", row.names = 1)

#Check
Chicago
NewYork
Houston
SanFrancisco

#Convert dataframes to matrixes
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#Put all data into a list
Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)

### Deliverable 1
### table showing the annual averages of each observed metric for every city
deliverable_1 <- round(sapply(Weather, rowMeans), 2) 

### Deliverable 2
### table showing by how much temperatures fluctuates
### each month from min to max (in%). Take min as the base
deliverable_2 <- sapply(Weather, function(x) round((x[1, ]-x[2,])/x[2,], 2), simplify = T)

### Deliverable 3
### Table showing the annual maximums of each observed metric for every city
deliverable_3 <- sapply(Weather, apply, 1, max)

### Deliverable 4
### Same as deliverable 3 but with mins
deliverable_4 <- sapply(Weather, apply, 1, min)

### Deliverable 5
### Table showing in which months the annual maximums of each metric were obseved in every city
sapply(Weather, apply, 1, function(x) names(which.max(x)))