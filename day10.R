install.packages("reshape2")
library(reshape2)

tail(airquality)
lihead(airquality)
summary(airquality)
View(airquality)
str(airquality)
dim(airquality)
names(airquality)

#melt 테스트
names(airquality)<-tolower(names(airquality))
head(airquality)
melt_test<-melt(airquality)
head(melt_test)
dim(melt_test)
View(melt_test)

#melt 테스트2
melt_test2<-melt(airquality, id.vars = c("month","wind"),measure.vars = "ozone")
View(melt_test2)


#KoNLP 패키지 로드
install.packages("KoNLP")
library(KoNLP)
useSejongDic()
useNIADic()
word_data<-readLines("book/애국가(가사).txt")
word_data2<-sapply(word_data, extractNoun,USE.NAMES = F)
word_data2
#단어 추가
add_words<-c("백두산","남산","철갑","가을","하늘","달")
buildDictionary(user_dic = data.frame(add_words,rep("ncn",length(add_words))),replace_usr_dic = T)

undata<-unlist(word_data2)
undata

word_table<-table(undata)
word_table

undata2<-Filter(function(x){nchar(x)>=2},undata)
word_table2<-table(undata2)
word_table2

sort(word_table2,decreasing = T)

#워드 클라우드
install.packages('wordcloud2')
library(wordcloud2)
wordcloud2(word_table2)
wordcloud2(demoFreq,figPath = "book/peace.png")

library(devtools)
devtools::install_github("lchiffon/wordcloud2")

words<-read.csv("wc.csv",stringsAsFactors = F)
wordcloud2(words)
wordcloud2(words,rotateRatio = 1)
wordcloud2(words,rotateRatio = 0.5)
wordcloud2(words,rotateRatio = 0)
wordcloud2(words, size = 0.5)
color
