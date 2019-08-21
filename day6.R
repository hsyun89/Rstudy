# 정규표현식 사용
?gsub
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub("A", "", word) 
gsub("a", "", word) 
gsub("Aa", "", word) 
gsub("(Aa){2}", "", word) #반복 
gsub("[Aa]", "", word) #A 또는 a
gsub("[가-힣]", "", word) #가부터 힣사이 모두
gsub("[^가-힣]", "", word) #여집합
gsub("[&^%*]", "", word) #&^%* 각각or
gsub("[[:punct:]]", "", word) #특수문자제거(블랭크 남음)
gsub("[[:alnum:]]", "", word) #영어숫자제거(특수, 블랭크 남음)
gsub("[1234567890]", "", word)
gsub("[0-9]", "", word)
gsub("[[:digit:]]", "", word)
gsub("[^[:alnum:]]", "", word) #블랭크도 없어짐
gsub("[[:space:]]", "", word) #공백만 없어짐

install.packages("dplyr")
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam %>% filter(class==1)
