library(RSelenium)
remDr<-remoteDriver(remoteServerAddr="localhost",port=4445,browserName="chrome")
#창오픈
remDr$open()
site <- paste("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
remDr$navigate(site)

#서울클릭
Sys.sleep(3)
seoulLinkCSS <- paste('#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
seoulLink<-remDr$findElements(using='css',  seoulLinkCSS)
sapply(seoulLink,function(x){x$clickElement()})

#전체클릭
Sys.sleep(3)
seoulAllLinkCSS <- paste('#mCSB_2_container > ul > li:nth-child(1) > a')
seoulAllLink<-remDr$findElements(using='css',  seoulAllLinkCSS)
sapply(seoulAllLink,function(x){x$clickElement()})

#매장숫자
Sys.sleep(3)
tmp<-c('#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap > span')
tmp<-remDr$findElements(using='css', tmp)
shopnumber<-sapply(tmp,function(x){x$getElementText()})   
shopnumber<-as.numeric(shopnumber)

#스크롤내리기
Sys.sleep(3)
shopname<-NULL
lat<-NULL
lng<-NULL
addr<-NULL
telephone<-NULL
result<-NULL
for(index in 1:shopnumber){
  #매장명
  tmp<-paste('#mCSB_3_container > ul > li:nth-child(',index,') > strong')
  tmp<-remDr$findElements(using='css', tmp)
  tmp<-sapply(tmp,function(x){x$getElementText()})
  shopname<-c(shopname,unlist(tmp))
  #위도
  tmp<-paste('#mCSB_3_container > ul > li:nth-child(',index,')')
  tmp<-remDr$findElements(using='css', tmp)
  tmp<-sapply(tmp,function(x){x$getElementAttribute('data-lat')})
  lat<-c(lat,unlist(tmp))
  #경도
  tmp<-paste('#mCSB_3_container > ul > li:nth-child(',index,')')
  tmp<-remDr$findElements(using='css', tmp)
  tmp<-sapply(tmp,function(x){x$getElementAttribute('data-long')})
  lng<-c(lng,unlist(tmp))
  #주소
  tmp<-paste('#mCSB_3_container > ul > li:nth-child(',index,') > p')
  tmp<-remDr$findElements(using='css', tmp)
  tmp<-sapply(tmp,function(x){x$getElementText()})
  tmp<-strsplit(unlist(tmp),'\n')
  addr<-c(addr,tmp[[1]][1])
  #전화번호
  telephone<-c(telephone,tmp[[1]][2])
  #3개씩 내리기
  if(index<shopnumber){
    if(index%%3==0)
      remDr$executeScript("var su = arguments[0]; var dom = document.querySelectorAll('#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();", list(index))
  }
}
result<-cbind(shopname,lat,lng,addr,telephone)
result
write.csv(result, "starbucks.csv")


