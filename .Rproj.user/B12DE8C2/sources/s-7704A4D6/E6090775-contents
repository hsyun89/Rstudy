#실습1
exam1<-function(x,y){
  return(abs(x-y))
}
exam1(10,20)
exam1(20,5)
exam1(5,30)
exam1(6,3)
#실습2
exam2<-function(num1,op,num2){
  if(op=="+")
    return(num1+num2)
  else if(op=="-")
    return(num1-num2)
  else if(op=="*")
    return(num1*num2)
  else if(op=="%/%"){
    if(num1==0){
      return("오류1")
    }else if(num2==0){
      return("오류2") 
    }else{
      return(num1%/%num2)
    }
  }else if(op=="%%"){
    if(num1==0){
      return("오류1")
    }else if(num2==0){
      return("오류2") 
    }else{
      return(num1%%num2)
    }
  }
}
exam2(10,"+",20)
exam2(10,"*",20)
exam2(10,"-",20)
exam2(10,"%/%",20)
exam2(10,"%%",20)
exam2(10,"%%",0)
#실습3
exam3<-function(num,char="#"){
  for(data in 1:num)
    print(char)
  return()
}
exam3(5,"$")
#실습4
exam4<-function(score){
  if(score>=85){
    grade<-"상"
  }else if(score>=70){
    grade<-"중"
  }else{
    grade<-"하"
  }
  cat(score,"점은",grade,"등급입니다")
}
exam4(8)
#실습5
countEvenOdd<-function(num){
  even<-0
  odd<-0
  if(is.vector(num)){
    for(i in num){
      if(i%%2==0){
        even<-even+1
      }else{
        odd<-odd+1
      }
    }
  }else{
    return(0)
  }
  return(list(even=even,odd=odd))
}
countEvenOdd(c(1,2,3,4,5))
countEvenOdd(5)
#실습6
vmSum<-function(v1){
  if(is.vector(v1)){
    if(is.numeric(v1)){
      result<-sum(v1)
    }else{
      stop("숫자 벡터를 전달하숑!")
    }
  }else{
    stop("벡터만 전달하숑!")
  }
  return(result)
}
vmSum(c(1,2,3,4))
vmSum(c(1,2,"3",4))
vmSum(exam4(33))
#실습7
createVector<-function(...){
  num<-NULL
  char<-NULL
  logi<-NULL
  if(length(c(...))==0){
    return()
  }else{
    data<-list(...)
    for(item in data){
      if(is.numeric(item)){
        num <- append(num,item)
      }else if(is.character(item)){
        char <- append(char,item)
      }else if(is.logical(item))
        logi <- append(logi,item)
      }
    }
  return(list(numb=num,char=char,logic=logi))
}

createVector()
createVector(10,2,"dd",10,20,TRUE)
#실습8
number<-scan("iotest1.txt")
sort(number)
sort(number, decreasing = T)
sum(number)
mean(number)
#실습9
word<-scan("iotest2.txt",what = )
factor(word)
most<-sort(summary(factor(word)),decreasing = T)[1]
cat("가장 많이 등장한 단어는",names(most),"입니다.")
