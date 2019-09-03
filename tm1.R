dd <- NULL
duke<-c("사과","포도","망고")
dooly<-c("포도","자몽","자두")
ddochi<-c("복숭아","사과","포도")
donat<-c("오렌지","바나나","복숭아")
gildong<-c("포도","바나나","망고")
heedong<-c("포도","귤","오렌지")
dd<-cbind.data.frame(duke,dooly,ddochi,donat,gildong,heedong)


cps <- VCorpus(VectorSource(dd))
tdm <- TermDocumentMatrix(cps,control=list(wordLengths = c(1, Inf)))
(m <- as.matrix(tdm))
#문제1 - 좋아하는 과일이 가장 유사한 친구들
com <- t(m) %*% m
dist(com, method = "cosine")
#문제2 - 가장 많이 선택된 과일
tmp<-rowSums(m)
sort(tmp,decreasing = T) %>% head(1)
#문제3 - 가장 적게 선택된 과일
sort(tmp) %>% head(1)
