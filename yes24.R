library(RSelenium)
remDr<-remoteDriver(remoteServerAddr="localhost",port=4445L,browserName="chrome")
remDr$open()
site <- paste("http://www.yes24.com/24/goods/40936880")
remDr$navigate(site)
webElem <- remDr$findElement("css", "body")
# remDr$executeScript("scrollTo(0, document.body.scrollHeight-200)", args = list(webElem))
# remDr$executeScript("scrollBy(0, -5000)", args = list(webElem))
# remDr$executeScript("scrollBy(0, 2500)", args = list(webElem))
# Sys.sleep(1)
# remDr$executeScript("scrollBy(0, 2500)", args = list(webElem))
# Sys.sleep(1)
# remDr$executeScript("scrollBy(0, 2500)", args = list(webElem))
# Sys.sleep(1)
# remDr$executeScript("scrollBy(0, 1000)", args = list(webElem))
Sys.sleep(3)
repl_v = NULL
endFlag <- FALSE
page <- 3
repeat {
  for(index in 3:7) {
    fullContentLinkCSS <- paste('#infoset_reviewContentList > div:nth-child(',index,') > div.btn_halfMore > a', sep='')
    fullContentLink<-remDr$findElements(using='css',  fullContentLinkCSS)
    if (length(fullContentLink) == 0) {
      endFlag <- TRUE
      break
    }
    sapply(fullContentLink,function(x){x$clickElement()})      
    Sys.sleep(1)
    fullContentCSS <- paste('#infoset_reviewContentList > div:nth-child(',index,') > div.reviewInfoBot.origin > div.review_cont', sep='')
    fullContent<-remDr$findElements(using='css', fullContentCSS)
    print(fullContent)
    repl <-sapply(fullContent,function(x){x$getElementText()})    
    print(repl)
    repl_v <- c(repl_v, unlist(repl))
  }
  Sys.sleep(1)
  if(endFlag)
    break;  
  page<-page+1
  nextPageCSS <- paste('#infoset_reviewContentList > div.review_sort.sortBot > div.review_sortLft > div > a:nth-child(',page,')',sep='')
  nextPageLink<-remDr$findElements(using='css',nextPageCSS)
  sapply(nextPageLink,function(x){x$clickElement()})
  if(page==13)
    page<-3
  Sys.sleep(1)
}
write(repl_v, "yes24.txt")
