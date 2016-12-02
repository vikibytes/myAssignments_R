setwd("C://Users//vikas//Desktop//EPBA//Assignment_1")
save.image()
getwd()
library(XML)
library(RCurl)
myWebPage <- 'C://Users//vikas//Desktop//EPBA//Assignment_1//The World\'s Most Valuable Brands List - Forbes.html'
forbesRawData <- readHTMLTable(myWebPage)
forbesRawTable <- forbesRawData$the_list

str(forbesRawTable)
# class(forbesRawTable)
forbesRawTable <- forbesRawTable[,-1]
forbesRawTable$Rank <- gsub('#','',forbesRawTable$Rank)
write.csv(forbesRawTable, file = "ForbesMV100.csv")
head(forbesRawTable)
# factor(forbesRawTable$Industry)
forbesRawTable$`Brand Value` <- gsub("$","",forbesRawTable$`Brand Value`)
myTable <- forbesRawTable

myTable$`Brand Value`[1]
grep('$',myTable$`Brand Value`)
#mychar <- c("My_test", "My_Test_3", "_qwerty_pop_")
## Converting myTable$`Brand Value` into Numeric
myTable$`Brand Value` <- sub(pattern="[$]", replacement="", x=myTable$`Brand Value`)
myTable$`Brand Value` <- sub(pattern="[ B]", replacement="", x=myTable$`Brand Value`)
myTable$`Brand Value` <- sub(pattern="[B]", replacement="", x=myTable$`Brand Value`)
myTable$`Brand Value` <- as.numeric(myTable$`Brand Value`)

# Conerting myTable$`1-Yr Value Change' into numeric
myTable$`1-Yr Value Change` <- as.numeric(sub(pattern = "[%]",replacement = '', x = myTable$`1-Yr Value Change`))

length(grep('B',myTable$`Brand Revenue`))
length(grep('-',myTable$`Brand Revenue`))
myTable$`Brand Revenue` <- sub(pattern = "B", replacement = '', x = myTable$`Brand Revenue`)
myTable$`Brand Revenue` <- sub(pattern = "[$]", replacement = '', x = myTable$`Brand Revenue`)
myTable$`Brand Revenue` <- as.numeric(myTable$`Brand Revenue`)

# Converting Company Advertizing in Numeric
# Remove $ signs
# Find billion values
myTable$`Company Advertising` <- sub(pattern = "[$]", replacement = '', x = myTable$`Company Advertising`)
a = length(grep(pattern = "B",x = myTable$`Company Advertising`))
grep(pattern = "B",x = myTable$`Company Advertising`)
myTable$`Company Advertising` <- sub(pattern = "B", replacement = '', x = myTable$`Company Advertising`)
# Find million Values
b = length(grep(pattern = "M",x = myTable$`Company Advertising`))
grep(pattern = "M",x = myTable$`Company Advertising`)
# Find Blank values
c = length(grep(pattern = "-",x = myTable$`Company Advertising`))
grep(pattern = "-",x = myTable$`Company Advertising`)
a+b+c


#vCleaning up B Values
length(grep(pattern = "B",x = myTable$`Company Advertising`))
a = grep(pattern = "B",x = myTable$`Company Advertising`)

for (i in a) {
  myTable$`Company Advertising`[i] <- sub(pattern = "B", replacement = '', x = myTable$`Company Advertising`[i])
}
myTable$`Company Advertising`

#Cleaning Up M Values
length(grep(pattern = "M",x = myTable$`Company Advertising`))
b = grep(pattern = "M",x = myTable$`Company Advertising`)

for (i in b) {
  myTable$`Company Advertising`[i] <- sub(pattern = "M", replacement = '', x = myTable$`Company Advertising`[i])
}

myTable$`Company Advertising` <- as.numeric(myTable$`Company Advertising`)

# Converting Million Values into Billions

for (i in b) {
  myTable$`Company Advertising`[i] <- myTable$`Company Advertising`[i] / 1000
}
myTable$`Company Advertising`

library(dplyr)
print(myLevels)
factor(myTable$Industry)
myTable$Industry <- as.character(myTable$Industry)
class(myTable$Industry)
techMVB <- filter(myTable, myTable$Industry == "Technology")
luxMVB <- filter(myTable, myTable$Industry == "Luxury")
AutoMVB <- filter(myTable, myTable$Industry == "Automotive")
finServMVB <- filter(myTable, myTable$Industry == "Financial Services")

ggplot(data=techMVB, aes(x = techMVB$`Brand Revenue`, y = techMVB$`Company Advertising`)) + 
  # geom_point(aes(color = techMVB$`Company Advertising`)) +
  geom_smooth(method = "lm") +
  coord_cartesian() + 
  scale_color_gradient() + 
  theme_bw() + 
  geom_point(aes(size = techMVB$`Company Advertising`))
 # geom_text(aes(labels(techMVB$Brand)))



