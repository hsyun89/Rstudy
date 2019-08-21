#7-1
mpg<-as.data.frame(ggplot2::mpg)
mpg<-mpg %>% mutate(sum_ctyhwy=cty+hwy)
#7-2
mpg<-mpg %>% mutate(mean_ctyhwy=sum_ctyhwy/2)
#7-3
mpg %>% arrange(desc(mean_ctyhwy)) %>% head(3)
#7-4
mpg<-as.data.frame(ggplot2::mpg)
mpg %>% mutate(sum_ctyhwy=cty+hwy)%>% mutate(mean_ctyhwy=sum_ctyhwy/2)%>% arrange(desc(mean_ctyhwy)) %>% head(3)

#8-1
mpg<-as.data.frame(ggplot2::mpg)
mpg %>% group_by(class) %>% summarise(mean(cty))
#8-2
mpg %>% group_by(class) %>% summarise(mean_cty=mean(cty)) %>% arrange(desc(mean_cty))
#8-3
mpg %>% group_by(manufacturer) %>% summarise(mean_hwy=mean(hwy)) %>% arrange(desc(mean_hwy)) %>% head(3)
#8-4
mpg %>% group_by(manufacturer) %>% filter(class=="compact")%>% summarise(number_compact=n()) %>% arrange(desc(number_compact))

#9-1
fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_fl=c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
fuel
mpg<-mpg <- left_join(mpg,fuel,by="fl")
#9-2
mpg %>% select(model,fl,price_fl) %>% head(5)

#10-1
midwest<-as.data.frame(ggplot2::midwest)
midwest<-midwest %>% mutate(tmp=(poptotal-popadults)/poptotal*100)
#10-2
midwest %>% arrange(desc(tmp)) %>% head(5) %>% select(tmp)
#10-3
midwest<-midwest %>% mutate(size=ifelse(tmp>=40,"large",ifelse(tmp>=30,"middle","small")))
View(midwest)
midwest %>% group_by(size) %>% summarise(n())
#10-4
midwest<-midwest %>% mutate(ratio_asian=popasian/poptotal*100) 
midwest%>% arrange(ratio_asian) %>% head(10) %>% select(ratio_asian)

#11-1
mpg<-as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"]<-NA
mpg %>% filter(is.na(hwy)) %>% summarise(n())
mpg %>% filter(is.na(drv)) %>% summarise(n())
#11-2
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean_hwy=mean(hwy)) %>% arrange(desc(mean_hwy))

#12-1
mpg<-as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"]<-"k"
mpg[c(29,43,129,203),"cty"]<-c(3,4,39,42)
#12-2
mpg %>% filter(!(drv=="f"|drv=="r"|drv=="4")) %>% summarise(n())
mpg$drv<-ifelse(!(mpg$drv=="f"|mpg$drv=="r"|mpg$drv=="4"),NA,mpg$drv)
#12-3
boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg$cty<-ifelse(mpg$cty<9|mpg$cty>26,NA,mpg$cty)
#12-4
mpg %>%  group_by(drv) %>% filter(!is.na(drv))%>% summarise(mean(cty,na.rm = T))
