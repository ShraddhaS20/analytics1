#Clustering

marks1=c(3,1,4,5,9,2,6)
marks= data.frame(marks1)
length(marks1)
plot(marks1)
k1=kmeans(marks,centers =2) #kmeans only runs on the numerical value.
k1
cbind(marks, k1$cluster)
(marks2= sample(1:10, size=7))
newmarks= data.frame(marks1, marks2)
newmarks
