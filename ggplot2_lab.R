library(ggplot2)
library(dplyr)
#Q1
ggplot(mpg,aes(x=cty,y=hwy))+ geom_point()
ggsave("result1.png")
#Q2
ggplot(mpg,aes(x=class))+ geom_bar()
ggsave("result2.png")
#Q3
data("midwest")
options(scipen = 99)
ggplot(midwest,aes(x=poptotal,y=popasian))+ geom_point()+
  coord_cartesian(xlim = c(0,500000),ylim=c(0, 10000))
ggsave("result3.png")
#Q4
tmp<-mpg %>% filter(class=="compact"|class=="subcompact"|class=="suv")
ggplot(data = tmp, aes(x = class, y = cty)) + geom_boxplot()
ggsave("result4.png")
#Q5
tmp <- read.table("product_click.log")
tmp<-data.frame(tmp)
ggplot(tmp,aes(x=V2))+ geom_bar()
ggsave("result5.png")
#Q6
tmp<-as.POSIXct(paste0(substr(tmp$V1,1,4),"-",substr(tmp$V1,5,6),"-",substr(tmp$V1,7,8)))
paste0(substr(tmp$V1,1,4),"-",substr(tmp$V1,5,6),"-",substr(tmp$V1,7,8))
tmp<-weekdays(tmp)
tmp<-data.frame(tmp)
ggplot(tmp,aes(x=tmp))+ geom_bar()
ggsave("result6.png")

