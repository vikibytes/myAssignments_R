> save.image()
> getwd()
> dir()
> setwd("C://Users//vikas//Desktop//EPBA//Assignment_1")
> save.image()
> getwd()
[1] "C:/Users/vikas/Desktop/EPBA/Assignment_1"
> dir()
> setwd("C://Users//vikas//Desktop//EPBA//Assignment_1")
> save.image()
> getwd()
> library(XML)
> myWebPage <- 'C://Users//vikas//Desktop//EPBA//Assignment_1//The World\'s Most Valuable Brands List - Forbes.html'
> forbsRawPage <- readHTMLTable(myWebPage)
> mostVal_Raw <- forbsRawPage$the_list
> write.csv(mostVal_Raw, file = "ForbesMV100.csv")
> 
> mostVal_Raw_1 <- mostVal_Raw$Rank
> mostVal_Raw_1
> typeof(mostVal_Raw_1)
> mostVal_Raw_1[1] + mostVal_Raw_1[2]
> str(mostVal_Raw_1)
> mostVal_Raw_1[1:5]
> View(mostVal_Raw)
> myRanks <- mostVal_Raw$Rank
> gsub('#','',mostVal_Raw$Rank)
> View(mostVal_Raw)
> View(mostVal_Raw)
> mostVal_Raw$Rank <- gsub('#','',mostVal_Raw$Rank)
> mostVal_Raw[,1]               
Levels: 
> mostVal_Raw[,-1]
> 
> 
> mostVal_Raw <- mostVal_Raw[,-1]
> gsub('#','',mostVal_Raw$Rank)