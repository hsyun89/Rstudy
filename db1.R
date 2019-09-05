library(ggplot2)
iris
tmp<-data.frame(iris)
tmp

#prob1
colnames(tmp)=c("SLENGTH","SWIDTH","PLENGTH","PWIDTH","SPECIES")
dbWriteTable(conn,"IRIS",tmp)
#prob2
dbReadTable(conn,"IRIS")
#porb3
ggplot(data=tmp,aes(x=SLENGTH,y=SWIDTH))+
  geom_point(aes(color=SPECIES))
ggsave("db1.jpg")
ggplot(data=tmp,aes(x=PLENGTH,y=PWIDTH))+
  geom_point(aes(color=SPECIES))
ggsave("db2.jpg")