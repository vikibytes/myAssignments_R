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










