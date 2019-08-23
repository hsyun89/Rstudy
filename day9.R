
# 히스토그램
hist(성적$국어, main="성적분포-국어", xlab="점수", breaks=5, col = "lightblue", border = "pink")
hist(성적$수학, main="성적분포-수학", xlab="점수", col = "lightblue", border = "pink")
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수", col=rainbow(12), border = "pink")

nums <- sample(1:100, 30)
barplot(nums)
hist(nums)
hist(nums,breaks=10)
hist(nums,2)
hist(nums,100)
hist(nums, breaks=c(0,33,66,100))

# 추세선 추가
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수", col=rainbow(12), border = "pink",prob=T)
lines(density(성적$국어, bw=0.5), col="blue", lwd=3)
lines(density(성적$국어, bw=1), col="black", lwd=3)



# 박스플롯
summary(성적$국어)
boxplot(성적$국어, col="yellow",  ylim=c(0,10), xlab="국어", ylab="성적")


성적2 <- 성적[,3:5]
boxplot(성적2, col=rainbow(3), ylim=c(0,10), ylab="성적")

data <- read.table("온도.txt", header=TRUE, sep=",")
head(data, n=5); 
boxplot(data)
boxplot(data, las = 2)
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14))
chtcols = rep(c("red","sienna","palevioletred1","royalblue2"), times=3)
chtcols
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14), col=chtcols)
grid(col="gray", lty=2, lwd=1)

rainbow()
heat.colors()
terrain.colors()
topo.colors()
cm.colors()
gray.colors()

#엑셀을 읽기위한 패키지
install.packages("readxl")
library(readxl)
exdata1<-read_excel("book/Sample1.xlsx")
exdata1
stem(exdata1$AGE)
hist(exdata1$AGE)
hist(exdata1$AGE, xlim = c(0,60),ylim = c(0,5),main = "AGE분포")

#빈도 분석 및 막대그래프
install.packages("descr")
library(descr)

freq(exdata1$SEX,plot = T,main='성별(barplot)')


dist_sex <- table(exdata1$SEX)
dist_sex
barplot(dist_sex)

barplot(dist_sex,ylim = c(0,8))
