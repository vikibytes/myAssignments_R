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








