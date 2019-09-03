#########################치킨집 트리맵
library("readxl")
ck<-read_excel("book/치킨집_가공.xlsx")
#11~16추출
addr<-substr(ck$소재지전체주소,11,16)
head(addr)
#깔끔하게 처리
addr_num<-gsub("[0-9]","",addr)
addr_trim<-gsub(" ","",addr_num)
head(addr_trim)

#카운트하기
library(dplyr)
addr_count<-addr_trim %>% table() %>% data.frame()
head(addr_count)

#트리맵 표현
library(treemap)
treemap(addr_count,index = ".",vSize = "Freq",title = "서대문구 동별 치킨집 분포")

arrange(addr_count,desc(Freq)) %>% head()

##########################미세먼지 시각화 t검정
library(readxl)
dustdata<-read_excel("book/dustdata.xlsx")
View(dustdata)
str(dustdata)

library(dplyr)
dustdata_anal <- dustdata %>% filter(area %in% c("성북구", "중구"))
View(dustdata_anal)

count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))
count(dustdata_anal, area) %>% arrange(desc(n))

dust_anal_area_sb<-subset(dustdata_anal,area=="성북구")
dust_anal_area_jg<-subset(dustdata_anal,area=="중구")

dust_anal_area_sb
dust_anal_area_jg

install.packages("psych")
library(psych)

describe(dust_anal_area_sb$finedust)
describe(dust_anal_area_jg$finedust)

boxplot(dust_anal_area_sb$finedust,dust_anal_area_jg$finedust, main="finedust_compare", xlab="AREA", names = c("성북구","중구"),ylab="FINEDUST_PM",col=c("blue","green"))
#T검정, 데이터 세트에서 측정소명에 따라 미세먼지 농도 평균에 대한 차이를 검증
t.test(data=dustdata_anal,finedust~area,var.equal=T)


# 트위터 글 읽어오기
install.packages("twitteR")
library(twitteR) 
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)
# oauth 정보 저장 확인
key <- "월드컵"
key <- enc2utf8(key)
result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content

library(KoNLP)
useSejongDic()

bigdata_noun<-sapply(content,extractNoun,USE.NAMES = F)
bigdata_noun<-unlist(bigdata_noun)
bigdata_noun<-Filter(function(x){nchar(x)>=2},bigdata_noun)
bigdata_noun<-gsub("[~!@#$%^&*()-_=+?:]","",bigdata_noun)
bigdata_noun<-gsub("[A-Za-z0-9]","",bigdata_noun)
bigdata_noun<-gsub("[ㄱ-ㅎ]","",bigdata_noun)
bigdata_noun<-gsub("(ㅜ|ㅠ)+","",bigdata_noun)

word_table<-table(bigdata_noun)
library(wordcloud2)
wordcloud2(word_table,fontFamily = "맑은 고딕",size=5,color="random-light",backgroundColor="balck")




# 지하철역 주변 아파트 가격

library(dplyr)
library(ggmap)
register_google(key='AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY')
# 다음 소스는 참고만 하고 10개행 밑에 있는 load() 함수만 수행시키세용
station_data <- read.csv("book/13._역별_주소_및_전화번호.csv")
str(station_data)
station_code <- as.character(station_data$"구주소")
station_code <- geocode(station_code)
station_code <- as.character(station_data$"구주소") %>% enc2utf8() %>% geocode()
head(station_code)
station_code_final <- cbind(station_data, station_code)
head(station_code_final)
save(station_code_final, file="station.rda")
load(file="station.rda")  # 이것만 수행시키세용

# 다음 소스는 참고만 하고 마지막에 있는 load() 함수만 수행시키세용
apart_data <- read.csv("book/아파트(매매)__실거래가_20180513144733.csv")
head(apart_data)
names(apart_data)
apart_data <- rename(apart_data, "거래금액" = "거래금액.만원.")
apart_data$전용면적 = round(apart_data$전용면적)
head(apart_data)
count(apart_data, 전용면적) %>% arrange(desc(n))
apart_data_85 <- subset(apart_data, 전용면적=="85")
head(apart_data_85)
apart_data_85$거래금액 <- gsub(",", "", apart_data_85$거래금액)
head(apart_data_85)
apart_data_85_cost <- aggregate(as.integer(거래금액)~단지명, apart_data_85, mean)
head(apart_data_85_cost)

apart_data_85 <- apart_data_85[!duplicated(apart_data_85$단지명),]
head(apart_data_85)
apart_data_85 <- left_join(apart_data_85, apart_data_85_cost, by='단지명')
head(apart_data_85)
apart_data_85 <- apart_data_85 %>% select("단지명", "시군구", "번지", "전용면적", "거래금액")

head(apart_data_85)
apart_address <- paste(apart_data_85$"시군구", apart_data_85$번지)
head(apart_address)
apart_address <- paste(apart_data_85$"시군구", apart_data_85$번지) %>% data.frame()
head(apart_address)
apart_address <- rename(apart_address, "주소"=".")
head(apart_address)
apart_address_code <- as.character(apart_address$"주소") %>% enc2utf8() %>% geocode()
apart_code_final <- cbind(apart_data_85, apart_address, apart_address_code) %>% select("단지명", "전용면적", "거래금액", "주소", lon, lat)
head(apart_code_final)
save(apart_code_final, file="apart.rda")
load(file="apart.rda")  # 이것만 수행시키세용

mapo_map<-get_googlemap("mapogu",maptype = "roadmap",zoom = 12)
ggmap(mapo_map)
library(ggplot2)
ggmap(mapo_map)+
  geom_point(data=station_code_final,aes(x=lon,y=lat),colour="red",size=3)+
  geom_text(data=station_code_final,aes(label=역명,vjust=-1))

hongdae_map<-get_googlemap("hongdae station",maptype = "roadmap",zoom=15)
ggmap(hongdae_map)+
  geom_point(data=station_code_final,aes(x=lon,y=lat),colour="red",size=3)+
  geom_text(data=station_code_final,aes(label=역명,vjust=-1))+
  geom_point(data=apart_code_final,aes(x=lon,y=lat))+
  geom_text(data=apart_code_final,aes(label=단지명,vjust=-1))+
  geom_text(data=apart_code_final,aes(label=거래금액,vjust=1))


#tm 패키지
install.packages("tm")
library(tm)

lunch <- c("커피 파스타 치킨 샐러드 아이스크림",
           "커피 우동 소고기김밥 귤",
           "참치김밥 커피 오뎅",
           "샐러드 피자 파스타 콜라",
           "티라무슈 햄버거 콜라",
           "파스타 샐러드 커피"
)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps)
tdm

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
tdm
(m <- as.matrix(tdm))

rowSums(m)
colSums(m)

com <- m %*% t(m)


install.packages("tm")
library(tm)

lunch <- c("커피 파스타 치킨 샐러드 아이스크림",
           "커피 우동 소고기김밥 귤",
           "참치김밥 커피 오뎅",
           "샐러드 피자 파스타 콜라",
           "티라무슈 햄버거 콜라",
           "파스타 샐러드 커피"
)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps)
tdm
as.matrix(tdm)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
tdm
(m <- as.matrix(tdm))

rowSums(m)
colSums(m)

com <- m %*% t(m)  
com

install.packages("qgraph")
library(qgraph)

qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))


install.packages("proxy")
library(proxy)
dd <- NULL
d1 <- c("aaa bbb ccc")
d2 <- c("aaa bbb ddd")
d3 <- c("aaa bbb ccc")
d4 <- c("xxx yyy zzz")
dd <- c(d1, d2, d3, d4)
cps <- Corpus(VectorSource(dd))
dtm <- DocumentTermMatrix(cps)
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)

dist(com, method = "cosine")
dist(com, method = "Euclidean")
