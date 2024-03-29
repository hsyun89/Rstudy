# 단일 페이지(rvest 패키지 사용)
install.packages("rvest"); 
library(rvest)
site<- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
movie.review <- NULL
for (i in 1:20) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="UTF-8")
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
  movie.review <- rbind(movie.review, page)
}
write.csv(movie.review, "daummovie2.csv")