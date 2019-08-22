library(dplyr)

#문제1번
click <- read.table("product_click.log")
click
tmp<-click %>% group_by(product=click$V2) %>% summarise(number=n())
png(filename="clicklog1.png", height=400, width=1000, bg="white")
barplot(tmp$number, main="세로바 그래프 실습", xlab="상품ID", ylab="클릭 수", col=terrain.colors(15), names.arg=tmp$product)
dev.off()

#문제2번
tmp2<-click
tmp2$V1<-str_sub(click$V1,start = 9,end = 10)
tmp2
tmp2<-tmp2 %>% group_by(V1) %>% summarise(number=n())
tmp2$V1<-as.numeric(tmp2$V1)
tmp2$V1<-paste(tmp2$V1,"-",tmp2$V1+1)
png(filename="clicklog2.png", height=400, width=500, bg="white")
pie(tmp2$number, main="파이 그래프 실습",labels=paste(tmp2$V1), col=rainbow(10))
dev.off()
