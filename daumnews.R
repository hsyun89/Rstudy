# 단일 페이지(rvest 패키지 사용)
install.packages("rvest"); 
library(rvest)
url<- "http://media.daum.net/ranking/popular/"
  text <- read_html(url,  encoding="UTF-8")
  # newtitle
  nodes <- html_nodes(text, "ul.list_news2 a.link_txt")
  newstitle <- html_text(nodes)
  newstitle <- gsub("[[:punct:][:cntrl:]]", "", newstitle)
  newstitle
  # newspaper
  nodes <- html_nodes(text, "ul.list_news2 span.info_news")
  newspapername <- html_text(nodes, trim=TRUE)
  newspapername <- gsub("[[:punct:][:cntrl:]]", "", newspapername)
  newspapername
  page <- cbind(newstitle, newspapername)
write.csv(page, "daumnews.csv")
