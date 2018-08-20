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


#summary on vectors----
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
(marks1= ceiling(rnorm(60,mean=65, sd=7)))
(marks2= ceiling(rnorm(60, mean=60, sd=11)))
(grades=sample(c('A','B','C'), size=60, replace=T))
students= data.frame(rollno,name,  gender, course, marks1, marks2, grades, stringsAsFactors = F)
class(students)

summary(students)
students[, c('name')]
students[students$gender == 'Male', c('rollno', 'gender','marks1')]
students[students$gender == 'Male' & students$grades =='C', c('rollno', 'gender','marks1')]
students[students$gender == 'Female'| (students$marks1>65 & students$marks1<70), c('rollno','name', 'gender','marks1')]
students$gender
t1=table(students$gender)
barplot(table(students$course),ylim=c(0,50), col=1:3)
text(1:3,table(students$course)+5,table(students$course))
#+5 is used to print text 5 units above the bar so as not to clash

str(students)  #structure of the data.
nrow(students)
names(students)
dim(students)
head(students)   #first few records of the datasheet
tail(students)  #last few records
head(students, n=7)

#avg marks scores by each gender in marks1
#gender, marks1
aggregate(students$marks1 , by=list(students$gender), FUN=mean)
#aggregate of marks one based on each gender, function used is mean.
aggregate(students$marks2 , by=list(students$course), FUN=max)
aggregate(students$marks2 , by=list(students$course, students$gender), FUN=mean)

#dplyr----
library(dplyr)

students %>% group_by(gender) %>% summarize(mean(marks1))
students %>% group_by(course,gender) %>% summarize(meanmarks1= mean(marks1) , min(marks2), max(marks2)) %>% arrange(desc(meanmarks1))

students %>% arrange(desc(marks1)) %>% filter(gender=='Male') %>% head(n=4)
 #select 10% of the random rows
students %>% sample_frac(0.1)

#random 5 students selected
students %>% sample_n(4) %>%arrange(course) %>% select(name,gender)
students %>% arrange(course, grades, marks1) %>% select(course, grades, marks1)

#top 5 of each course
#check below data once
students %>% select(name, course, grades, marks1) %>% group_by(course,marks1) %>% arrange(course, grades, marks1) %>% top_n(5) 

#factor
names(students)
students$gender = factor(students$gender)
summary(students$gender)
summary(students$course)
students$course= factor(students$course, ordered=T)
summary(students$course)
students$course= factor( students$course, ordered=T, level= c('FPM','MBA','BBA'))
summary(students$course)

students$grades
#C<A<B
students$grades=factor(students$grades, ordered=T, levels=c('C', 'A','B'))
students$grades
table(students$grades)
barplot(table(students$grades))


#extracommands----
name[1:10]
name[c(15,20,36)]
name[-1]    #removes 1 value (the first one)
name[-c(1:10)]
rev(name)
name[60:1]
name[-c(1:10,35:40)]
students
write.csv(students,'./data/iimtrichy.csv')
students2= read.csv('./data/iimtrichy.csv') #direct address of file provided
head(students2)
students3= read.csv(file.choose())
#let you choose  the file from the folders 
#how to remove the extra column
students3= students3[,-1]
head(students3)

