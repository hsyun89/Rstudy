#css사용
install.packages("rvest"); 
library(rvest)
site<- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
webtoon <- NULL
for(i in 1:114){
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="UTF-8")
  #웹툰제목
  nodes <- html_nodes(text, ".challengeTitle")
  comicName <- html_text(nodes,trim=TRUE)
  #웹툰요약
  nodes <- html_nodes(text, ".summary")
  comicSummary <- html_text(nodes,trim=TRUE)
  #평점
  nodes <- html_nodes(text, "div.rating_type strong")
  comicGrade <- html_text(nodes)
  
  #묶기
  page <- cbind(comicName, comicSummary,comicGrade)
  webtoon <- rbind(webtoon, page)
}
write.csv(webtoon, "navercomic.csv")







#XML패키지 사용
install.packages("XML")
library(XML)
site<- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
for(i in 1:114){
  url <- paste(site, i, sep="")
  imsi <- read_html(url)
  t<- htmlParse(imsi)
  #웹툰제목
  comicName<- xpathSApply(t,"//h6[@class='challengeTitle']", xmlValue); 
  comicName <- trimws(comicName)
  #요약
  comicSummary<- xpathSApply(t,"//div[@class='summary']", xmlValue); 
  comicSummary <- trimws(comicSummary)
  #평점
  comicGrade<- xpathSApply(t,"//div[@class='rating_type']/strong", xmlValue); 
  #묶기
  page <- cbind(comicName, comicSummary,comicGrade)
  webtoon <- rbind(webtoon, page)
}
write.csv(webtoon, "navercomic2.csv",row.names = FALSE)






