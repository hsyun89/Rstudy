mpg<-as.data.frame(ggplot2::mpg)
mpg
library(dplyr)
#문제1
mpg$cty
plot(mpg$cty,mpg$hwy,pch=3,xlab = "도시연비",ylab ="고속도로연비" )

#문제2
tmp<-mpg %>% group_by(drv) %>% summarise(num=n())
barplot(tmp$num,names.arg=tmp$drv,col=rainbow(3))

#문제3
boxplot(hwy~manufacturer,data=mpg,main="*제조사별 고속도로 연비*",ylim = c(5,40),xlab = "",ylab ="고속도로연비",col=heat.colors(15),col.main="magenta",las=2)
