#해들리 위컴의 DPLYR API
install.packages("dplyr")
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam %>% filter(class==1)
str(exam)

#sort
exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class,math)

#파생변수
exam %>% mutate(total=math+english+science) %>% head
exam %>% mutate(test=ifelse(science>=60,"pass","fail")) %>% head

#집단별 요약
exam %>% summarise(mean_math=mean(math))
exam %>% group_by(class) %>% summarise(mean_math=mean(math))
exam %>% group_by(class) %>% 
  summarise(mean_math=mean(math),
            sum_math=sum(math),
            median_math=median(math),
            n=n())

library(dplyr)
install.packages("ggplot2")
str(ggplot2::mpg) #::은 자바에서 메소드 부르는거랑 비슷함
head(ggplot2::mpg)
mpg<-as.data.frame(ggplot2::mpg)

mpg %>% filter(class=="suv") %>% group_by(manufacturer)

#데이터 합치기
test1<-data.frame(id=c(1,2,3,4,5), midterm=c(60,80,70,90,85))
test2<-data.frame(id=c(1,2,3,4,5), final=c(70,83,65,95,80))
total<-left_join(test1,test2,by="id")
total
name<-data.frame(class=c(1,2,3,4,5),teacher=c("kim","lee","park","choi","jung"))
exam_new<-left_join(exam,name,by="class")
exam_new

group_a<-data.frame(id=c(1,2,3,4,5), test=c(60,80,70,90,85))
group_b<-data.frame(id=c(1,2,3,4,5), test=c(70,83,65,95,80))
group_all<-bind_rows(group_a,group_b)
group_all

one<-data.frame(x=c(1:10000000),y=c(1:10000000))
two<-data.frame(x=c(1:10000000),y=c(1:10000000))
system.time(rbind(one,two))
system.time(bind_rows(one,two))

system.time(cbind(one,two))
system.time(bind_cols(one,two))
