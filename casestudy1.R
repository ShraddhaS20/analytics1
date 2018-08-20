
library(gsheet)

url= 'https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907'
denco = as.data.frame(gsheet2tbl(url))
head(denco)
denco %>% count(custname, sort= TRUE) #to find the most loyal cust by the no. of times they purchased.
denco %>% group_by(custname) %>% summarise(n= n()) %>% arrange(desc(n)) 
#summarise by part num

df3a= aggregate(denco$revenue, by=list(denco$partnum), FUN=sum)
head(df3a)


denco %>% group_by(partnum) %>% summarise(n=n()) %>% arrange(desc(n))

