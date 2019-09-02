df <- read.csv("지역별장애인도서관정보.csv", stringsAsFactors=F)

mut_df_add <- mutate_geocode(df_add, address, source="google")
map_korea <- get_map(location="Seoul", zoom=11, maptype="roadmap") 
ggmap(map_korea)+ 
  geom_point(data = df, aes(x = df$LON, y = df$LAT), colour = 'green', size = 4)+
  geom_text(data=df,aes(x = df$LON, y = df$LAT, label=df$도서관명, vjust=-1))
ggsave("map1.png")
