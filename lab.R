library(KoNLP)
library(dplyr)
useNIADic()
word_data<-readLines("hotel2.txt")
word_data2<-sapply(word_data, extractNoun,USE.NAMES = F)

undata<-unlist(word_data2)

word_table<-table(undata)

undata2<-Filter(function(x){nchar(x)>=2},undata)
word_table2<-table(undata2)
tmp<-data.frame(word_table2)
result<-arrange(tmp,desc(tmp$Freq)) %>% head(10)
result
