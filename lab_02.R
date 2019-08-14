#문제2
tmp<-seq(10,38,2)
tmp
m1<-matrix(tmp, 3,5, byrow=T)
m1
m2<-m1+100
m_max_v<-max(m1)
m_min_v<-min(m1)
row_max<-apply(m1, 1, max)
col_max<-apply(m1, 2, max)
m1;m2;m_max_v;m_min_v;row_max;col_max
#문제6
n1<-1:3
n2<-4:6
n3<-7:9
m1<-cbind(n1,n2,n3)
#문제7
tmp<-1:9
m2<-matrix(tmp,3,3, byrow=T)
#문제8
m3<-m2
rownames(m3)<-c("row1","row2","row3")
colnames(m3)<-c("col1","col2","col3")
m3
#문제9
tmp<-letters[1:6]
alpha<-matrix(tmp,2,3)
alpha
alpha2<-rbind(alpha,c("x","y","z"))
alpha3<-cbind(alpha,c("s","p"))
