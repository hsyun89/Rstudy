# 아고다 호텔 댓글
library(RSelenium)
remDr<-remoteDriver(remoteServerAddr="localhost",port=4445L,browserName="chrome")
remDr$open()
remDr$navigate("https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204")
#---------처음에 뜨는 팝업창 처리----------
more<-remDr$findElements(using='css','#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a')
sapply(more,function(x){x$clickElement()})
#------------------------------------------
#밑에뜨는 팝업창 처리------------
remDr$executeScript("scrollBy(0,7500)")
mored<-remDr$findElements(using='css','#dismiss-btn > p')
sapply(mored,function(x){x$clickElement()})
#--------------------------------
repl_v = NULL;
 for (i in 1:4) {
   nextCss <- paste("#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span:nth-child(",i,")", sep="") 
   nextPage<-remDr$findElements(using='css',nextCss)
   sapply(nextPage,function(x){x$clickElement()})
   Sys.sleep(1)
    doms <- remDr$findElements(using = "css selector", ".Review-comment-bodyText")
    repl<-sapply(doms, function (x) {x$getElementText()})
    Sys.sleep(1)
    print(repl)
    repl_v=c(repl_v,unlist(repl))
 }
for (i in 1:11) {
  nextCss <- paste("#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span:nth-child(4)", sep="") 
  nextPage<-remDr$findElements(using='css',nextCss)
  sapply(nextPage,function(x){x$clickElement()})
  Sys.sleep(1)
  doms <- remDr$findElements(using = "css selector", ".Review-comment-bodyText")
  repl<-sapply(doms, function (x) {x$getElementText()})
  Sys.sleep(1)
  print(repl)
  repl_v=c(repl_v,unlist(repl))
}
print(repl_v)
write(repl_v,"hotel.txt")
