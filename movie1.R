# 단일 페이지(rvest 패키지 사용)
install.packages("rvest"); 
library(rvest)
url<- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text <- read_html(url,  encoding="UTF-8")
text
# 영화평점
nodes <- html_nodes(text, ".emph_grade")
point <- html_text(nodes)
point
# 영화리뷰
nodes <- html_nodes(text, ".desc_review")
review <- html_text(nodes, trim=TRUE)
review
review <- gsub("\r", "", review)
review
page <- cbind(point, review)
write.csv(page, "daummovie1.csv")