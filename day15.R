#source함수 
###############
#자바로 eval 메소드 써서 하나하나 실행하는 것 보다
#R파일을 만들어 놓고
#source 실행만 하면 자바 소스가 간단해진다!
###############

?source
source("test.R")
imsi<-source("test.R") #꼭 변수에 담아서 사용해야 함!!!
imsi
imsi$value


#실습 코드~~~~~~~~~~~~~~~~~~###
install.packages("KoNLP")
library(KoNLP)
library(dplyr)
useSejongDic()
useNIADic()
word_data<-readLines("hotel2.txt")
word_data2<-sapply(word_data, extractNoun,USE.NAMES = F)
word_data2

undata<-unlist(word_data2)
undata

word_table<-table(undata)
word_table

undata2<-Filter(function(x){nchar(x)>=2},undata)
word_table2<-table(undata2)
tmp<-data.frame(word_table2)
result<-arrange(tmp,desc(tmp$Freq)) %>% head(10)
result$undata2
