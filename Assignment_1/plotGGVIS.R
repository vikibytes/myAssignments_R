library(ggvis)
head(techMVB)
ggvis(techMVB, props(x = techMVB$`Company Advertising`, y = te$`1-Yr Value Change`)) + mark_point()
