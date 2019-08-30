#오늘의 요일에 맞는 지도 타입
today<-Sys.Date()
today<-weekdays(today)
type<-NULL
if(today=="월요일"|today=="화요일"){
  type<-"terrain"
}
if(today=="수요일"|today=="목요일"){
  type<-"satellite"
}
if(today=="금요일"){
  type<-"roadmap"
}
if(today=="토요일"|today=="일요일"){
  type<-"hybrid"
}
type
#지도
library(ggmap)
register_google(key='AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY')

mk <- geocode(enc2utf8("언주로 70길 10"), source = "google")
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype=type,zoom=12, marker=mk)
ggmap(map)+
  labs(title="현수의 집",x="경도", y="위도")
#저장
ggsave("mymap.png")
