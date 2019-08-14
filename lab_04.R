#문제26
L1<-list(
  name = "scott",
  sal= 3000
)
result1<-L1$sal*2
#문제27
L2<-list(
  "scott",
  c(100,200,300)
)
#문제28
tmp<-list(
  c(3,5,7),
  c("A","B","C")
)
tmp[2][[1]][1]<-"Alpha"
#문제29
tmp<-list(
  alpha=0.4,
  beta=sqrt(1:5),
  gamma=log(1:5)
)
tmp[[1]]+10
#문제30
tmp<-list(
  math=list(95,90),
  writing=list(90,85),
  reading=list(85,80)
)
mean(unlist(tmp))
mean(cbind(unlist(tmp$math),unlist(tmp$writing),unlist(tmp$reading)))
#------제어문------
#문제1
grade<-sample(1:6,1)
grade

if(grade==1|grade==2|grade==3){
  cat(grade,"학년은 저학년입니다.")
}else{
  cat(grade,"학년은 고학년입니다.")
}

#문제2
choice<-sample(1:5,1)
choice
tmp<-switch (choice,
  "1" = 300+50,
  "2" = 300-50,
  "3" = 300*50,
  "4" = 300/50,
  "5" = 300%%50
)
cat("결과값 :",tmp)
#문제3
time<-32150
hour<-floor(time/(60*60))
minute<-floor(time/60-hour*60)
second<-time-hour*60*60-minute*60
cat(hour,"시간",minute,"분",second,"초")
#문제4
count<-sample(3:10,1)
deco<-sample(1:3,1)
if(deco==1){
  for(data in 1:count){
    cat("*")
  }
}else if(deco==2){
  for(data in 1:count){
    cat("$")
  }
}else{
  for(data in 1:count){
    cat("#")
  }
}
#문제5
score<-sample(0:100,1)
tmp<-paste(floor(score/10),"",sep="")
switch (tmp,
  "10"=,"9"= "A 등급",
  "8" = "B 등급",
  "7" = "C 등급",
  "6" = "D 등급",
  "5" = "F 등급"
)
#문제6
al1<-LETTERS[1:26]
al2<-letters[1:26]
alpha<-paste(al1,al2,sep="")
paste0(al1,al2)
alpha