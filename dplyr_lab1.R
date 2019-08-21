library(dplyr)
install.packages("ggplot2")
str(ggplot2::mpg) 
head(ggplot2::mpg)
#문제1
mpg<-as.data.frame(ggplot2::mpg)
#1-1
mpg %>% select()
mpg %>% filter()
nrow(mpg)
ncol(mpg)
#1-2
mpg %>% head(10)
#1-3
mpg %>% tail(10)
#1-4
mpg %>% View()
#1-5
summary(mpg)
#1-6
str(mpg)



#2-1
mpg<-mpg %>% rename("city"="cty","highway"="hwy")
#2-2
mpg %>% head()



#3-1
midwest<-as.data.frame(ggplot2::midwest)
str(midwest)
#3-2
midwest<-midwest %>% rename("total"="poptotal","asian"="popasian")
head(midwest)
#3-3
midwest<-midwest %>% mutate(tmp=asian/total*100) 
#3-4
midwest %>% mutate(size=ifelse(tmp>mean(tmp),"large","small"))



#4-1
mpg<-ggplot2::mpg
tmp<-mpg %>% filter(displ<=4)
mean(tmp$hwy)
tmp2<-mpg %>% filter(displ>=5)
mean(tmp2$hwy)
#4-2
audi<-mpg %>% filter(manufacturer=="audi")
mean(audi$cty)
toyota<-mpg %>% filter(manufacturer=="toyota")
mean(toyota$cty)
#4-3
chevrolet<-mpg %>% filter(manufacturer=="chevrolet")
mean(chevrolet$hwy)
ford<-mpg %>% filter(manufacturer=="ford")
mean(ford$hwy)
honda<-mpg %>% filter(manufacturer=="honda")
mean(honda$hwy)
allCar<-mpg %>% filter(manufacturer=="chevrolet"|manufacturer=="ford"|manufacturer=="honda")
mean(allCar$hwy)

mpg %>% filter(manufacturer=="chevrolet"|manufacturer=="ford"|manufacturer=="honda") %>% summarise(tmp=mean(hwy))


#5-1
mpg2<-mpg %>% select(class,cty)
str(mpg2)
#5-2
tmp<-mpg2 %>% filter(class=="suv")
mean(tmp$cty)
tmp2<-mpg2 %>% filter(class=="compact")
mean(tmp2$cty)

mpg2 %>% group_by(class)%>% summarise(tmp=mean(cty)) %>% filter(class=="suv"|class=="compact")


#6-1
mpg %>% filter(manufacturer=="audi")%>% group_by(model) %>% summarise(tmp=mean(hwy)) %>% arrange(desc(tmp)) %>% head(1)
#6-2
mpg %>% filter(manufacturer=="audi") %>% arrange(desc(hwy)) %>% head(5)
