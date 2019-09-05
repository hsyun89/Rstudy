#R에서 오라클 연동하기
install.packages("DBI")
library(DBI)
install.packages("RJDBC")
library(RJDBC)

#DB connect
drv<-JDBC("oracle.jdbc.driver.OracleDriver","c:/HS/ojdbc6.jar")
conn<-dbConnect(drv,"jdbc:oracle:thin:@localhost:1521:xe","jdbctest","jdbctest")
#DB 접속해제
dbDisconnect(conn)

#읽기1
dbListTables(conn)
result1<-dbReadTable(conn,"VISITOR") #테이블명은 무조건 대문자로~
#읽기2
result2<-dbGetQuery(conn,"SELECT * FROM VISITOR")
#읽기3
rs<-dbSendQuery(conn,"SELECT * FROM VISITOR")
ret1<-dbFetch(rs,1) #스택에 팝처럼 튀어나옴
ret2<-dbFetch(rs,2)
ret3<-dbFetch(rs)

#쓰기1 - 테이블을 새로 만들고 값을 넣기
dbWriteTable(conn,"book",data.frame(bookname=c("자바의 정석","하둡 완벽 입문","이것이 리눅스"),price=c(30000,25000,32000)))
dbWriteTable(conn,"cars",head(cars,3))
#쓰기2 - sql문을 써서 넣는다.
dbSendUpdate(conn,"INSERT INTO VISITOR VALUES('R언어',sysdate,'R 언어로 데이터를 입력해요',visitor_seq.nextval)")
dbSendUpdate(conn,"INSERT INTO VISITOR VALUES('하둡',sysdate,'대용량 데이터 분산저장& 처리기술',visitor_seq.nextval)")

#수정
dbSendUpdate(conn,"INSERT INTO cars(speed,dist) VALUES(1,1)")
dbSendUpdate(conn,"INSERT INTO cars(speed,dist) VALUES(2,2)")
dbReadTable(conn,"CARS")
dbSendUpdate(conn,"UPDATE CARS SET DIST=DIST*100 where speed=1")
dbReadTable(conn,"CARS")
dbSendUpdate(conn,"UPDATE CARS SET DIST=DIST*3 where speed=1")
dbReadTable(conn,"CARS")

#삭제
dbRemoveTable(conn,"CARS")


#다양한 예제들
#예제1
df<-read.table("product_click.log",stringsAsFactors = F)
names(df)<-c("click_time","pid")
df$click_time<-as.character(df$click_time)
dbWriteTable(conn,"productlog",df)
result4<-dbReadTable(conn,"PRODUCTLOG")
result4
#예제2
dbWriteTable(conn,"mtcars",mtcars)
rs<-dbSendQuery(conn,"SELECT * from mtcars where cyl=4")
rs
dbFetch(rs)
dbClearResult(rs)

rs<-dbSendQuery(conn,"select * from mtcars")
ret1<-dbFetch(rs,10)
ret2<-dbFetch(rs)
dbClearResult(rs)

nrow(ret1)
nrow(ret2)


#######java와 R의 연동
install.packages("Rserve")


.libPaths()

remove.packages("KoNLP")
remove.packages("rJava")


install.packages("KoNLP")
install.packages("rJava")
library(KoNLP)
library(rJava)
library(KoNLP)
library(XML)
library(rvest)
