#잡코리아 검색창에 자바 치기
library(RSelenium)
remDr<-remoteDriver(remoteServerAddr="localhost", port=4445, browserName="chrome")
remDr$open()
remDr$navigate("https://www.jobkorea.co.kr")

webElem <- remDr$findElement(using="css","[name='stext']")
webElem$sendKeysToElement(list("자바",key="enter"))

#기술 뽑기
result<-NULL
endFlag<-0
repeat{
  endFlag<-endFlag+1
  #첫페이지
  for(i in 1:30){
    css<-paste("#smGiList > div.list > ul > li:nth-child(",i,") > span.detailInfo > p.gibInfo > a")
    doms1<-remDr$findElements(using ="css selector",css)
    tech <- sapply(doms1,function(x){x$getElementText()})
    tech_v <- unlist(tech)
    result<-c(result,tech_v)
  }
  #2~10페이지
  for(j in 2:10){
    css<-paste("#smGiList > div.tplPagination > ul > li:nth-child(",j,") > a")
    doms1<-remDr$findElements(using ="css selector",css)
    Sys.sleep(1)
    for(i in 1:30){
      css<-paste("#smGiList > div.list > ul > li:nth-child(",i,") > span.detailInfo > p.gibInfo > a")
      doms1<-remDr$findElements(using ="css selector",css)
      tech <- sapply(doms1,function(x){x$getElementText()})
      tech_v <- unlist(tech)
      result<-c(result,tech_v)
    }
  }
  if(endFlag==2)
    break;  
  ##11페이지로 넘기기
  doms1<-remDr$findElements(using ="css selector","#smGiList > div.tplPagination > p > a")
  Sys.sleep(1)
}
result
write(result, "jobwithjava.txt")
result<-strsplit(result,", ")
result<-unlist(result)
result<-table(result)
result<-sort(result,decreasing = T)
result<-data.frame(result)
colnames(result)=c("키워드","빈도수")
write.csv(head(result,15), "jobwithjava.csv")

library(wordcloud2)
wordcloud2(result)
