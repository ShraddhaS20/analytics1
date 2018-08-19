#Data structures 

#vectors----
v1=1:10000   #create  integer vector from 1 to 10000
v2=c(1,4,5,10)   #numeric vector
class(v1)
class(v2)
v3=c('a','shraddha','dost')
v3                          #print the vector
class(v3)
v4=c(TRUE,FALSE,T, F)
class(v4)


#summary on vectors
mean(v1)
median(v1)
sd(v1)
var(v1)
hist(v1)
hist(women$height)
v2[v2>=5]

x=rnorm(60, mean=60, sd=10)
x
plot(x)
hist(x)
plot(density(x))
abline(v=60)
#rectangles and density together
hist(x, freq=F)
lines(density(x))

hist(x,breaks=10, col=1:10)
length(x)
sd(x)
?sample
x1=LETTERS[5:20]
x1


set.seed(1234)
y1= sample(x1)
y1


set.seed(5)
(y2=sample(x1, size=5))

(gender=sample(c('M','F'), size=1000000, replace=T , prob=c(.6, .4)))
(t1=table(gender))
prop.table(t1) #gives freq distribution of the gender vector created, probability
pie(t1)
barplot(t1, col=1:2, horiz=T)


#matrix---- can be of 1 datatype (num,logical or char)

(m1=matrix(1:24,nrow=4))
(m2=matrix(1:24,nrow=4, byrow=T))
(m2=matrix(1:24,ncol=4, byrow=T))
(x=trunc(runif(60,60,100)))
#round, trunc, ceiling, floor
plot(density(x))
(m4=matrix(x, ncol=6))
colSums(m4)
rowSums(m4)
colMeans(m4)
rowMeans(m4)
m4[m4> 67 & m4<86]
m4[8:10,]
m4[8:10,c(1,3,5)]
rowSums(m4[8:10,c(1,3,5)])

#array----

#data.frame----
#rollno, name, gender, course, marks1, marks2
(rollno= 1:60)
(name=paste('student1',1:60,sep='-'))
(gender=sample(c('Male','Female'),size=60, replace=T, prob=c(.3,.7)))
(course=sample(c('BBA','MBA','FPM'),size=60, replace=T,prob=c(.4,.5,.1)))











#extracommands 
name[1:10]
name[c(15,20,36)]
name[-1]    #removes 1 value (the first one)
name[-c(1:10)]
rev(name)
name[60:1]
name[-c(1:10,35:40)]

