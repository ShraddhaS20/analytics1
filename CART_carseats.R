# Decision Trees : 



library(ISLR)
data(Carseats)
head(Carseats)
names(Carseats)
?Carseats
data = Carseats

#Libraries for Decision Tree

library(rpart)
library(rpart.plot)

#Model

decisiontree = rpart(Sales ~ . , data=data, method='anova' )
#sales~ = consider all the variables other than sales
decisiontree
rpart.plot(decisiontree)

#this is large tree, so prune it: check cp
printcp(decisiontree)
prunetree = prune(decisiontree, cp=0.05)
prunetree
#a value of cp must be selected in a way that the cross validation(x error) is the least so that the important data is not lost.

rpart.plot(prunetree, nn=T)

#improve the plot
rpart.plot(prunetree, nn=T, cex=.8, type=4)



#https://www.datacamp.com/community/tutorials/decision-trees-R
