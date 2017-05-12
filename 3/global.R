library(dplyr)
library("rio")
#a <- read.csv("annual_all_2005.csv")

#export(a, "annual_all_2016.csv")
#allzips
#convert("annual_all_1995.csv", "annual_all_1995.rds")
# 
# data2016 <- readRDS("annual_all_2016.rds")
# data2010 <- readRDS("annual_all_2010.rds")
# data2005 <- readRDS("annual_all_2005.rds")
# data2000 <- readRDS("annual_all_2000.rds")
# data1995 <- readRDS("annual_all_1995.rds")

# tidy.name.vector <-make.names(names(data2010), unique=TRUE) 
# colnames(data2010) <-  tidy.name.vector
# data2010 = data2010 %>% filter(Parameter.Code == 44201)
# 
# tidy.name.vector <-make.names(names(data2000), unique=TRUE) 
# colnames(data2000) <-  tidy.name.vector
# data2000 = data2000 %>% filter(Parameter.Code == 44201)
# 
# tidy.name.vector <-make.names(names(data2005), unique=TRUE) 
# colnames(data2005) <-  tidy.name.vector
# data2005 = data2005 %>% filter(Parameter.Code == 44201)
# 
# tidy.name.vector <-make.names(names(data1995), unique=TRUE) 
# colnames(data1995) <-  tidy.name.vector
# data1995 = data1995 %>% filter(Parameter.Code == 44201)
# 
# data2016 = data2016 %>% filter(Parameter.Code == 44201)


mapColor <- c(
  "#ff0000",
  "#cc0000",
  "#990000",
  "#660000",
  "#330000",
  "#7f0000"
  )

data2016$Latitude <- jitter(data2016$Latitude)
data2016$Longitude <- jitter(data2016$Longitude)

#allzips$college <- allzips$college * 100
#allzips$zipcode <- formatC(allzips$zipcode, width=5, format="d", flag="0")
#row.names(allzips) <- allzips$zipcode

cleantable <- data2016 %>%
  select(
    City = City.Name,
    State = State.Name,
    County = County.Name,
    #Zipcode = zipcode,
    latitude = Latitude,
    longitude= Longitude,
    Parameter.Code = Parameter.Code,
    Units = Units.of.Measure,
    Observation.Count = Observation.Count
    
    )


#head(data2016$Parameter.Code)
#data2016 = data2016 %>% filter(Parameter.Code == 44201) 

#head(d)




