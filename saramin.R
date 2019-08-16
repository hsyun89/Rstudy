# 단일 페이지(rvest 패키지 사용)
install.packages("rvest"); 
library(rvest)
url<- "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=%EC%9E%90%EB%B0%94"
text <- read_html(url,  encoding="UTF-8")
# 기술이름
nodes <- html_nodes(text, "span.txt")
tech_name <- html_text(nodes)
tech_name <- gsub("[[:punct:][:cntrl:]]", "", tech_name)
tech_name <- subset(tech_name,tech_name!="다른 필터항목 보기")
# 건수
nodes <- html_nodes(text, "span.count")
info_count <- html_text(nodes, trim=TRUE)
info_count <- gsub("[[:punct:][:cntrl:]]", "", info_count)
info_count <- subset(info_count,info_count!="건")
page <- cbind(tech_name, info_count)
write.csv(page, "saramin.csv",row.names = FALSE) #row.names = FALSE로 주면 csv 파일 앞에 번호가 붙지 않는다!!